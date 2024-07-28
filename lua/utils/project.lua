local M = {}

local function check_directory_for_files(directory, target_files)
  -- 获取当前目录下的所有文件和目录
  local files_and_dirs = vim.fn.glob(directory .. "/*", true, true)

  -- 遍历每个文件和目录
  for _, path in ipairs(files_and_dirs) do
    -- 获取文件名
    local name = vim.fn.fnamemodify(path, ":t")
    -- 检查是否为目录
    local is_directory = vim.fn.isdirectory(path) == 1

    -- 如果是文件，检查是否是目标文件或 .java 文件
    if not is_directory then
      for _, target_file in ipairs(target_files) do
        if name == target_file then
          return true -- 找到目标文件，返回 true
        end
      end
      if name:match("%.java$") then
        return true -- 找到 .java 文件，返回 true
      end
      -- 如果是目录，递归检查其子目录
    elseif is_directory then
      if check_directory_for_files(path, target_files) then
        return true -- 子目录中找到目标文件，返回 true
      end
    end
  end

  return false -- 没有找到任何目标文件或 .java 文件，返回 false
end

function M.is_java_project()
  local java_project_files = { "pom.xml", "build.gradle", "src/main/java" }
  local cwd = vim.fn.getcwd() -- 获取当前工作目录

  return check_directory_for_files(cwd, java_project_files)

  --[[ for _, file in ipairs(java_project_files) do
    vim.print(cwd .. "/" .. file)
    if vim.fn.glob(cwd .. "/" .. file) ~= "" then
      return true
    end
  end
  return false ]]
end

function M.is_project_enabled()
  if vim.g.project_enabled then
    return { import = "lazyvim.plugins.extras.util.project" }
  end
  return nil
end

return M

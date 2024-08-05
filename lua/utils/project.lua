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

function M.get_spring_path()
  local spring_path = require("mason-registry").get_package("spring-boot-tools"):get_install_path()
  return spring_path
end

function M.get_jdtls_bundles(opts)
  local mason_registry = require("mason-registry")
  local bundles = {}

  local jar_patterns = {
    M.get_spring_path() .. "/extension/jars/*.jar",
  }

  if opts.dap and LazyVim.has("nvim-dap") and mason_registry.is_installed("java-debug-adapter") then
    local java_dbg_pkg = mason_registry.get_package("java-debug-adapter")
    local java_dbg_path = java_dbg_pkg:get_install_path()
    vim.list_extend(jar_patterns, {
      java_dbg_path .. "/extension/server/com.microsoft.java.debug.plugin-*.jar",
    })
    -- java-test also depends on java-debug-adapter.
    if opts.test and mason_registry.is_installed("java-test") then
      local java_test_pkg = mason_registry.get_package("java-test")
      local java_test_path = java_test_pkg:get_install_path()
      vim.list_extend(jar_patterns, {
        java_test_path .. "/extension/server/*.jar",
      })
    end
  end

  for _, jar_pattern in ipairs(jar_patterns) do
    for _, bundle in ipairs(vim.split(vim.fn.glob(jar_pattern), "\n")) do
      table.insert(bundles, bundle)
    end
  end

  return bundles
end

return M

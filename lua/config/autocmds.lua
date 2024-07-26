local function augroup(name)
  return vim.api.nvim_create_augroup("nebula_" .. name, { clear = true })
end

local api = vim.api

-- 不自动注释新行
api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })

if not vim.g.neotree_enabled then
  api.nvim_create_autocmd("FileType", {
    pattern = {
      "NvimTree",
    },
    callback = function()
      vim.b.miniindentscope_disable = true
    end,
  })
end

local function is_java_project()
  local java_project_files = { "pom.xml", "build.gradle", "src/main/java" }
  local cwd = vim.fn.getcwd() -- 获取当前工作目录

  for _, file in ipairs(java_project_files) do
    if vim.fn.glob(cwd .. "/" .. file) ~= "" then
      return true
    end
  end
  return false
end

if is_java_project() then
  vim.api.nvim_create_autocmd({ "FileType", "BufRead", "BufNewFile" }, {
    pattern = { "xml", "java" },
    callback = function()
      vim.bo.shiftwidth = 4
      vim.bo.tabstop = 4
      vim.bo.expandtab = true
    end,
  })
end

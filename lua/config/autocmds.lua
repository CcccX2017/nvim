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
      "Outline",
    },
    callback = function()
      vim.b.miniindentscope_disable = true
    end,
  })
end

local function is_java_project()
  return require("utils.project").is_java_project()
end

vim.api.nvim_create_autocmd({ "FileType", "BufRead", "BufNewFile" }, {
  pattern = { "xml", "java" },
  callback = function()
    if is_java_project() then
      vim.bo.shiftwidth = 4
      vim.bo.tabstop = 4
      vim.bo.expandtab = true
    end
  end,
})

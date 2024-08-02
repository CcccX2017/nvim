-- 如果是java项目，则把缩进设置成4
if require("utils.project").is_java_project() then
  vim.opt.shiftwidth = 4
  vim.opt.tabstop = 4
  vim.opt.softtabstop = 4
end

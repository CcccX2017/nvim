local opt = vim.opt
local g = vim.g
-- set nvim-navic silence
g.navic_silence = true
g.neotree_enabled = false
g.project_enabled = true

-- if vim.uv.os_uname().sysname == "Windows_NT" then
--   g.editorconfig = false
-- end

g.transparent_enabled = false
if g.transparent_enabled then
  opt.winblend = 0
  opt.pumblend = 0
end

-- g.lazyvim_statuscolumn = {
--   folds_open = true, -- show fold sign when fold is open
--   folds_githl = true, -- highlight fold sign with git sign color
-- }

opt.swapfile = false
opt.backup = false
opt.backspace = "indent,eol,start"

opt.fillchars = {
  -- vert = " ", -- Remove vertical line
  eob = " ", -- 取消空行显示波浪线
}

opt.mousemoveevent = true

opt.cmdheight = 0

opt.autoindent = true

-- neovide配置
if g.neovide then
  vim.notify(g.neovide_version)
end

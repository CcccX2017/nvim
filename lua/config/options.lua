local opt = vim.opt
-- set nvim-navic silence
vim.g.navic_silence = true

vim.g.transparent_enabled = true
if vim.g.transparent_enabled then
  opt.winblend = 0
  opt.pumblend = 0
end

opt.swapfile = false
opt.backspace = "indent,eol,start"

opt.fillchars = {
  vert = " ", -- Remove vertical line
  eob = " ", -- 取消空行显示波浪线
}

opt.mousemoveevent = true

opt.cmdheight = 0

vim.g.neotree_enabled = false
vim.g.project_enabled = true

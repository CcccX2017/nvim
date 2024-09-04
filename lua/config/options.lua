local opt = vim.opt
local g = vim.g

g.neotree_enabled = false
g.project_enabled = true

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- if vim.uv.os_uname().sysname == "Windows_NT" then
--   g.editorconfig = false
-- end

g.transparent_enabled = true
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
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  -- vert = " ", -- Remove vertical line
  eob = " ", -- 取消空行显示波浪线
}

opt.mousemoveevent = true

opt.cmdheight = 0

opt.autoindent = true

local common = require("utils.common")
opt.guifont = { "FiraCode Nerd Font", "CaskaydiaMono Nerd Font", "Noto Sans SC", common.is_win and ":h12" or ":h16" }

-- neovide配置
if g.neovide then
  -- if g.transparent_enabled then
  --   g.neovide_transparency = 0.85
  --   g.transparency = 0
  -- end
  g.transparent_enabled = false
  g.neovide_floating_shadow = true
  g.neovide_floating_z_height = 10
  g.neovide_light_angle_degrees = 45
  g.neovide_light_radius = 5
  g.neovide_underline_stroke_scale = 1.0
  g.neovide_scale_factor = 1.0
  g.neovide_text_gamma = 0.0
  g.neovide_text_contrast = 0.5
  g.neovide_input_macos_option_key_is_meta = "only_left"
  g.neovide_cursor_antialiasing = true
end

local M = {}

M.setup = function()
  local status_ok, gruvbox = pcall(require, "gruvbox")

  if not status_ok then
    return
  end

  local transparent = vim.g.transparent_enabled

  local c = gruvbox.palette
  local none = "NONE"

  gruvbox.setup({
    transparent_mode = transparent,
    overrides = {
      FloatBorder = {
        fg = c.bright_blue,
      },
      Pmenu = {
        bg = transparent and none or c.dark2,
      },
      TreesitterContextSeparator = {
        link = "TreesitterContextSeparator",
        fg = c.dark4,
      },
      TreesitterContext = {
        link = "TreesitterContext",
        bg = none,
      },
      StatusLine = {
        fg = c.dark1,
      },
      LazyH1 = {
        bg = transparent and none or c.bright_orange,
        fg = transparent and c.bright_orange or c.dark0,
        bold = true,
      },
      LazyButton = {
        bg = transparent and none or c.dark3,
        fg = transparent and c.dark4 or c.light1,
      },
      LazyButtonActive = {
        bg = transparent and none or c.dark3,
        fg = transparent and c.bright_orange or c.light1,
      },
      MasonHeader = {
        bg = transparent and none or c.bright_yellow,
        fg = transparent and c.bright_yellow or c.dark0,
        bold = true,
      },
      MasonMutedBlock = {
        bg = transparent and none or c.light4,
        fg = transparent and c.dark4 or c.dark0,
        bold = true,
      },
      MasonHighlightBlockBold = {
        bg = transparent and none or c.bright_aqua,
        fg = transparent and c.bright_aqua or c.dark0,
        bold = true,
      },
    },
  })
end

return M

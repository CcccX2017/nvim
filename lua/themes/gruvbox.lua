local M = {}

M.setup = function()
  local transparent = vim.g.transparent_enabled

  local status_ok, gruvbox = pcall(require, "gruvbox")

  if not status_ok then
    return
  end

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
    },
  })
end

return M

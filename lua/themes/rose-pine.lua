local M = {}

M.setup = function()
  local status_ok, rose_pine = pcall(require, "rose-pine")

  if not status_ok then
    return
  end

  local transparent = vim.g.transparent_enabled
  local c = require("rose-pine.palette")

  rose_pine.setup({
    styles = {
      transparency = transparent,
    },
    highlight_groups = {
      StatusLine = {
        bg = c.base,
      },
      LazyH1 = {
        bg = transparent and "none" or c.gold,
        fg = transparent and c.gold or c.base,
        bold = true,
      },
      LazyButton = {
        bg = transparent and "none" or c.overlay,
        fg = transparent and c.subtle or c.text,
      },
      LazyButtonActive = {
        bg = transparent and "none" or c.highlight_med,
        fg = transparent and c.rose or c.text,
      },
      LazySpecial = {
        bg = "none",
        fg = transparent and c.rose or c.subtle,
      },
      MasonHeader = {
        bg = transparent and "none" or c.gold,
        fg = transparent and c.gold or c.base,
        bold = true,
      },
      MasonMutedBlock = {
        bg = transparent and "none" or c.muted,
        fg = transparent and c.subtle or c.text,
      },
      MasonHighlightBlockBold = {
        bg = transparent and "none" or c.rose,
        fg = transparent and c.rose or c.base,
        bold = true,
      },
      MasonHighlight = {
        fg = c.rose,
      },
      TreesitterContext = {
        bg = transparent and "none" or c.base,
      },
      TreesitterContextLineNumber = {
        bg = "none",
        fg = c.rose,
      },
      TreesitterContextSeparator = {
        bg = transparent and "none" or c.base,
        fg = c.muted,
      },
    },
  })
end

return M

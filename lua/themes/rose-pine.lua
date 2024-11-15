local M = {}

M.setup = function()
  local transparent = vim.g.transparent_enabled
  local status_ok, rose_pine = pcall(require, "rose-pine")

  if not status_ok then
    return
  end

  local c = require("rose-pine.palette")

  rose_pine.setup({
    styles = {
      transparency = transparent,
    },
    highlight_groups = {
      StatusLine = {
        bg = c.base,
      },
    },
  })
end

return M

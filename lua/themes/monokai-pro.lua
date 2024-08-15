local M = {}

local transparent = vim.g.transparent_enabled

M.setup = function()
  local status_ok, monokai_pro = pcall(require, "monokai-pro")
  if not status_ok then
    return
  end

  monokai_pro.setup({
    filter = "machine",
    transparent_background = transparent,
    background_clear = { "float_win", "telescope", "notify", "bufferline", "neo-tree", "nvim-tree" },
    override = function(c)
      return {
        DiffChange = {
          bg = transparent and "NONE" or c.diffEditor.modifiedLineBackground,
        },
        Directory = {
          bg = transparent and "NONE" or c.base.black,
        },
        TreesitterContextSeparator = {
          bg = "NONE",
          fg = c.base.dimmed4,
        },
        PmenuSel = {
          bg = c.base.cyan,
          fg = c.base.black,
        },
        LspInlayHint = {
          bg = "NONE",
          fg = c.editorInlayHint.foreground,
        },
      }
    end,
  })
end

return M

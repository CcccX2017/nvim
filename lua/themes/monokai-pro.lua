local M = {}

local transparent = vim.g.transparent_enabled

M.setup = function()
  local status_ok, monokai_pro = pcall(require, "monokai-pro")
  if not status_ok then
    return
  end

  monokai_pro.setup({
    filter = transparent and "pro" or "machine",
    transparent_background = transparent,
    background_clear = { "float_win", "telescope", "notify", "bufferline", "neo-tree", "nvim-tree" },
    override = function(c)
      local bg1 = "#373438"
      local bg2 = "#464347"

      return {
        DiffChange = {
          bg = transparent and "NONE" or c.diffEditor.modifiedLineBackground,
        },
        Directory = {
          bg = "NONE",
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
        BufferLineBackground = {
          bg = transparent and "NONE" or "#404a4f",
        },
        BufferLineCloseButton = {
          bg = transparent and "NONE" or bg1,
        },
        BufferLineBufferVisible = {
          bg = transparent and "NONE" or bg1,
        },
        BufferLineTab = {
          bg = transparent and "NONE" or bg2,
        },
        BufferLineInfo = {
          bg = transparent and "NONE" or bg2,
        },
        BufferLineInfoVisible = {
          bg = transparent and "NONE" or bg1,
        },
        BufferLinePick = {
          bg = transparent and "NONE" or bg2,
        },
        BufferLineError = {
          bg = transparent and "NONE" or bg2,
        },
        BufferLineWarning = {
          bg = transparent and "NONE" or bg2,
        },
        BufferLineModified = {
          bg = transparent and "NONE" or bg2,
        },
        BufferLineDuplicate = {
          bg = transparent and "NONE" or bg2,
        },
        BufferLineIndicator = {
          bg = transparent and "NONE" or bg2,
        },
        BufferLineSeparator = {
          bg = transparent and "NONE" or bg2,
        },
        BufferLineTabSeparator = {
          bg = transparent and "NONE" or bg2,
        },
        BufferLineHintDiagnostic = {
          bg = transparent and "NONE" or bg2,
        },
        BufferLinePickVisible = {
          bg = transparent and "NONE" or bg1,
        },
        BufferLineErrorVisible = {
          bg = transparent and "NONE" or bg1,
        },
        BufferLineInfoDiagnostic = {
          bg = transparent and "NONE" or bg2,
        },
        BufferLineWarningVisible = {
          bg = transparent and "NONE" or bg1,
        },
        BufferLineErrorDiagnostic = {
          bg = transparent and "NONE" or bg2,
        },
        BufferLineModifiedVisible = {
          bg = transparent and "NONE" or bg1,
        },
        BufferLineDuplicateVisible = {
          bg = transparent and "NONE" or bg1,
        },
        BufferLineIndicatorVisible = {
          bg = transparent and "NONE" or bg1,
        },
        BufferLineSeparatorVisible = {
          bg = transparent and "NONE" or bg1,
        },
        BufferLineWarningDiagnostic = {
          bg = transparent and "NONE" or bg2,
        },
        BufferLineCloseButtonVisible = {
          bg = transparent and "NONE" or bg1,
        },
        BufferLineInfoDiagnosticVisible = {
          bg = transparent and "NONE" or bg1,
        },
        BufferLineErrorDiagnosticVisible = {
          bg = transparent and "NONE" or bg1,
        },
        BufferLineWarningDiagnosticVisible = {
          bg = transparent and "NONE" or bg1,
        },
      }
    end,
  })
end

return M

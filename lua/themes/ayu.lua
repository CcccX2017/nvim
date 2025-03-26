local M = {}

local function get_overrides(transparent, c)
  local overrides = {
    TreesitterContext = {
      bg = "NONE",
    },
    RainbowDelimiterRed = {
      fg = c.vcs_removed,
    },
    RainbowDelimiterOrange = {
      fg = c.operator,
    },
    RainbowDelimiterYellow = {
      fg = c.accent,
    },
    RainbowDelimiterGreen = {
      fg = c.vcs_added,
    },
    RainbowDelimiterBlue = {
      fg = c.vcs_odified,
    },
    RainbowDelimiterViolet = {
      fg = c.lsp_parameter,
    },
    RainbowDelimiterCyan = {
      fg = c.tag,
    },
  }

  if transparent then
    overrides = vim.tbl_deep_extend("force", overrides, {
      Normal = { bg = "NONE" },
      NormalFloat = { bg = "NONE" },
      ColorColumn = { bg = "NONE" },
      SignColumn = { bg = "NONE" },
      Folded = { bg = "NONE" },
      FoldColumn = { bg = "NONE" },
      -- CursorLine = { bg = "NONE" },
      LineNr = { fg = "#585b70" },
      CursorLineNr = { bg = "NONE" },
      CursorColumn = { bg = "NONE" },
      WinSeparator = { bg = "NONE", fg = "#101521" },
      Pmenu = {
        bg = "none",
      },
      MasonHeader = { bg = "NONE", fg = "#dca561", bold = true },
      MasonMutedBlock = { bg = "NONE", fg = "#888888" },
      MasonHighlightBlockBold = { bg = "NONE", fg = "#56b6c2", bold = true },
      LazyH1 = { bg = "NONE", fg = "#ffad66", bold = true },
      LazyButton = { link = "LazyButton", bg = "NONE" },
      LazyButtonActive = { bg = "NONE", fg = "#ffad66" },
    })
  end

  return overrides
end

M.setup = function()
  local transparent = vim.g.transparent_enabled

  local status_ok, ayu = pcall(require, "ayu")

  if not status_ok then
    return
  end

  local c = require("ayu.colors")
  c.generate(true)

  ayu.setup({
    mirage = true,
    overrides = get_overrides(transparent, c),
  })
end

return M

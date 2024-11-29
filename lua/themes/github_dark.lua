local M = {}

M.rainbow_delimiters = function()
  local palette = require("github-theme.palette").load("github_dark")
  vim.cmd([[highlight RainbowDelimiterRed guifg=]] .. palette.red.base)
  vim.cmd([[highlight RainbowDelimiterOrange guifg=]] .. palette.orange)
  vim.cmd([[highlight RainbowDelimiterYellow guifg=]] .. palette.yellow.base)
  vim.cmd([[highlight RainbowDelimiterGreen guifg=]] .. palette.green.base)
  vim.cmd([[highlight RainbowDelimiterBlue guifg=]] .. palette.blue.base)
  vim.cmd([[highlight RainbowDelimiterViolet guifg=]] .. palette.magenta.base)
  vim.cmd([[highlight RainbowDelimiterCyan guifg=]] .. palette.cyan.base)
end

M.setup = function()
  local status_ok, github_theme = pcall(require, "github-theme")

  if not status_ok then
    return
  end

  local transparent = vim.g.transparent_enabled
  local none = "NONE"

  M.rainbow_delimiters()

  github_theme.setup({
    options = {
      transparent = transparent,
    },
    groups = {
      github_dark = {
        Pmenu = {
          bg = transparent and none or "#252a31",
        },
        TreesitterContextSeparator = {
          fg = "#42484f",
        },
        TreesitterContext = {
          bg = none,
        },
        StatusLine = {
          bg = "#32373d",
        },
        FloatBorder = {
          fg = "palette.fg.muted",
        },
        -- lazy.nvim
        LazyH1 = {
          bg = transparent and none or "palette.orange",
          fg = transparent and "palette.orange" or "palette.black.bright",
          style = "bold",
        },
        LazyButton = {
          bg = transparent and none or "#484f58",
          fg = transparent and "palette.gray.bright" or "palette.fg.default",
        },
        LazyButtonActive = {
          bg = transparent and none or "#304d75",
          fg = transparent and "palette.orange" or "palette.fg.default",
          style = "bold",
        },
        LazySpecial = {
          fg = "#a6e3a1",
        },
        MasonHeader = {
          bg = transparent and none or "#dca561",
          fg = transparent and "#dca561" or "#222222",
          style = "bold",
        },
        MasonMutedBlock = {
          bg = transparent and none or "#888888",
          fg = transparent and "palette.gray.bright" or "#222222",
          style = "bold",
        },
        MasonHighlightBlockBold = {
          bg = transparent and none or "#56b6c2",
          fg = transparent and "#56b6c2" or "#222222",
          style = "bold",
        },
      },
    },
  })

  vim.defer_fn(function()
    vim.cmd("hi! link StatusLine StatusLine")
  end, 100)
end

return M

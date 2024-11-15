local M = {}

M.setup = function()
  vim.g.transparent_enabled = false
  local status_ok, ayu = pcall(require, "ayu")

  if not status_ok then
    return
  end

  local c = require("ayu.colors")
  c.generate(true)

  ayu.setup({
    mirage = true,
    overrides = {
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
        fg = c.vcs_modified,
      },
      RainbowDelimiterViolet = {
        fg = c.lsp_parameter,
      },
      RainbowDelimiterCyan = {
        fg = c.tag,
      },
    },
  })
end

return M

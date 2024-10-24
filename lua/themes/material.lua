local M = {}

local themes = {
  darker = "darker",
  lighter = "lighter",
  oceanic = "oceanic",
  palenight = "palenight",
  deep_ocean = "deep ocean",
}

M.setup = function()
  local status_ok, material = pcall(require, "material")
  if not status_ok then
    return
  end

  vim.g.material_style = themes.oceanic

  local colors = require("material.colors")
  material.setup({
    disable = {
      background = vim.g.transparent_enabled,
    },
    async_loading = false,
    styles = {
      keywords = { bold = true },
      functions = { italic = true },
    },
    plugins = {
      "dashboard",
      "flash",
      "gitsigns",
      "indent-blankline",
      "lspsaga",
      -- "mini",
      "neo-tree",
      "noice",
      "nvim-cmp",
      "nvim-navic",
      "nvim-tree",
      "nvim-web-devicons",
      "rainbow-delimiters",
      "telescope",
      "trouble",
      "which-key",
      "nvim-notify",
    },
    custom_highlights = {
      DashboardHeader = {
        fg = colors.main.blue,
      },
      DashboardIcon = {
        fg = colors.main.paleblue,
      },
      DashboardDesc = {
        link = "DashboardIcon",
      },
      DashboardKey = {
        fg = colors.main.darkgreen,
      },
      StatusLine = {
        bg = colors.editor.selection,
      },
      TreesitterContext = {
        bg = vim.g.transparent_enabled and "none" or colors.editor.bg,
      },
      TreesitterContextLineNumber = {
        bg = vim.g.transparent_enabled and "none" or colors.editor.bg,
      },
      MiniIconsAzure = {
        link = "MiniIconsAzure",
        italic = false,
        fg = colors.syntax.fn,
      },
      Pmenu = {
        bg = vim.g.transparent_enabled and "none" or colors.editor.selection,
      },
    },
  })
end

return M

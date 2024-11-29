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

  local transparent = vim.g.transparent_enabled

  local colors = require("material.colors")
  material.setup({
    disable = {
      background = transparent,
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
        bg = transparent and "none" or colors.editor.bg,
      },
      TreesitterContextLineNumber = {
        bg = transparent and "none" or colors.editor.bg,
      },
      MiniIconsAzure = {
        link = "MiniIconsAzure",
        italic = false,
        fg = colors.syntax.fn,
      },
      Pmenu = {
        bg = transparent and "none" or colors.editor.selection,
      },
      MasonHeader = {
        bg = transparent and "none" or colors.main.darkyellow,
        fg = transparent and colors.main.darkyellow or colors.main.black,
        bold = true,
      },
      MasonMutedBlock = {
        bg = transparent and "none" or "#888888",
        fg = transparent and "#888888" or colors.main.black,
      },
      MasonHighlightBlockBold = {
        bold = true,
        bg = transparent and "none" or "#56b6c2",
        fg = transparent and "#56b6c2" or colors.main.black,
      },
      LazyH1 = {
        bold = true,
        bg = transparent and "none" or colors.main.cyan,
        fg = transparent and colors.main.cyan or colors.editor.title,
      },
      LazyButtonActive = {
        bg = transparent and "none" or colors.main.cyan,
        fg = transparent and colors.main.cyan or colors.editor.title,
        bold = true,
      },
      NoiceFormatProgressDone = {
        bg = colors.editor.selection,
      },
    },
  })
end

return M

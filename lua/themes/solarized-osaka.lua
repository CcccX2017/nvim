local M = {}

M.setup = function()
  local status_ok, solarized_osaka = pcall(require, "solarized-osaka")

  if not status_ok then
    return
  end

  local transparent = vim.g.transparent_enabled

  solarized_osaka.setup({
    transparent = transparent,
    terminal_colors = true,
    style = {
      comments = { italic = true },
      keywords = { italic = true },
      functions = {},
      variables = {},
      sidebars = transparent and "transparent" or "dark",
      floats = transparent and "transparent" or "dark",
    },
    sidebars = { "qf", "help" },
    day_brightness = 0.3,
    hide_inactive_statusline = false,
    dim_inactive = false,
    lualine_bold = false,
    on_highlights = function(hl, c)
      local util = require("solarized-osaka.util")
      local markdown_rainbow = { c.blue, c.yellow, c.green, c.red, c.magenta, c.cyan }
      for i, color in ipairs(markdown_rainbow) do
        hl["@markup.heading." .. i .. ".markdown"] = { fg = color, bold = true }
        hl["Headline" .. i] = { bg = util.darken(color, 0.05) }
        hl["keyword.tsx"] = { fg = util.darken(c.green500, 0.85) }
        hl["keyword.return.tsx"] = { fg = util.darken(c.green500, 0.85) }
        hl["keyword.javascript"] = { fg = util.darken(c.green500, 0.85) }
        hl["keyword.return.javascript"] = { fg = util.darken(c.green500, 0.85) }
      end
      hl.CursorLineNr = { fg = c.cyan500 }
      hl.LineNrAbove = { fg = c.orange700 }
      hl.LineNrBelow = { fg = c.orange700 }
      hl.NormalFloat = {
        bg = transparent and c.none or c.bg,
        fg = c.base0,
      }
      hl.FloatTitle = {
        bg = transparent and c.none or c.bg,
        fg = c.base2,
      }
      hl.FloatBorder = {
        bg = transparent and c.none or c.bg,
        fg = c.yellow700,
      }
      hl.TreesitterContext = {
        bg = c.none,
      }
      hl.NvimTreeNormal = {
        bg = transparent and c.none or c.bg,
        fg = c.base00,
      }
      hl.NvimTreeNormalNC = {
        bg = transparent and c.none or c.bg,
        fg = c.base00,
      }
      hl.NvimTreeWinSeparator = {
        fg = transparent and c.border or c.bg_sidebar,
        bg = transparent and c.none or c.bg_sidebar,
      }
      hl.Pmenu = {
        bg = transparent and c.none or c.base02,
        fg = c.base0,
      }
      hl.TelescopeNormal = {
        bg = transparent and c.none or c.base04,
        fg = c.base0,
      }
      hl.TelescopeBorder = {
        bg = transparent and c.none or c.base04,
        fg = transparent and c.blue or c.base02,
      }
      hl.MiniFilesTitleFocused = {
        bg = transparent and c.none or c.bg,
        fg = c.cyan,
      }
      hl.LspInlayHint = {
        bg = c.none,
        fg = c.base01,
      }
      hl.LazyH1 = {
        bg = transparent and c.none or c.orange,
        fg = transparent and c.orange or c.black,
        bold = true,
      }
      hl.LazyButton = {
        bg = transparent and c.none or c.base03,
        fg = transparent and c.base01 or c.base1,
      }
      hl.LazyButtonActive = {
        bg = transparent and c.none or c.base1,
        fg = c.orange,
      }
      hl.MasonHeader = {
        bg = transparent and c.none or c.orange100,
        fg = transparent and c.orange100 or c.black,
        bold = true,
      }
      hl.MasonMutedBlock = {
        bg = transparent and c.none or "#888888",
        fg = transparent and c.base01 or "#222222",
      }
      hl.MasonHighlightBlockBold = {
        bg = transparent and c.none or "#56b6c2",
        fg = transparent and "#56b6c2" or "#222222",
      }
      hl.WhichKeyBorder = {
        bg = transparent and c.none or "#001419",
        fg = "#063540",
      }
    end,
  })
end

return M

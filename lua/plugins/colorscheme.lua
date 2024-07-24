---@diagnostic disable: inject-field
local transparent = vim.g.transparent_enabled
return {
  {
    "folke/tokyonight.nvim",
    lazy = true,
    priority = 1000,
    config = function()
      local bg = "#011628"
      local bg_dark = "#011423"
      local bg_highlight = "#143652"
      local bg_search = "#0A64AC"
      local bg_visual = "#275378"
      local fg = "#CBE0F0"
      local fg_dark = "#B4D0E9"
      local fg_gutter = "#627E97"
      local border = "#547998"
      require("tokyonight").setup({
        style = "storm",
        transparent = transparent,
        styles = {
          functions = { italic = true },
          sidebars = transparent and "transparent" or "dark",
          floats = transparent and "transparent" or "dark",
        },
        cache = false,
        on_colors = function(colors)
          colors.bg = bg
          colors.bg_dark = transparent and colors.none or bg_dark
          colors.bg_float = transparent and colors.none or bg_dark
          colors.bg_highlight = bg_highlight
          colors.bg_popup = bg_dark
          colors.bg_search = bg_search
          colors.bg_sidebar = transparent and colors.none or bg_dark
          colors.bg_statusline = transparent and colors.none or bg_dark
          colors.bg_visual = bg_visual
          colors.border = border
          colors.fg = fg
          colors.fg_dark = fg_dark
          colors.fg_float = fg
          colors.fg_gutter = fg_gutter
          colors.fg_sidebar = fg_dark
        end,

        on_highlights = function(hl, c)
          if transparent then
            hl.Pmenu = {
              bg = c.none,
            }

            hl.FloatBorder = {
              bg = c.none,
              fg = c.todo,
            }
            hl.TreesitterContextLineNumber = {
              fg = "#f5e0dc",
            }
            hl.LazyH1 = {
              bg = c.none,
              fg = c.blue5,
            }
            hl.LazyButton = {
              bg = c.none,
              fg = c.fg_gutter,
            }
            hl.LazyButtonActive = {
              bg = c.none,
              fg = c.blue5,
            }
            hl.LazySpecial = {
              fg = "#a6e3a1",
            }
          end

          hl.EndOfBuffer = {
            fg = bg,
            bg = c.none,
          }

          hl.NonText = {
            fg = c.none,
            bg = c.none,
          }

          hl.PanelHeading = {
            fg = "#b4befe",
            bg = transparent and c.none or c.bg_dark,
            bold = true,
            italic = true,
          }

          hl.CursorLineNr = {
            fg = "#F1FAEE",
          }
        end,
      })
    end,
  },
}

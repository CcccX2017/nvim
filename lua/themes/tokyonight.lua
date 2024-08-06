local M = {}

local transparent = vim.g.transparent_enabled

local bg = "#011628"
local bg_dark = "#011423"
local bg_highlight = "#143652"
local bg_search = "#0A64AC"
local bg_visual = "#275378"
local fg = "#CBE0F0"
local fg_dark = "#B4D0E9"
local fg_gutter = "#627E97"
local border = "#547998"

local options = {
  style = "moon",
  transparent = transparent,
  styles = {
    keywords = { bold = true },
    functions = { italic = true },
    sidebars = transparent and "transparent" or "dark",
    floats = transparent and "transparent" or "dark",
  },
  cache = false,
  plugins = {
    all = package.loaded.lazy == nil,
    auto = true,
  },
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

      hl.TreesitterContext = {
        bg = bg_highlight,
      }

      hl.TreesitterContextLineNumber = {
        fg = "#f1faee",
      }

      hl.FloatBorder = {
        bg = c.none,
        fg = c.todo,
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

      hl.TelescopeResultsDiffChange = {
        bg = c.none,
        fg = "#ffffff",
      }

      hl.LspInlayHint = {
        bg = c.none,
        fg = "#545c7e",
      }
    end

    hl.TelescopePromptBorder = {
      fg = c.bg_float,
      bg = c.none,
    }
    hl.TelescopePromptTitle = {
      fg = c.bg_float,
      bg = c.none,
    }

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
      bg = c.none,
    }
  end,
}

function M.setup()
  local status_ok, tokyonight = pcall(require, "tokyonight")
  if not status_ok then
    return
  end
  tokyonight.setup(options)
end

return M

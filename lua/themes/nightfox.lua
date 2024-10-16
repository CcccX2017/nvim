local M = {}

local none = "NONE"

local function set_groups(transparent)
  local all = {
    NormalFloat = {
      bg = transparent and none or "palette.bg1",
    },
    Pmenu = {
      bg = transparent and none or "palette.bg1",
    },
    -- PmenuSel = {
    --   bg = "palette.blue",
    --   fg = "palette.bg0",
    -- },
    LspInlayHint = {
      bg = none,
      fg = "palette.comment",
    },
    TreesitterContextSeparator = {
      fg = "palette.bg3",
    },
    DiffChange = {
      bg = none,
    },
    DashboardKey = {
      fg = "palette.orange",
    },
    DashboardIcon = {
      fg = "palette.fg0",
    },
    DashboardDesc = {
      link = "DashboardIcon",
    },
    TelescopePromptTitle = {
      fg = "palette.red",
    },
    TelescopeResultsTitle = {
      fg = "palette.blue",
    },
    TelescopePreviewTitle = {
      fg = "palette.green",
    },
  }

  if transparent then
    all.LazyH1 = {
      bg = none,
      fg = "palette.cyan",
      style = "bold",
    }
    all.LazyButton = {
      link = "LazyButton",
      bg = none,
    }
    all.LazySpecial = {
      fg = "palette.green",
    }
    all.LazyButtonActive = {
      bg = none,
      fg = "palette.cyan",
    }
    all.MasonHeader = {
      bg = none,
      fg = "palette.cyan",
    }
    all.MasonMutedBlock = {
      bg = none,
      fg = "palette.fg2",
    }
    all.MasonHighlightBlockBold = {
      bg = none,
      fg = "palette.cyan",
      style = "bold",
    }
    all.StatusLine = {
      bg = none,
    }
  end

  local groups = {
    all = all,
  }

  return groups
end

local function set_rainbow_color()
  local palette = require("nightfox.palette").load("nightfox")
  vim.cmd([[highlight RainbowDelimiterRed guifg=]] .. palette.red.base)
  vim.cmd([[highlight RainbowDelimiterOrange guifg=]] .. palette.orange.base)
  vim.cmd([[highlight RainbowDelimiterYellow guifg=]] .. palette.yellow.base)
  vim.cmd([[highlight RainbowDelimiterGreen guifg=]] .. palette.green.base)
  vim.cmd([[highlight RainbowDelimiterBlue guifg=]] .. palette.blue.base)
  vim.cmd([[highlight RainbowDelimiterViolet guifg=]] .. palette.magenta.base)
  vim.cmd([[highlight RainbowDelimiterCyan guifg=]] .. palette.cyan.base)
end

M.setup = function()
  local status_ok, nightfox = pcall(require, "nightfox")
  if not status_ok then
    return
  end

  set_rainbow_color()

  local transparent = vim.g.transparent_enabled

  nightfox.setup({
    options = {
      transparent = transparent,
      styles = {
        keywords = "bold",
        functions = "italic",
      },
    },
    groups = set_groups(transparent),
  })
end

return M

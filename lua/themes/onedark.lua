local M = {}

local transparent = vim.g.transparent_enabled

function M.setup()
  local status_ok, onedark = pcall(require, "onedark")
  if not status_ok then
    return
  end

  local style = transparent and "dark" or "cool"
  local c = require("onedark.palette")[style]

  local highlights = {
    Pmenu = {
      bg = "NONE",
    },
    -- CursorLineNr = {
    --   -- fg = "#white",
    --   fg = c.cyan,
    --   bg = "NONE",
    -- },
    CursorLine = {
      bg = c.bg3,
    },
    TreesitterContextSeparator = {
      bg = "NONE",
      fg = "$surface1",
    },
    IblIndent = {
      fg = "$surface1",
    },
    MiniIndentscopeSymbol = {
      fg = c.cyan,
    },
    TelescopePromptTitle = {
      fg = c.red,
    },
    TelescopeResultsTitle = {
      fg = "$lavender",
    },
    TelescopePreviewTitle = {
      fg = c.green,
    },
    DiffChange = {
      bg = "NONE",
    },
    BufferLineIndicatorSelected = {
      fg = c.bg_blue,
    },
    DashboardFooter = {
      fg = "$rosewater",
    },
    DashboardHeader = {
      fg = c.bg_blue,
    },
    DashboardKey = {
      fg = c.bg_yellow,
    },
    FloatBorder = {
      bg = "NONE",
    },
    Visual = {
      bg = c.diff_text,
    },
    NormalFloat = {
      bg = c.bg0,
    },
  }
  if transparent then
    -- lazy.nvim
    highlights["LazyH1"] = {
      bg = "NONE",
      fg = "$lavender",
      style = { "bold" },
    }
    highlights["LazyButton"] = {
      bg = "NONE",
      fg = "$overlay0",
    }
    highlights["LazyButtonActive"] = {
      bg = "NONE",
      fg = "$lavender",
      style = { "bold" },
    }
    highlights["LazySpecial"] = {
      fg = c.green,
    }

    highlights["MasonHeader"] = {
      fg = transparent and "$lavender" or "#222222",
      bg = transparent and "NONE" or c.orange,
    }
    highlights["MasonHighlightBlockBold"] = {
      bg = "NONE",
      fg = c.cyan,
    }
    highlights["MasonMutedBlock"] = {
      bg = "NONE",
      fg = "$overlay0",
    }
    highlights["NormalFloat"] = {
      bg = "NONE",
    }
    highlights["CmpBorder"] = {
      fg = c.grey,
      bg = "NONE",
    }
    highlights["FloatTitle"] = {
      fg = "$lavender",
      bg = "NONE",
    }
  end

  onedark.setup({
    style = style,
    transparent = transparent,
    code_style = {
      comments = "none",
      keywords = "bold",
      functions = "italic",
    },
    lualine = {
      transparent = transparent,
    },
    colors = {
      surface0 = "#313244",
      surface1 = "#45475a",
      surface2 = "#585b70",
      lavender = "#b4befe",
      teal = "#94e2d5",
      white = "#F1FAEE",
      rosewater = "#f5e0dc",
      overlay0 = "#6c7086",
    },
    highlights = highlights,
  })
end

return M

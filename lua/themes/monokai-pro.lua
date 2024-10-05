local M = {}

local function set_transparent_hl(hl, c)
  local transparent = vim.g.transparent_enabled
  if transparent then
    local none = "NONE"
    hl.DiffChange = {
      bg = none,
    }
    hl.BufferLineBackground = {
      bg = none,
    }
    hl.BufferLineCloseButton = {
      bg = none,
    }
    hl.BufferLineBufferVisible = {
      bg = none,
    }
    hl.BufferLineTab = {
      bg = none,
    }
    hl.BufferLineInfo = {
      bg = none,
    }
    hl.BufferLineInfoVisible = {
      bg = none,
    }
    hl.BufferLinePick = {
      bg = none,
    }
    hl.BufferLineError = {
      bg = none,
    }
    hl.BufferLineWarning = {
      bg = none,
    }
    hl.BufferLineModified = {
      bg = none,
    }
    hl.BufferLineDuplicate = {
      bg = none,
    }
    hl.BufferLineIndicator = {
      bg = none,
    }
    hl.BufferLineSeparator = {
      bg = none,
    }
    hl.BufferLineTabSeparator = {
      bg = none,
    }
    hl.BufferLineHintDiagnostic = {
      bg = none,
    }
    hl.BufferLinePickVisible = {
      bg = none,
    }
    hl.BufferLineErrorVisible = {
      bg = none,
    }
    hl.BufferLineInfoDiagnostic = {
      bg = none,
    }
    hl.BufferLineWarningVisible = {
      bg = none,
    }
    hl.BufferLineErrorDiagnostic = {
      bg = none,
    }
    hl.BufferLineModifiedVisible = {
      bg = none,
    }
    hl.BufferLineDuplicateVisible = {
      bg = none,
    }
    hl.BufferLineIndicatorVisible = {
      bg = none,
    }
    hl.BufferLineSeparatorVisible = {
      bg = none,
    }
    hl.BufferLineWarningDiagnostic = {
      bg = none,
    }
    hl.BufferLineCloseButtonVisible = {
      bg = none,
    }
    hl.BufferLineInfoDiagnosticVisible = {
      bg = none,
    }
    hl.BufferLineErrorDiagnosticVisible = {
      bg = none,
    }
    hl.BufferLineWarningDiagnosticVisible = {
      bg = none,
    }
    hl.LazyNormal = {
      bg = none,
    }
    hl.LazyH1 = {
      bg = none,
      fg = c.base.cyan,
      bold = true,
    }
    hl.LazyButton = {
      bg = none,
    }
    hl.LazySpecial = {
      fg = c.base.green,
    }
    hl.LazyButtonActive = {
      bg = none,
      fg = c.base.cyan,
    }
    hl.LazyProgressTodo = {
      bg = none,
    }
    hl.LazyProgressDone = {
      bg = none,
      fg = c.base.red,
    }
  end
end

local function set_hl(c)
  local hl = {
    Directory = {
      bg = "NONE",
    },
    TreesitterContextSeparator = {
      bg = "NONE",
      fg = c.base.dimmed4,
    },
    -- PmenuSel = {
    --   bg = c.base.cyan,
    --   fg = c.base.black,
    -- },
    LspInlayHint = {
      bg = "NONE",
      fg = c.editorInlayHint.foreground,
    },
    BufferLineBufferSelected = {
      italic = true,
    },
  }

  set_transparent_hl(hl, c)

  return hl
end

M.setup = function()
  local status_ok, monokai_pro = pcall(require, "monokai-pro")
  if not status_ok then
    return
  end

  local transparent = vim.g.transparent_enabled

  monokai_pro.setup({
    filter = transparent and "pro" or "machine",
    transparent_background = transparent,
    background_clear = { "float_win", "telescope", "notify", "bufferline", "neo-tree", "nvim-tree" },
    override = function(c)
      return set_hl(c)
    end,
  })
end

return M

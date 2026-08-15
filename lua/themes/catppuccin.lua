local M = {}

function M.setup()
  local status_ok, catppuccin = pcall(require, "catppuccin")

  if not status_ok then
    return
  end

  local transparent_val = vim.g.transparent_enabled

  catppuccin.setup({
    flavour = transparent_val and "mocha" or "macchiato",
    float = {
      transparent = transparent_val,
      solid = false,
    },
    transparent_background = transparent_val,
    styles = {
      keywords = { "bold" },
      functions = { "italic" },
    },
    integrations = {
      aerial = true,
      alpha = true,
      cmp = true,
      dashboard = true,
      flash = true,
      grug_far = true,
      gitsigns = true,
      headlines = true,
      illuminate = true,
      indent_blankline = { enabled = true },
      leap = true,
      lsp_trouble = true,
      mason = true,
      markdown = true,
      mini = true,
      native_lsp = {
        enabled = true,
        underlines = {
          errors = { "undercurl" },
          hints = { "undercurl" },
          warnings = { "undercurl" },
          information = { "undercurl" },
        },
      },
      navic = { enabled = true, custom_bg = "lualine" },
      neotest = true,
      neotree = true,
      noice = true,
      notify = true,
      semantic_tokens = true,
      telescope = transparent_val,
      treesitter = true,
      treesitter_context = false,
      rainbow_delimiters = true,
      which_key = true,
    },
    custom_highlights = function(c)
      return {
        Pmenu = {
          bg = transparent_val and c.none or c.base,
        },
        NormalFloat = {
          bg = transparent_val and c.none or c.base,
        },
        -- PmenuSel = {
        --   bg = c.green,
        --   fg = c.base,
        -- },
        PanelHeading = {
          fg = c.lavender,
          bg = transparent_val and c.none or c.crust,
        },
        -- lazy.nvim
        LazyH1 = {
          bg = transparent_val and c.none or c.peach,
          fg = transparent_val and c.lavender or c.base,
          style = { "bold" },
        },
        LazyButton = {
          bg = c.none,
          fg = transparent_val and c.overlay0 or c.subtext0,
        },
        LazyButtonActive = {
          bg = transparent_val and c.none or c.overlay1,
          fg = transparent_val and c.lavender or c.base,
          style = { "bold" },
        },
        LazyNormal = {
          bg = transparent_val and c.none or c.mantle,
        },
        CmpItemMenu = { fg = c.subtext1 },
        FloatBorder = {
          fg = c.lavender,
          bg = transparent_val and c.none or c.base,
        },

        FloatTitle = {
          fg = transparent_val and c.lavender or c.base,
          bg = transparent_val and c.none or c.lavender,
        },
        LazySpecial = { fg = c.green },
        LineNr = {
          bg = c.none,
          fg = c.surface2,
        },
        -- CursorLineNr = {
        --   fg = c.lavender,
        --   bg = c.none,
        -- },
        DashboardIcon = {
          fg = c.lavender,
        },
        DashboardDesc = {
          fg = c.lavender,
        },
        TelescopeBorder = {
          fg = c.blue,
          bg = c.none,
        },
        TelescopePromptTitle = {
          fg = c.red,
        },
        TelescopeResultsTitle = {
          fg = c.lavender,
        },
        TelescopePreviewTitle = {
          fg = c.green,
        },
        DiffChange = {
          bg = c.none,
        },
        -- TreesitterContext
        TreesitterContext = {
          bg = transparent_val and c.none or c.base,
        },
        TreesitterContextSeparator = {
          bg = c.none,
          fg = c.surface0,
        },
        BufferLineIndicatorSelected = {
          fg = c.blue,
        },
      }
    end,
  })
end

return M

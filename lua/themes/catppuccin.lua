local M = {}

function M.setup()
  local transparent = vim.g.transparent_enabled

  local status_ok, catppuccin = pcall(require, "catppuccin")

  if not status_ok then
    return
  end

  catppuccin.setup({
    flavour = transparent and "mocha" or "macchiato",
    transparent_background = transparent,
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
      telescope = transparent,
      treesitter = true,
      treesitter_context = false,
      rainbow_delimiters = true,
      which_key = true,
    },
    custom_highlights = function(c)
      return {
        Pmenu = {
          bg = transparent and c.none or c.base,
        },
        NormalFloat = {
          bg = transparent and c.none or c.base,
        },
        -- PmenuSel = {
        --   bg = c.green,
        --   fg = c.base,
        -- },
        PanelHeading = {
          fg = c.lavender,
          bg = transparent and c.none or c.crust,
        },
        -- lazy.nvim
        LazyH1 = {
          bg = transparent and c.none or c.peach,
          fg = transparent and c.lavender or c.base,
          style = { "bold" },
        },
        LazyButton = {
          bg = c.none,
          fg = transparent and c.overlay0 or c.subtext0,
        },
        LazyButtonActive = {
          bg = transparent and c.none or c.overlay1,
          fg = transparent and c.lavender or c.base,
          style = { "bold" },
        },
        LazyNormal = {
          bg = transparent and c.none or c.mantle,
        },
        CmpItemMenu = { fg = c.subtext1 },
        FloatBorder = {
          fg = c.lavender,
          bg = transparent and c.none or c.base,
        },

        FloatTitle = {
          fg = transparent and c.lavender or c.base,
          bg = transparent and c.none or c.lavender,
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
          bg = transparent and c.none or c.base,
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

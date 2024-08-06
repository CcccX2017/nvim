local M = {}

local transparent = vim.g.transparent_enabled

function M.setup()
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
      telescope = { style = transparent and nil or "nvchad" },
      treesitter = true,
      treesitter_context = false,
      rainbow_delimiters = true,
      which_key = true,
    },
    custom_highlights = function(c)
      return {
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
        CmpItemMenu = { fg = c.subtext1 },
        FloatBorder = {
          fg = transparent and c.blue or c.mantle,
          bg = transparent and c.none or c.mantle,
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

        CursorLineNr = {
          fg = "#F1FAEE",
          bg = c.none,
        },
        TreesitterContext = {
          bg = "#363944",
        },
        DashboardIcon = {
          fg = c.blue,
        },
      }
    end,
  })
end

return M

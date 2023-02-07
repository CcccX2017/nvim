-- local colorscheme = "onedark"

-- -- local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
-- -- if not status_ok then
--   -- vim.notify("colorscheme " .. colorscheme .. " not found!")
--   -- return
-- -- end

-- if colorscheme == "onedark" then
--   require "codex.themes.onedark"
-- elseif colorscheme == "catppuccin" then
--   require "codex.themes.catppuccin"
-- end

require("catppuccin").setup({
  {
    transparent_background = true,
    term_colors = false,
    styles = {
      comments = {"underline"},
      functions = {"bold"},
      keywords = {"NONE"},
      strings = {"underline"},
      variables = {"NONE"},
    },
    integrations = {
      treesitter = true,
      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = {"italic"},
          hints = {"italic"},
          warnings = {"italic"},
          information = {"italic"},
        },
        underlines = {
          errors = {"underline"},
          hints = {"underline"},
          warnings = {"underline"},
          information = {"underline"},
        },
      },
      lsp_trouble = false,
      cmp = true,
      lsp_saga = false,
      gitgutter = false,
      gitsigns = true,
      telescope = true,
      nvimtree = {
        enabled = true,
        show_root = false,
        transparent_panel = false,
      },
      neotree = {
        enabled = false,
        show_root = false,
        transparent_panel = false,
      },
      which_key = true,
      indent_blankline = {
        enabled = true,
        colored_indent_levels = true,
      },
      dashboard = true,
      neogit = false,
      vim_sneak = false,
      fern = false,
      barbar = false,
      bufferline = true,
      markdown = true,
      lightspeed = false,
      ts_rainbow = false,
      hop = true,
      notify = true,
      telekasten = true,
      symbols_outline = true,
    }
  }
})

-- setup must be called before loading
vim.cmd.colorscheme "catppuccin"
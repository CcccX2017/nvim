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

-- require("catppuccin").setup({
--   {
--     transparent_background = true,
--     term_colors = false,
--     styles = {
--       comments = {"underline"},
--       functions = {"bold"},
--       keywords = {"NONE"},
--       strings = {"underline"},
--       variables = {"NONE"},
--     },
--     integrations = {
--       treesitter = true,
--       native_lsp = {
--         enabled = true,
--         virtual_text = {
--           errors = {"italic"},
--           hints = {"italic"},
--           warnings = {"italic"},
--           information = {"italic"},
--         },
--         underlines = {
--           errors = {"underline"},
--           hints = {"underline"},
--           warnings = {"underline"},
--           information = {"underline"},
--         },
--       },
--       lsp_trouble = false,
--       cmp = true,
--       lsp_saga = false,
--       gitgutter = false,
--       gitsigns = true,
--       telescope = true,
--       nvimtree = {
--         enabled = true,
--         show_root = false,
--         transparent_panel = false,
--       },
--       neotree = {
--         enabled = false,
--         show_root = false,
--         transparent_panel = false,
--       },
--       which_key = true,
--       indent_blankline = {
--         enabled = true,
--         colored_indent_levels = true,
--       },
--       dashboard = true,
--       neogit = false,
--       vim_sneak = false,
--       fern = false,
--       barbar = false,
--       bufferline = true,
--       markdown = true,
--       lightspeed = false,
--       ts_rainbow = false,
--       hop = true,
--       notify = true,
--       telekasten = true,
--       symbols_outline = true,
--     }
--   }
-- })

-- setup must be called before loading
-- vim.cmd.colorscheme "catppuccin"

require('nightfox').setup({
  options = {
    -- Compiled file's destination location
    compile_path = vim.fn.stdpath("cache") .. "/nightfox",
    compile_file_suffix = "_compiled", -- Compiled file suffix
    transparent = false,     -- Disable setting background
    terminal_colors = true,  -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
    dim_inactive = false,    -- Non focused panes set to alternative background
    module_default = true,   -- Default enable value for modules
    colorblind = {
      enable = false,        -- Enable colorblind support
      simulate_only = false, -- Only show simulated colorblind colors and not diff shifted
      severity = {
        protan = 0,          -- Severity [0,1] for protan (red)
        deutan = 0,          -- Severity [0,1] for deutan (green)
        tritan = 0,          -- Severity [0,1] for tritan (blue)
      },
    },
    styles = {               -- Style to be applied to different syntax groups
      comments = "NONE",     -- Value is any valid attr-list value `:help attr-list`
      conditionals = "NONE",
      constants = "NONE",
      functions = "NONE",
      keywords = "NONE",
      numbers = "NONE",
      operators = "NONE",
      strings = "NONE",
      types = "NONE",
      variables = "NONE",
    },
    inverse = {             -- Inverse highlight for different types
      match_paren = false,
      visual = false,
      search = false,
    },
    modules = {             -- List of various plugins and additional options
      -- ...
    },
  },
  palettes = {},
  specs = {},
  groups = {},
})

vim.cmd.colorscheme "nightfox"



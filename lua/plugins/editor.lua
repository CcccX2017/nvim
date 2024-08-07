return {
  {
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
    keys = {
      { "<leader>cs", "<cmd>Outline<CR>", desc = "Toggle outline" },
    },
    config = function()
      local defaults = require("outline.config").defaults
      local icons = require("utils.icons")

      local opts = {
        symbols = {
          icons = {},
          filter = nil,
        },
        keymaps = {
          up_and_jump = "<up>",
          down_and_jump = "<down>",
        },
      }

      for kind, symbol in pairs(defaults.symbols.icons) do
        opts.symbols.icons[kind] = {
          icon = icons.kind[kind] or symbol.icon,
          hl = symbol.hl,
        }
      end

      require("outline").setup(opts)
    end,
  },
  {
    "vidocqh/auto-indent.nvim",
    event = "LazyFile",
    opts = {},
  },
  {
    -- 多光标支持
    "mg979/vim-visual-multi",
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      fast_wrap = {
        map = "<M-e>",
        chars = { "{", "[", "(", '"', "'" },
        pattern = [=[[%'%"%>%]%)%}%,]]=],
        end_key = "$",
        keys = "qwertyuiopzxcvbnmasdfghjkl",
        check_comma = true,
        highlight = "Search",
        highlight_grey = "Comment",
      },
      disable_filetype = { "TelescopePrompt", "vim" },
    },
    config = function(_, opts)
      require("nvim-autopairs").setup(opts)

      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = true,
    keys = {
      {
        "<C-t>",
        "<cmd>ToggleTerm<cr>",
        desc = "ToggleTerm",
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-file-browser.nvim",
    },
    opts = {
      defaults = {
        prompt_prefix = require("utils.icons").ui.Telescope,
        selection_caret = "󰈺 ",
      },
      extensions = {
        file_browser = {
          theme = "dropdown",
          respect_gitignore = false,
          hidden = true,
          grouped = false,
          previewer = true,
          initial_mode = "normal",
        },
      },
      -- pickers = {
      --   find_files = {
      --     theme = "dropdown",
      --     previewer = true,
      --   },
      --   live_grep = {
      --     theme = "dropdown",
      --   },
      --   buffers = {
      --     theme = "dropdown",
      --     previewer = false,
      --   },
      -- },
    },
    keys = {
      {
        "<leader>fP",
        function()
          require("telescope.builtin").find_files({
            cwd = require("lazy.core.config").options.root,
          })
        end,
        desc = "Find Plugin File",
      },
      {
        "<leader>sf",
        function()
          local telescope = require("telescope")

          local function telescope_buffer_dir()
            return vim.fn.expand("%:p:h")
          end

          telescope.extensions.file_browser.file_browser({
            path = "%:p:h=%:p:h",
            cwd = telescope_buffer_dir(),
          })
        end,
        desc = "File Browser",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    opts = {
      separator = "─",
    },
  },
}

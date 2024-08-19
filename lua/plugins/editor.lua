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
    config = function()
      require("auto-indent").setup({
        lightmode = true,
        indentexpr = nil,
        ignore_filetype = {},
      })
    end,
  },
  {
    -- 多光标支持
    "mg979/vim-visual-multi",
    event = "LazyFile",
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
    cmd = { "ToggleTerm", "TermExec" },
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
      {
        "danielfalk/smart-open.nvim",
        enabled = require("utils.common").is_win == false,
        branch = "0.2.x",
        dependencies = {
          "kkharji/sqlite.lua",
          { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },
        config = function()
          require("telescope").load_extension("smart_open")
          local common = require("utils.common")
          if not common.is_win then
            vim.keymap.set("n", "<leader><space>", function()
              require("telescope").extensions.smart_open.smart_open({
                theme = "dropdown",
                match_algorithm = "fzf",
              })
            end, { desc = "Search Files By Name", silent = true, noremap = true })
          end
        end,
      },
    },
    opts = {
      defaults = {
        file_ignore_patterns = { ".git/", "node_modules" },
        prompt_prefix = require("utils.icons").ui.Telescope,
        selection_caret = "󰈺 ",
        path_display = { "smart" },
        layout_config = {
          height = 0.85,
          width = 0.75,
          preview_cutoff = 30,
          horizontal = { preview_width = 0.48 },
          vertical = { width = 0.55, height = 0.9, preview_cutoff = 30 },
          -- prompt_position = "top",
        },
        -- sorting_strategy = "ascending",
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
            path = "%:p:h",
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
  {
    "mbbill/undotree",
    cmd = { "UndotreeToggle" },
    config = function() end,
  },
  {
    "folke/which-key.nvim",
    opts = {
      icons = {
        rules = false,
        mappings = false,
      },
    },
  },
  {
    "mikavilpas/yazi.nvim",
    -- event = "VeryLazy",
    cmd = { "Yazi", "Yazi cwd", "Yazi toggle" },
    keys = {
      -- 👇 in this section, choose your own keymappings!
      {
        "yz",
        "<cmd>Yazi<cr>",
        desc = "Open yazi at the current file",
      },
      {
        -- Open in the current working directory
        "<leader>cw",
        "<cmd>Yazi cwd<cr>",
        desc = "Open the file manager in nvim's working directory",
      },
      -- {
      --   -- NOTE: this requires a version of yazi that includes
      --   -- https://github.com/sxyazi/yazi/pull/1305 from 2024-07-18
      --   "<c-up>",
      --   "<cmd>Yazi toggle<cr>",
      --   desc = "Resume the last yazi session",
      -- },
    },
    opts = {
      -- if you want to open yazi instead of netrw, see below for more info
      open_for_directories = false,

      -- enable these if you are using the latest version of yazi
      -- use_ya_for_events_reading = true,
      -- use_yazi_client_id_flag = true,

      keymaps = {
        show_help = "<f1>",
      },
    },
  },
  {
    "lambdalisue/vim-suda",
    cmd = { "SudaRead", "SudaWrite" },
    keys = {
      {
        "<leader>W",
        "<cmd>SudaWrite<cr>",
        desc = "写入只读文件",
      },
    },
  },
}

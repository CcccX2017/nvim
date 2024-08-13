return {
  {
    "nvim-tree/nvim-tree.lua",
    event = "VeryLazy",
    cmd = { "NvimTreeToggle", "NvimTreeOpen", "NvimTreeFocus", "NvimTreeFindFileToggle" },
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    enabled = not vim.g.neotree_enabled,
    keys = {
      {
        "<leader>e",
        "<cmd>NvimTreeToggle<cr>",
        desc = "NvimTreeToggle",
      },
    },
    config = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      local icon = require("utils.icons")
      require("nvim-tree").setup({
        disable_netrw = true,
        hijack_cursor = true,
        view = {
          adaptive_size = false,
          centralize_selection = true,
          -- width = {
          --   min = 30,
          --   max = 60,
          -- },
          width = 35,
        },
        sort = {
          sorter = "name",
          folders_first = true,
          files_first = false,
        },
        modified = {
          enable = true,
          show_on_dirs = false,
          show_on_open_dirs = true,
        },
        renderer = {
          group_empty = true,
          indent_markers = {
            enable = false,
            inline_arrows = true,
            icons = {
              corner = "└",
              edge = "│",
              item = "│",
              bottom = "─",
              none = " ",
            },
          },

          root_folder_label = function(path)
            return " " .. vim.fn.fnamemodify(path, ":~:s?$?")
          end,
          highlight_modified = "name",
          highlight_git = "name",
          icons = {
            webdev_colors = true,
            glyphs = {
              default = icon.ui.Text,
              modified = icon.git.LineAdded,
              bookmark = icon.ui.BookMark,
              git = {
                unstaged = icon.git.FileUnstaged,
                staged = icon.git.FileStaged,
                renamed = icon.git.FileRenamed,
                untracked = icon.git.FileUntracked,
              },
            },
          },
        },
        git = {
          enable = true,
          show_on_dirs = true,
          show_on_open_dirs = true,
          disable_for_dirs = {},
          timeout = 400,
          cygwin_support = false,
        },
        sync_root_with_cwd = vim.g.project_enabled,
        respect_buf_cwd = true,
        update_cwd = true,
        update_focused_file = {
          enable = true,
          update_cwd = true,
          update_root = vim.g.project_enabled,
          exclude = false,
        },
        hijack_directories = {
          enable = true,
          auto_open = true,
        },
        diagnostics = {
          enable = true,
          show_on_dirs = false,
          show_on_open_dirs = true,
          debounce_delay = 50,
          severity = {
            min = vim.diagnostic.severity.HINT,
            max = vim.diagnostic.severity.ERROR,
          },
          icons = {
            hint = icon.diagnostics.BoldHint,
            info = icon.diagnostics.BoldInformation,
            warning = icon.diagnostics.BoldWarning,
            error = icon.diagnostics.BoldError,
          },
        },
        filters = {
          enable = true,
          dotfiles = true,
          git_clean = false,
          git_ignored = false,
          no_bookmark = false,
          no_buffer = false,
          custom = {
            "node_modules",
            "\\.cache",
            -- "\\.idea",
            -- "\\.git",
            -- "\\.settings",
            -- "\\.DS_Store",
            "*.iml",
            -- "\\.classpath",
            -- "\\.factorypath",
            -- "\\.project",
          },
          exclude = {
            ".gitignore",
          },
        },
        on_attach = require("utils.nvimtree").on_attach,

        -- vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "NvimTreeToggle" }),
      })
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = vim.g.neotree_enabled,
    opts = {
      source_selector = {
        separator = "",
      },
      filesystem = {
        filtered_items = {
          always_show = {
            ".gitignore",
          },
        },
      },
      window = {
        width = 35,
      },
    },
  },
}

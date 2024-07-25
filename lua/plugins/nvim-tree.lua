local function on_attach(bufnr)
  local api = require("nvim-tree.api")

  local function telescope_find_files(_)
    require("utils.nvimtree").start_telescope("find_files")
  end

  local function telescope_live_grep(_)
    require("utils.nvimtree").start_telescope("live_grep")
  end

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  api.config.mappings.default_on_attach(bufnr)

  vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
  vim.keymap.set("n", "v", api.node.open.vertical, opts("Open: Vertical Split"))
  vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
  vim.keymap.set("n", "C", api.tree.change_root_to_node, opts("CD"))
  vim.keymap.set("n", "<leader>ep", api.tree.change_root_to_parent, opts("Telescope Find Files"))
  vim.keymap.set("n", "<leader>ec", api.tree.collapse_all, opts("Collapse All"))
  vim.keymap.set("n", "<leader>el", telescope_live_grep, opts("Telescope Live Grep"))
  vim.keymap.set("n", "<leader>ef", telescope_find_files, opts("Telescope Find Files"))
end

return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  enabled = not vim.g.neotree_enabled,
  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    local icon = require("utils.icons")
    require("nvim-tree").setup({
      view = {
        adaptive_size = false,
        centralize_selection = true,
        width = 30,
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
      sync_root_with_cwd = true,
      respect_buf_cwd = true,
      update_cwd = true,
      update_focused_file = {
        enable = true,
        update_cwd = true,
        update_root = true,
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
        exclude = {},
      },
      on_attach = on_attach,

      vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "NvimTreeToggle" }),
    })
  end,
}

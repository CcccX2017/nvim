return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local icon = require("utils.icons")

    -- disable netrw at the very start of your init.lua
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    require("nvim-tree").setup({
      view = {
        width = 35,
      },
      sort = {
        sorter = "name",
        folders_first = true,
        files_first = false,
      },
      modified = {
        enable = true,
        show_on_dirs = true,
        show_on_open_dirs = true,
      },
      renderer = {
        group_empty = true,
        -- highlight_opened_files = "icon",
        highlight_modified = "name",
        root_folder_label = function(path)
          return " " .. vim.fn.fnamemodify(path, ":~:s?$?")
        end,
        icons = {
          webdev_colors = true,
          glyphs = {
            default = icon.ui.Text,
            modified = "[+]",
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
      },
      update_focused_file = {
        enable = true,
        update_root = {
          enable = true,
          ignore_list = {},
        },
        exclude = false,
      },
    })
  end,
}

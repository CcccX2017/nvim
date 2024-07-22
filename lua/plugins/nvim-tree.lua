return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    -- disable netrw at the very start of your init.lua
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    require("nvim-tree").setup({
      view = {
        width = 30,
      },
      renderer = {
        group_empty = true,
        root_folder_label = function(path)
          return " " .. vim.fn.fnamemodify(path, ":~:s?$?")
        end,
        icons = {
          webdev_colors = true,
        },
      },
    })
  end,
}

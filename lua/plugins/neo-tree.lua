return {
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
}

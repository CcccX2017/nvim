return {
  "nvim-neo-tree/neo-tree.nvim",
  enabled = false,
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

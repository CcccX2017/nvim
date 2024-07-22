local icon = require("utils.icons")
return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      component_separators = { left = icon.left, right = icon.right },
    },
  },
}

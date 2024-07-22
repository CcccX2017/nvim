return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  opts = {
    options = {
      separator_style = { "", "" },
      hover = {
        enabled = true,
        delay = 50,
        reveal = { "close" },
      },
      offsets = {
        {
          filetype = "NvimTree",
          text = " 资源管理器",
          highlight = "Directory",
          text_align = "center",
        },
        {
          filetype = "neo-tree",
          text = " 资源管理器",
          highlight = "Directory",
          text_align = "center",
        },
      },
    },
  },
}

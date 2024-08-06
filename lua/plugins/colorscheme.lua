return {
  {
    "folke/tokyonight.nvim",
    lazy = true,
    priority = 1000,
    config = function()
      require("themes.tokyonight").setup()
    end,
  },
  {
    "catppuccin/nvim",
    lazy = true,
    priority = 1000,
    config = function()
      require("themes.catppuccin").setup()
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}

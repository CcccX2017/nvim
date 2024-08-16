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
    "navarasu/onedark.nvim",
    lazy = true,
    priority = 1000,
    config = function()
      require("themes.onedark").setup()
    end,
  },
  {
    -- "loctvl842/monokai-pro.nvim",
    "CcccX2017/monokai-pro.nvim",
    lazy = true,
    priority = 1000,
    config = function()
      require("themes.monokai-pro").setup()
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "monokai-pro",
    },
  },
}

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
    "EdenEast/nightfox.nvim",
    lazy = true,
    priority = 1000,
    config = function()
      require("themes.nightfox").setup()
    end,
  },
  {
    "marko-cerovac/material.nvim",
    lazy = true,
    priority = 1000,
    config = function()
      require("themes.material").setup()
    end,
  },
  {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    lazy = true,
    priority = 1000,
    config = function()
      require("themes.github_dark").setup()
    end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    lazy = true,
    config = function()
      require("themes.gruvbox").setup()
    end,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    lazy = true,
    config = function()
      require("themes.rose-pine").setup()
    end,
  },
  {
    "Shatur/neovim-ayu",
    priority = 1000,
    lazy = true,
    config = function()
      require("themes.ayu").setup()
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = function(_, opts)
      local colorscheme = require("utils.colorscheme")
      local theme = colorscheme.random()
      opts.colorscheme = theme

      vim.keymap.set("n", "<leader>bg", function()
        -- vim.g.transparent_enabled = not vim.g.transparent_enabled
        colorscheme.set_transparent(not vim.g.transparent_enabled)
        colorscheme.change_theme(theme)
      end, { noremap = true, silent = true, desc = "Toggle transparency" })

      vim.keymap.set("n", "<leader>bt", function()
        theme = colorscheme.toggle_random_enabled()
        colorscheme.change_theme(theme)
      end, { silent = true, noremap = true, desc = "Toggle Random theme" })
    end,
  },
}

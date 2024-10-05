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
    config = function()
      require("themes.material").setup()
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = function(_, opts)
      local theme = "nightfox"
      vim.keymap.set("n", "<leader>bg", function()
        vim.g.transparent_enabled = not vim.g.transparent_enabled
        require("themes." .. theme).setup()
        vim.cmd("colorscheme " .. theme)
      end, { noremap = true, silent = true, desc = "Toggle transparency" })
      opts.colorscheme = theme
    end,
  },
}

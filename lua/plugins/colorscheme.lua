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
    "LazyVim/LazyVim",
    opts = function(_, opts)
      local theme = require("themes.random.random_themes").random()
      opts.colorscheme = theme

      local function change_theme()
        require("themes." .. theme).setup()
        vim.cmd("colorscheme " .. theme)
      end

      vim.keymap.set("n", "<leader>bg", function()
        vim.g.transparent_enabled = not vim.g.transparent_enabled
        change_theme()
      end, { noremap = true, silent = true, desc = "Toggle transparency" })

      vim.keymap.set("n", "<leader>bt", function()
        theme = require("themes.random.random_themes").toggle_random_enabled()
        change_theme()
      end, { silent = true, noremap = true, desc = "Toggle Random theme" })
    end,
  },
}

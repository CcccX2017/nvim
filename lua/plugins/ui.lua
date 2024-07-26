return {
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      -- opts.lsp.override["cmp.entry.get_documentation"] = false

      -- 解决 No information available提示问题
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = {
          skip = true,
        },
      })

      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No LSP Definitions found",
        },
        opts = {
          skip = true,
        },
      })

      opts.presets.lsp_doc_border = true
    end,
  },
  -- animations
  {
    "echasnovski/mini.animate",
    event = "VeryLazy",
    opts = {
      open = {
        enable = false,
      },
      close = {
        enable = false,
      },
    },
  },
  {
    "nvimdev/dashboard-nvim",
    lazy = false,
    opts = function(_, opts)
      local logo = require("utils.logo").get_logo()

      opts.config.header = logo
    end,
  },
  {
    "hiphish/rainbow-delimiters.nvim",
    config = function()
      require("rainbow-delimiters.setup").setup({})
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    opts = {
      current_line_blame = true,
    },
  },
  -- {
  --   "nvim-tree/nvim-web-devicons",
  --   opts = function()
  --     local devicons = require("nvim-web-devicons")
  --     -- local MiniIcons = require("mini.icons")
  --     -- vim.notify(vim.inspect(devicons.get_icons()))
  --     local icons = devicons.get_icons()
  --     local json5 = icons["json5"]
  --     devicons.set_icon({
  --       icon = json5.icon,
  --       color = json5.color,
  --       cterm_color = json5.cterm_color,
  --       name = "Json",
  --     })
  --   end,
  -- },
}

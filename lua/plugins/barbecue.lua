return {
  {
    -- "utilyre/barbecue.nvim",
    "CcccX2017/barbecue.nvim",
    name = "barbecue",
    enabled = true,
    version = "*",
    event = "LazyFile",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    config = function()
      local icons = require("utils.icons")
      require("barbecue").setup({
        create_autocmd = false, -- prevent barbecue from updating itself automatically
        symbols = {
          separator = icons.left,
        },
      })

      vim.api.nvim_create_autocmd({
        "WinScrolled", -- or WinResized on NVIM-v0.9 and higher
        "BufWinEnter",
        "CursorHold",
        "InsertLeave",

        -- include this if you have set `show_modified` to `true`
        -- "BufModifiedSet",
      }, {
        group = vim.api.nvim_create_augroup("barbecue.updater", {}),
        callback = function()
          require("barbecue.ui").update()
        end,
      })
    end,
  },
  {
    "SmiteshP/nvim-navic",
    opts = {
      lsp = {
        auto_attach = true,
        preference = { "volar" },
      },
    },
  },
}

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
        attach_navic = false,
        create_autocmd = false, -- prevent barbecue from updating itself automatically
        symbols = {
          separator = icons.left,
        },
      })

      vim.api.nvim_create_autocmd({
        "WinResized",
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
    lazy = true,
    init = function()
      -- set nvim-navic silence
      vim.g.navic_silence = true

      local ignore_lsp = {
        vtsls = true,
        ["spring-boot"] = true,
      }

      LazyVim.lsp.on_attach(function(client, buffer)
        if client.supports_method("textDocument/documentSymbol") then
          if ignore_lsp[client.name] then
            return
          end
          require("nvim-navic").attach(client, buffer)
        end
      end)
    end,
    config = function()
      require("nvim-navic").setup({
        lsp = {
          auto_attach = false,
        },
      })
    end,
  },
}

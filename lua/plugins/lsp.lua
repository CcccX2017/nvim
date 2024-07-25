return {
  {
    "williamboman/mason.nvim",
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
      ensure_installed = {
        -- lsp
        "html-lsp",
        "emmet-ls",
        "css-lsp",
        "pyright",
        "vue-language-server",
        "vtsls",
        "json-lsp",
        "lemminx", -- xml
        -- formatter
        "prettierd",
        "isort", -- python formatter
        "black", -- python formatter
        "xmlformatter",
        -- linter
        -- "eslint-lsp",
        "pylint",
        "luacheck",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    opts = {
      ensure_installed = {
        "css",
        "scss",
        "dockerfile",
        "gitignore",
        "svelte",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers.volar = {
        vue = {
          hybridMode = require("utils.vue-version").setup_volar_hybrid_mode() == true,
        },
      }
    end,
  },
}

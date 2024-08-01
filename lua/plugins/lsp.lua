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
        -- "html-lsp",
        -- "emmet-ls",
        "css-lsp",
        "pyright",
        "vue-language-server",
        "vtsls",
        "json-lsp",
        -- "lemminx", -- xml
        "marksman", -- markdown
        -- formatter
        "prettierd",
        "isort", -- python formatter
        "black", -- python formatter
        -- "xmlformatter",
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
      indent = {
        enable = true,
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

      -- 配置lemminx-maven
      local lemminx_home = vim.env["LEMMINX_HOME"]
      if lemminx_home then
        local common = require("utils.common")

        local lemminx_jars = {}
        for _, bundle in ipairs(vim.split(vim.fn.glob(lemminx_home .. "/*.jar"), "\n")) do
          table.insert(lemminx_jars, bundle)
        end
        vim.fn.join(lemminx_jars, common.is_win and ";" or ":")

        opts.servers.lemminx = {
          cmd = {
            "java",
            "-cp",
            vim.fn.join(lemminx_jars, ":"),
            "org.eclipse.lemminx.XMLServerLauncher",
          },
        }
      end
    end,
  },
}

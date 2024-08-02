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
        disable = { "xml" },
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
  {
    "nvimdev/lspsaga.nvim",
    event = "LazyFile",
    keys = {
      -- {
      --   "<leader>cs",
      --   "<cmd>Lspsaga outline<cr>",
      --   desc = "Toggle Outline",
      -- },
    },
    opts = {
      ui = {
        border = "rounded",
        lines = { "└", "├", "│", "─", "┌" },
        expand = "",
        collapse = "",
      },
      symbol_in_winbar = {
        enable = true,
      },
      lightbulb = {
        sign = false,
      },
      outline = {
        win_position = "right",
        win_width = 30,
        detail = true,
        layout = "normal",
      },
    },
    config = function(_, opts)
      require("lspsaga").setup(opts)

      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      keys[#keys + 1] = { "K", "<cmd>Lspsaga hover_doc<cr>", desc = "Lspsaga hover doc" }
      keys[#keys + 1] = { "<leader>ca", "<cmd>Lspsaga code_action<cr>", desc = "Code Action" }
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },
}

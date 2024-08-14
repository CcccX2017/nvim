return {
  {
    "williamboman/mason.nvim",
    opts = {
      registries = {
        "github:mason-org/mason-registry",
        "github:nvim-java/mason-registry",
      },
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
        "marksman", -- markdown
        "spring-boot-tools",
        "jdtls",
        -- formatter
        -- "prettierd",
        "isort", -- python formatter
        "black", -- python formatter
        -- "xmlformatter",
        -- linter
        -- "eslint-lsp",
        "pylint",
        -- "luacheck",
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
        "java",
      },
      indent = {
        enable = true,
        disable = { "xml" },
      },
      auto_install = true,
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

      opts.servers.lua_ls.settings.Lua.hint = {
        enable = true,
        setType = false,
        paramType = true,
        paramName = "All",
        semicolon = "Disable",
        arrayIndex = "Disable",
      }

      -- 配置lemminx-maven
      local lemminx_home = vim.env["LEMMINX_HOME"]
      if lemminx_home then
        local common = require("utils.common")

        local lemminx_jars = {}
        for _, bundle in ipairs(vim.split(vim.fn.glob(lemminx_home .. "/*.jar"), "\n")) do
          table.insert(lemminx_jars, bundle)
        end

        local lemminxStr = vim.fn.join(lemminx_jars, common.is_win and ";" or ":")

        opts.servers.lemminx = {
          cmd = {
            common.java_bin(),
            "-cp",
            lemminxStr,
            "org.eclipse.lemminx.XMLServerLauncher",
          },
        }
      end
    end,
  },
  {
    "nvimdev/lspsaga.nvim",
    event = "LazyFile",
    enabled = true,
    keys = {
      {
        "gpd",
        "<cmd>Lspsaga peek_definition<CR>",
        desc = "Definition Preview",
      },
      {
        "gpt",
        "<cmd>Lspsaga peek_type_definition<CR>",
        desc = "Type Definition Preview",
      },
      {
        "<leader>f,",
        "<cmd>Lspsaga finder def+ref+imp ++inexist<cr>",
        desc = "Show LSP Methods",
      },
    },
    opts = {
      ui = {
        border = "rounded",
        lines = { "└", "├", "│", "─", "┌" },
      },
      symbol_in_winbar = {
        enable = false,
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

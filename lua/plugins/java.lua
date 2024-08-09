return {
  {
    "mfussenegger/nvim-jdtls",
    dependencies = {
      {
        {
          "CcccX2017/spring-boot.nvim",
          dependencies = {
            "ibhagwan/fzf-lua",
          },
        },
      },
    },
    opts = function(_, opts)
      require("fzf-lua").setup({})

      local ls_path = require("mason-registry").get_package("spring-boot-tools"):get_install_path()
        .. "/extension/language-server"
      require("spring_boot").setup({
        ls_path = ls_path,
        jdtls_name = "jdtls",
        log_file = nil,
        java_cmd = nil,
      })

      local bundles = require("utils.project").get_jdtls_bundles(opts)

      opts.jdtls = {
        handlers = {
          ["$/progress"] = function(_, result, ctx)
            local message = result.value.message or ""
            if message:lower():find("validate documents") or message:lower():find("publish diagnostics") then
              return
            end
            return vim.lsp.handlers["$/progress"](_, result, ctx)
          end,
        },
        init_options = {
          bundles = bundles,
        },
      }

      opts.settings.java.inlayHints = {
        parameterNames = { enabled = "all" },
      }
      opts.settings.java.signatureHelp = { enabled = true }
      opts.settings.java.referenceCodeLens = { enabled = true }
      opts.settings.java.implementationsCodeLens = { enabled = true }
      opts.settings.java.templates = {
        fileHeader = {
          "/**",
          " * ${type_name}",
          " * @author ${user}",
          " */",
        },
        typeComment = {
          "/**",
          " * ${type_name}",
          " * @author ${user}",
          " */",
        },
      }
    end,
  },
  {
    "elmcgill/springboot-nvim",
    ft = { "java" },
    lazy = true,
    dependencies = {
      "neovim/nvim-lspconfig",
      "mfussenegger/nvim-jdtls",
    },
    config = function()
      local springboot_nvim = require("springboot-nvim")

      vim.keymap.set("n", "<leader>jr", springboot_nvim.boot_run, { desc = "[J]ava [R]un Spring Boot" })
      vim.keymap.set("n", "<leader>jc", springboot_nvim.generate_class, { desc = "[J]ava Create [C]lass" })
      vim.keymap.set("n", "<leader>ji", springboot_nvim.generate_interface, { desc = "[J]ava Create [I]nterface" })
      vim.keymap.set("n", "<leader>je", springboot_nvim.generate_enum, { desc = "[J]ava Create [E]num" })

      springboot_nvim.setup()
    end,
  },
  {
    "eatgrass/maven.nvim",
    cmd = { "Maven", "MavenExec" },
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("maven").setup({
        executable = "./mvnw",
      })
    end,
  },
}

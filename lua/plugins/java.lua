-- return {
--   "nvim-java/nvim-java",
--   config = false,
--   dependencies = {
--     {
--       "neovim/nvim-lspconfig",
--       opts = {
--         inlay_hints = {
--           enabled = true,
--           exclude = {
--             -- 'java',
--             -- 'javascript',
--             -- 'typescript',
--             -- 'javascriptreact',
--             -- 'typescriptreact',
--           },
--         },
--         servers = {
--           jdtls = {
--             -- your jdtls configuration goes here
--             settings = {
--               java = {},
--               inlayhints = {
--                 parameterNames = { enabled = "all" },
--               },
--               referenceCodeLens = { enabled = true },
--               implementationsCodeLens = { enabled = true },
--             },
--           },
--         },
--         setup = {
--           jdtls = function()
--             require("java").setup({
--               -- your nvim-java configuration goes here
--             })
--           end,
--         },
--       },
--     },
--   },
-- }
return {
  {
    "mfussenegger/nvim-jdtls",
    dependencies = {
      "JavaHello/spring-boot.nvim",
    },
    opts = function(_, opts)
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
        -- init_options = {
        --   bundles = {},
        -- },
      }
      opts.settings.inlayhints = {
        parameterNames = { enabled = "ALL" },
      }
      opts.settings.referenceCodeLens = { enabled = true }
      opts.settings.implementationsCodeLens = { enabled = true }

      -- 添加 spring-boot jdtls 扩展 jar 包
      -- vim.list_extend(opts.jdtls.init_options.bundles, require("spring_boot").java_extensions())
      -- vim.notify(vim.inspect(opts))
      -- table.insert(opts.jdtls.init_options.bundles, require("spring_boot").java_extensions())
    end,
    -- opts = {
    --   jdtls = {
    --     handlers = {
    --       ["$/progress"] = function(_, result, ctx)
    --         local message = result.value.message or ""
    --         if message:lower():find("validate documents") or message:lower():find("publish diagnostics") then
    --           return
    --         end
    --         return vim.lsp.handlers["$/progress"](_, result, ctx)
    --       end,
    --     },
    --     init_options = {
    --       bundles = {
    --
    --       }
    --     }
    --   },
    -- },
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
}

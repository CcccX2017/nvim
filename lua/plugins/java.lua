return {
  -- {
  --   "nvim-java/nvim-java",
  --   ft = "java",
  --   config = false,
  --   dependencies = {
  --     {
  --       "neovim/nvim-lspconfig",
  --       opts = {
  --         servers = {
  --           jdtls = {},
  --         },
  --         setup = {
  --           jdtls = function()
  --             require("java").setup({})
  --           end,
  --         },
  --       },
  --     },
  --   },
  -- },
  {
    "mfussenegger/nvim-jdtls",
    opts = {
      jdtls = {
        handlers = {
          ["$/progress"] = function(_, result, ctx)
            local message = result.value.message or ""
            if message:lower():find("validate documents") or message:lower():find("publish diagnostics") then
              return
            end
            return vim.lsp.handlers["$/progress"](_, result, ctx)
          end,
        },
      },
    },
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

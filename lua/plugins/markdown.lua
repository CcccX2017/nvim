return {
  -- 如果开启lazyextras的markdown-preview，需要对build进行一些处理
  -- {
  --   "iamcco/markdown-preview.nvim",
  --   build = function()
  --     require("lazy").load({ plugins = { "markdown-preview.nvim" } })
  --     vim.fn["mkdp#util#install"]()
  --   end,
  -- },
  {
    -- 简单的markdown预览
    "ellisonleao/glow.nvim",
    lazy = true,
    cmd = "Glow",
    keys = {
      {
        "<leader>cg",
        "<cmd>Glow<cr>",
        desc = "Markdown Preview With Glow",
      },
    },
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require("glow").setup({
        style = "dark",
        border = "double",
      })
    end,
  },
  {
    "MeanderingProgrammer/markdown.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    ft = { "markdown", "norg", "rmd", "org" },
    opts = {
      file_types = { "markdown", "norg", "rmd", "org" },
      heading = {
        width = "full",
        position = "overlay",
        icons = { "󰎤 ", "󰎧 ", "󰎪 ", "󰎭 ", "󰎱 ", "󰎳 " },
        -- icons = { "󰉫 ", "󰉬 ", "󰉭 ", "󰉮 ", "󰉯 ", "󰉰 " },
      },
      code = {
        sign = true,
        style = "full",
        border = "thin",
        right_pad = 1,
      },
    },
    keys = {
      {
        "<leader>um",
        "<cmd>RenderMarkdown toggle<cr>",
        desc = "RenderMarkdown Toggle",
      },
    },
  },
}

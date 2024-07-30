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
    -- 增强笔记文件显示，markdown, orgmode, neorg
    -- show latex on markdown file can use plugin "jbyuki/nabla.nvim"
    "lukas-reineke/headlines.nvim",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = true,
    -- config = function()
    --   require("headlines").setup()
    -- end,
  },
}

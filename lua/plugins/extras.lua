return {
  {
    "max397574/better-escape.nvim",
    event = "InsertCharPre",
  },
  {
    "ojroques/nvim-bufdel",
    event = "VeryLazy",
    keys = {
      {
        "<leader>ba",
        "<cmd>BufDelAll<cr>",
        desc = "Delete All Buffer",
        noremap = true,
        silent = true,
      },
      {
        "<leader>br",
        "<cmd>BufDelOthers<cr>",
        desc = "Delete Others Buffer",
        noremap = true,
        silent = true,
      },
    },
    opts = function()
      require("bufdel").setup({
        next = "tabs",
        quit = false,
      })
    end,
  },
  {
    -- 长按jk时加快移动速度
    "rhysd/accelerated-jk",
    lazy = true,
    keys = {
      { "j", "<Plug>(accelerated_jk_gj)" },
      { "k", "<Plug>(accelerated_jk_gk)" },
    },
  },
}

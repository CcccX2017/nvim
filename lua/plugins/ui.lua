return {
  {
    "nvimdev/dashboard-nvim",
    lazy = false,
    opts = function(_, opts)
      local logo = require("utils.logo").get_logo()

      opts.config.header = logo
    end,
  },
  {
    "hiphish/rainbow-delimiters.nvim",
    config = function()
      require("rainbow-delimiters.setup").setup({})
    end,
  },
  -- {
  --   "xiyaowong/transparent.nvim",
  --   config = function()
  --     require("transparent").setup({ -- Optional, you don't have to run setup.
  --       groups = { -- table: default groups
  --         "Normal",
  --         "NormalNC",
  --         "Comment",
  --         "Constant",
  --         "Special",
  --         "Identifier",
  --         "Statement",
  --         "PreProc",
  --         "Type",
  --         "Underlined",
  --         "Todo",
  --         "String",
  --         "Function",
  --         "Conditional",
  --         "Repeat",
  --         "Operator",
  --         "Structure",
  --         "LineNr",
  --         "NonText",
  --         "SignColumn",
  --         -- "CursorLine",
  --         -- "CursorLineNr",
  --         "StatusLine",
  --         "StatusLineNC",
  --         "EndOfBuffer",
  --       },
  --       extra_groups = {
  --         "NeoTreeWinSeparator",
  --         "NeoTreeSignColumn",
  --       }, -- table: additional groups that should be cleared
  --       exclude_groups = {}, -- table: groups you don't want to clear
  --     })
  --   end,
  -- },
}

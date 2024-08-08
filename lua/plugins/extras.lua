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
    "s1n7ax/nvim-window-picker",
    name = "window-picker",
    version = "2.*",
    opts = {
      hint = "floating-big-letter",
      show_prompt = false,
      filter_rules = {
        include_current_win = true,
        bo = {
          filetype = { "ts-context", "lualine", "fidget", "neo-tree", "NvimTree", "incline", "notify", "noice" },
        },
      },
      filter_func = function(windows, rules)
        local function predicate(wid)
          local cfg = vim.api.nvim_win_get_config(wid)
          if not cfg.focusable then
            return false
          end
          return true
        end
        local filtered = vim.tbl_filter(predicate, windows)

        local dfilter = require("window-picker.filters.default-window-filter"):new()
        dfilter:set_config(rules)
        return dfilter:filter_windows(filtered)
      end,
    },
    keys = {
      {
        "<c-w>p",
        function()
          local window_number = require("window-picker").pick_window()
          if window_number then
            vim.api.nvim_set_current_win(window_number)
          end
        end,
        desc = "Windows Picker 快速切换面板",
      },
    },
  },
  {
    "nacro90/numb.nvim",
    event = "BufRead",
    opts = {
      show_numbers = true,
      show_cursorline = true,
    },
  },
  {
    "AndrewRadev/switch.vim",
    keys = {
      {
        "sw",
        "<cmd>Switch<cr>",
        desc = "Switch Segments",
      },
    },
    config = function() end,
  },
}

-- Lua
require("winshift").setup({
  highlight_moving_win = true,  -- Highlight the window being moved
  focused_hl_group = "Visual",  -- The highlight group used for the moving window
  moving_win_options = {
    -- These are local options applied to the moving window while it's
    -- being moved. They are unset when you leave Win-Move mode.
    wrap = false,
    cursorline = false,
    cursorcolumn = false,
    colorcolumn = "",
  },
  window_picker = function()
    return require("winshift.lib").pick_window({
      picker_chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
      filter_rules = {
        cur_win = true,
        floats = true,
        filetype = {  -- List of ignored file types
          "NvimTree",
        },
        buftype = {   -- List of ignored buftypes
          "terminal",
          "quickfix",
        },
        bufname = {   -- List of regex patterns matching ignored buffer names
          [[.*foo/bar/baz\.qux]]
        },
      },
    })
  end
})

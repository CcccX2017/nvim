return {
  {
    "nvim-tree/nvim-web-devicons",
    opts = {
      override = {
        deb = { icon = "", name = "Deb" },
        lock = { icon = "󰌾", name = "Lock" },
        mp3 = { icon = "󰎆", name = "Mp3" },
        mp4 = { icon = "", name = "Mp4" },
        out = { icon = "", name = "Out" },
        ["robots.txt"] = { icon = "󰚩", name = "Robots" },
        ttf = { icon = "", name = "TrueTypeFont" },
        rpm = { icon = "", name = "Rpm" },
        woff = { icon = "", name = "WebOpenFontFormat" },
        woff2 = { icon = "", name = "WebOpenFontFormat2" },
        xz = { icon = "", name = "Xz" },
        zip = { icon = "", name = "Zip" },
      },
    },
  },
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      -- opts.lsp.override["cmp.entry.get_documentation"] = false

      -- 解决 No information available提示问题
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = {
          skip = true,
        },
      })

      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No LSP Definitions found",
        },
        opts = {
          skip = true,
        },
      })

      opts.presets.lsp_doc_border = true
    end,
  },
  -- animations
  {
    "echasnovski/mini.animate",
    event = "VeryLazy",
    opts = {
      open = {
        enable = false,
      },
      close = {
        enable = false,
      },
    },
  },
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
  {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    opts = {
      current_line_blame = true,
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = function(_, opts)
      local icon = require("utils.icons")
      opts.options.component_separators = {
        left = icon.left,
        right = icon.right,
      }
    end,
  },
  -- 右上角浮动显示当前文件名
  {
    "b0o/incline.nvim",
    event = "BufReadPre",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    priority = 1200,
    config = function()
      require("incline").setup({
        window = {
          padding = 0,
          margin = { horizontal = 0 },
        },
        hide = {
          cursorline = true,
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          if filename == "" then
            filename = "[No Name]"
          end
          local ft_icon, ft_color = require("nvim-web-devicons").get_icon_color(filename)
          local modified = vim.bo[props.buf].modified
          if modified then
            filename = filename .. " "
          end

          local buffer = {
            ft_icon and { " ", ft_icon, guifg = ft_color } or " ",
            " ",
            { filename, gui = "bold", guifg = modified and ft_color or "#FAF1EE" },
            " ",
            guibg = "#363944",
          }
          return buffer
        end,
      })
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.extensions, {
        "nvim-tree",
        "mason",
        "toggleterm",
      })
      local component = require("utils.lualine")
      table.insert(opts.sections.lualine_x, 5, component.lsp)
    end,
  },
}

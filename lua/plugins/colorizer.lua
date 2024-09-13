return {
  {
    "roobert/tailwindcss-colorizer-cmp.nvim",
    enabled = false,
  },
  {
    "brenoprata10/nvim-highlight-colors",
    event = "LazyFile",
    opts = {
      render = "virtual",
      virtual_symbol_position = "inline",
      virtual_symbol = "󰝤",
      enable_tailwind = true,
      enable_named_colors = false,
    },
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "onsails/lspkind.nvim",
        config = true,
      },
    },
    opts = function(_, opts)
      opts.formatting = {
        format = function(entry, item)
          local color_item = require("nvim-highlight-colors").format(entry, { kind = item.kind })
          item = require("lspkind").cmp_format({
            mode = "symbol_text",
            preset = "codicons",
            ellipsis_char = "...",
            show_labelDetails = false,
            symbol_map = {
              Codeium = "🅲",
            },
            before = function(_, vim_item)
              local max_width = math.floor(0.25 * vim.o.columns)
              local label = vim_item.abbr
              local truncated_label = vim.fn.strcharpart(label, 0, max_width)
              if truncated_label ~= label then
                vim_item.abbr = truncated_label .. "…"
              end
              return vim_item
            end,
          })(entry, item)
          if color_item.abbr_hl_group then
            item.abbr_hl_group = color_item.abbr_hl_group -- 使用高亮组
            item.kind_hl_group = color_item.abbr_hl_group -- 保持高亮组不被覆盖
            item.kind = color_item.abbr -- 设置高亮后的 kind
          end
          return item
        end,
      }
    end,
  },
}

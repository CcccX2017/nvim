return {
  "hrsh7th/nvim-cmp",
  event = { "InsertEnter", "CmdlineEnter" },
  dependencies = {
    "hrsh7th/cmp-cmdline",
  },
  opts = function(_, opts)
    local cmp = require("cmp")
    local M = require("utils.cmp")
    local cmp_mapping = require("cmp.config.mapping")
    local luasnip = require("luasnip")

    opts.completion = {
      completeopt = "menu,menuone,noselect",
    }

    opts.window = {
      completion = {
        border = M.get_border(),
        winhighlight = "Normal:Pmenu,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
      },
      documentation = {
        border = M.get_border(),
        winhighlight = "Normal:Pmenu,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
      },
    }

    opts.mapping["<Tab>"] = cmp_mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      elseif M.jumpable(1) then
        luasnip.jump(1)
      elseif M.has_words_before() then
        -- cmp.complete()
        fallback()
      else
        fallback()
      end
    end, { "i", "s" })

    opts.mapping["<S-Tab>"] = cmp_mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" })

    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" },
      }, {
        {
          name = "cmdline",
          option = {
            ignore_cmds = { "Man", "!" },
          },
        },
      }),
    })

    cmp.setup.cmdline("/", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    })
  end,
}

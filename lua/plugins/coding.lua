return {
  {
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
  },
  {
    "ahmedkhalf/project.nvim",
    enabled = vim.g.project_enabled,
    opts = function(_, opts)
      opts.manual_mode = false
      opts.detection_methods = { "pattern", "lsp" }
      opts.patterns = {
        ".git",
        "_darcs",
        ".hg",
        ".bzr",
        ".svn",
        "Makefile",
        "package.json",
        -- ".idea",
        -- ".settings",
        -- "pom.xml",
        -- "build.gradle",
      }

      local function is_in_patterns()
        local cwd = vim.fn.getcwd()
        -- 遍历每个模式，检查是否存在匹配的文件或目录
        for _, existing_pattern in ipairs(opts.patterns) do
          if vim.fn.glob(cwd .. "/" .. existing_pattern) ~= "" then
            return true -- 找到匹配的文件或目录
          end
        end

        return false
      end

      local function pattern_exists(pattern)
        for _, existing_pattern in ipairs(opts.patterns) do
          if existing_pattern == pattern then
            return true
          end
        end
        return false
      end

      -- 如果patterns中的目录无法匹配，则添加当前目录为父目录
      vim.api.nvim_create_autocmd({ "BufEnter" }, {
        callback = function()
          if not is_in_patterns() then
            local root_path = "=" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
            if not pattern_exists(root_path) then
              table.insert(opts.patterns, 1, root_path)
            end
          end
        end,
      })
    end,
  },
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    config = true,
  },
}

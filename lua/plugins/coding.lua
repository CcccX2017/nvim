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
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
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
      local is_auto_project = false
      if not is_auto_project then
        table.insert(opts.patterns, ".project.nvim")
      end
      if is_auto_project then
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
                table.insert(opts.patterns, root_path)
              end
            end
          end,
        })
      end
    end,
  },
  {
    "numToStr/Comment.nvim",
    event = "BufReadPost",
    config = true,
  },
  {
    "rmagatti/goto-preview",
    lazy = true,
    -- event = "BufEnter",
    keys = {
      {
        "gp",
        "-",
        desc = "Goto Preview",
      },
      -- {
      --   "gpd",
      --   "<cmd>lua require('goto-preview').goto_preview_definition()<CR>",
      --   desc = "Definition Preview",
      -- },
      -- {
      --   "gpt",
      --   "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>",
      --   desc = "Type Definition Preview",
      -- },
      {
        "gpi",
        "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>",
        desc = "Implementation Preview",
      },
      {
        "gpD",
        "<cmd>lua require('goto-preview').goto_preview_declaration()<CR>",
        desc = "Declaration Preview",
      },
      {
        "gpr",
        "<cmd>lua require('goto-preview').goto_preview_references()<CR>",
        desc = "References Preview",
      },
      {
        "gpC",
        "<cmd>lua require('goto-preview').close_all_win()<CR>",
        desc = "Close All Preview Win",
      },
    },
    config = true,
  },
  {
    -- Live reload local development servers inside of neovim
    "barrett-ruth/live-server.nvim",
    build = function()
      local has_pnpm = vim.fn.executable("pnpm") == 1
      local package_manager = has_pnpm and "pnpm" or "npm"
      os.execute(package_manager .. " add -g live-server")
    end,
    cmd = { "LiveServerStart", "LiveServerStop", "LiveServerToggle" },
    config = true,
  },
  {
    -- 多光标支持
    "mg979/vim-visual-multi",
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      fast_wrap = {
        map = "<M-e>",
        chars = { "{", "[", "(", '"', "'" },
        pattern = [=[[%'%"%>%]%)%}%,]]=],
        end_key = "$",
        keys = "qwertyuiopzxcvbnmasdfghjkl",
        check_comma = true,
        highlight = "Search",
        highlight_grey = "Comment",
      },
      disable_filetype = { "TelescopePrompt", "vim" },
    },
    config = function(_, opts)
      require("nvim-autopairs").setup(opts)

      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },
  {
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
    keys = {
      { "<leader>cs", "<cmd>Outline<CR>", desc = "Toggle outline" },
    },
    config = function()
      local defaults = require("outline.config").defaults
      local icons = require("utils.icons")

      local opts = {
        symbols = {
          icons = {},
          filter = nil,
        },
        keymaps = {
          up_and_jump = "<up>",
          down_and_jump = "<down>",
        },
      }

      for kind, symbol in pairs(defaults.symbols.icons) do
        opts.symbols.icons[kind] = {
          icon = icons.kind[kind] or symbol.icon,
          hl = symbol.hl,
        }
      end

      require("outline").setup(opts)
    end,
  },
}

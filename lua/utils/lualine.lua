local icons = require("utils.icons")
local webicons = require("nvim-web-devicons")
local window_width_limit = 100

local function list_formatters(bufnr)
  local conform = require("conform")
  local formatters = conform.list_formatters_to_run(bufnr)
  local registered = {}

  for _, source in ipairs(formatters) do
    table.insert(registered, source.name)
  end

  return registered
end

local i = 1
local function list_linters(bufft)
  local lint = require("lint")
  local registered = {}
  local linters = lint.linters_by_ft[bufft] or {}

  for _, source in ipairs(linters) do
    table.insert(registered, source)
  end
  return registered
end
local i = 1
local M = {
  lsp = {
    function()
      local bufft = vim.o.filetype

      local file_icon = webicons.get_icon_by_filetype(bufft) or icons.ActiveLSP
      if not file_icon == icons.ActiveLSP then
        file_icon = file_icon .. " "
      end
      local buf_clients = vim.lsp.get_clients({ bufnr = 0 })
      if #buf_clients == 0 then
        return file_icon .. "  LSP Inactive"
      end

      local bufnr = vim.api.nvim_get_current_buf()
      local buf_client_names = {}
      local copilot_active = false

      -- add client
      for _, client in pairs(buf_clients) do
        if client.name ~= "null-ls" and client.name ~= "copilot" then
          table.insert(buf_client_names, client.name)
        end

        if client.name == "copilot" then
          copilot_active = true
        end
      end

      -- add formatter
      local supported_formatters = list_formatters(bufnr)
      vim.list_extend(buf_client_names, supported_formatters)

      -- add linter
      local supported_linters = list_linters(bufft)
      vim.list_extend(buf_client_names, supported_linters)

      local unique_client_names = table.concat(buf_client_names, ", ")
      local language_servers = file_icon .. "  " .. string.format("%s", unique_client_names)

      if copilot_active then
        language_servers = language_servers .. "%#SLCopilot#" .. " " .. icons.kind.Copilot .. "%*"
      end

      return language_servers
    end,
    -- color = { gui = "bold" },
    cond = function()
      return vim.o.columns > window_width_limit
    end,
    separator = "",
  },
}

return M

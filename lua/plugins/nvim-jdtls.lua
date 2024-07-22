return {
  "mfussenegger/nvim-jdtls",
  opts = {
    jdtls = {
      handlers = {
        ["$/progress"] = function(_, result, ctx)
          local message = result.value.message or ""
          if message:find("Validate documents") or message:find("Publish Diagnostics") then
            return
          end
          return vim.lsp.handlers["$/progress"](_, result, ctx)
        end,
      },
    },
  },
}

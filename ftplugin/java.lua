vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

LazyVim.lsp.on_supports_method("textDocument/codeLens", function(_, buffer)
  -- 初始化并刷新 CodeLens
  vim.lsp.codelens.refresh()
  vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave" }, {
    buffer = buffer,
    callback = vim.lsp.codelens.refresh,
  })
end)

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    vim.keymap.set("n", "<Leader>cr", vim.lsp.buf.rename,
      { desc = "Rename symbol", buf = ev.buf })
    vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action,
      { desc = "Code action", buf = ev.buf })
  end,
})

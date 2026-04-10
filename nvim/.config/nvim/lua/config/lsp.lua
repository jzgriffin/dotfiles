-- Configure the LSP formatexpr for buffers that support it.
local function enable_lsp_formatexpr(client, bufnr)
  if not (client:supports_method("textDocument/formatting") or
          client:supports_method("textDocument/rangeFormatting")) then
    return false
  end
  vim.bo[bufnr].formatexpr = "v:lua.vim.lsp.formatexpr()"
  return true
end

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client then
      enable_lsp_formatexpr(client, ev.buf)
    end

    vim.keymap.set("n", "<Leader>cr", vim.lsp.buf.rename,
      { desc = "Rename symbol", buf = ev.buf })
    vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action,
      { desc = "Code action", buf = ev.buf })
  end,
})

-- Ensure formatexpr is set for rust files if an LSP is attached.
-- This handles cases where the filetype plugin might have cleared it.
vim.api.nvim_create_autocmd("FileType", {
  pattern = "rust",
  callback = function(ev)
    for _, client in ipairs(vim.lsp.get_clients({ bufnr = ev.buf })) do
      enable_lsp_formatexpr(client, ev.buf)
    end
  end,
})

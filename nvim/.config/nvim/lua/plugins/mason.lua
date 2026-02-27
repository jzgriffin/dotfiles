return {
  -- https://github.com/mason-org/mason.nvim
  -- Manager for external editor tooling (LSP servers, DAP servers, linters,
  -- and formatters)
  {
    "mason-org/mason.nvim",
    opts = {},
  },

  -- https://github.com/mason-org/mason-lspconfig.nvim
  -- Automatic LSP configuration
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "mason-org/mason.nvim" },
    opts = {
      ensure_installed = {
        "clangd",
        "lua_ls",
        "pyright",
        "rust_analyzer",
        "vimls",
      },
    },
  },
}

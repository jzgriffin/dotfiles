return {
  -- https://github.com/folke/trouble.nvim
  -- Viewer for diagnostics, references, Telescope results, quickfixes, and
  -- location lists
  {
    "folke/trouble.nvim",
    opts = {},
    cmd = "Trouble",
    keys = {
      {
        "<Leader>xx",
        "<CMD>Trouble diagnostics toggle<CR>",
        desc = "View diagnostics",
      },
      {
        "<Leader>xX",
        "<CMD>Trouble diagnostics toggle filter.buf=0<CR>",
        desc = "View diagnostics for current buffer",
      },
      {
        "<Leader>cs",
        "<CMD>Trouble symbols toggle focus=false<CR>",
        desc = "View symbols",
      },
      {
        "<Leader>cl",
        "<CMD>Trouble lsp toggle focus=false win.position=right<CR>",
        desc = "View LSP definitions and references",
      },
      {
        "<Leader>xL",
        "<CMD>Trouble loclist toggle<CR>",
        desc = "View location list",
      },
      {
        "<Leader>xQ",
        "<CMD>Trouble qflist toggle<CR>",
        desc = "View quickfix list",
      },
    },
  },
}

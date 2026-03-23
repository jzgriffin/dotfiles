return {
  -- https://github.com/RRethy/nvim-base16
  -- base16 colorschemes
  {
    "RRethy/nvim-base16",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("base16-tomorrow-night")
    end,
  },

  -- https://github.com/nvim-lualine/lualine.nvim
  -- Configurable statusline
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = { theme = "base16" },
    },
  },
}

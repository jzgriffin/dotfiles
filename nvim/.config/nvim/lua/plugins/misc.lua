return {
  -- https://github.com/danro/rename.vim
  -- Rename a buffer within Vim and on the disk
  --
  -- Usage:
  --   :rename[!] {newname}
  "danro/rename.vim",

  -- https://github.com/moll/vim-bbye
  --
  -- Delete buffers without closing their windows
  -- Usage:
  --   :Bdelete
  {
    "moll/vim-bbye",
    keys = {
      {
        "<Leader>d",
        "<CMD>Bdelete<CR>",
        noremap = true,
        desc = "Delete the current buffer without closing its window",
      },
      {
        "<Leader>D",
        "<CMD>bufdo <CMD>Bdelete<CR>",
        {
          noremap = true,
          desc = "Delete all buffers without closing their windows",
        },
      },
    },
  },

  -- https://github.com/tpope/vim-repeat
  -- Enables repeating plugin commands with .
  "tpope/vim-repeat",

  -- https://github.com/wakatime/vim-wakatime
  -- Tracks time spent editing
  "wakatime/vim-wakatime",
}

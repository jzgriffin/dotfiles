return {
  -- https://github.com/ibhagwan/fzf-lua
  -- Fuzzy file picker
  --
  -- Usage (inside picker):
  --   C-z     abort
  --   C-u     unix-line-discard
  --   C-f     half-page-down
  --   C-b     half-page-up
  --   C-a     beginning-of-line
  --   C-e     end-of-line
  --   M-a     toggle-all
  --   M-g     first
  --   M-G     last
  --   F3      toggle-preview-wrap
  --   F4      toggle-preview
  --   S-Down  preview-page-down
  --   S-Up    preview-page-up
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    ---@module "fzf-lua"
    ---@type fzf-lua.Config
    opts = {
      keymap = "fzf",
    },
    keys = {
      {
        "<Leader>fb",
        "<CMD>FzfLua buffers<CR>",
        "n",
        { desc = "Find buffers" },
      },
      {
        "<Leader>ff",
        "<CMD>FzfLua files<CR>",
        "n",
        { desc = "Find files" },
      },
      {
        "<Leader>fg",
        "<CMD>FzfLua live_grep<CR>",
        "n",
        { desc = "Find with grep" },
      },
      {
        "<Leader>fgc",
        "<CMD>FzfLua git_bcommits<CR>",
        "n",
        { desc = "Find in Git commit log for current buffer" },
      },
      {
        "<Leader>fgl",
        "<CMD>FzfLua git_commits<CR>",
        "n",
        { desc = "Find in Git commit log" },
      },
      {
        "<Leader>fh",
        "<CMD>FzfLua oldfiles<CR>",
        "n",
        { desc = "Find in opened files history" },
      },
      {
        "<Leader>fl",
        "<CMD>FzfLua blines<CR>",
        "n",
        { desc = "Find in current buffer lines" },
      },
      {
        "<Leader>fr",
        "<CMD>FzfLua resume<CR>",
        "n",
        { desc = "Find resume" },
      },
      {
        "<Leader>fs",
        "<CMD>FzfLua treesitter<CR>",
        "n",
        { desc = "Find in current buffer treesitter symbols" },
      },
      {
        "<Leader>f?",
        "<CMD>FzfLua helptags<CR>",
        "n",
        { desc = "Find help" },
      },
    },
  },
}

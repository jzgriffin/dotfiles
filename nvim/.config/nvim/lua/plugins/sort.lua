return {
  -- https://github.com/sQVe/sort.nvim
  -- Commands and text objects for intelligent line and delimited sorting
  --
  -- Usage:
  --   :Sort
  --   (n) go    In normal mode, sort with motion
  --   (x) go    In visual mode, sort selection
  --   (n) gogo  Sort current line
  --   (v) io    Inner sortable region text object
  --   (v) ao    Around sortable region text object
  --   (n/v) ]o  Jump to next delimiter
  --   (n/v) [o  Jump to previous delimiter
  {
    "sQVe/sort.nvim",
    opts = {},
  }
}

return {
  -- https://github.com/bronson/vim-trailing-whitespace
  -- Highlights trailing whitespace
  --
  -- Usage:
  --   :FixWhitespace
  --
  {
    "bronson/vim-trailing-whitespace",
    -- Commit dc22ff46010e55d2c33edd21cdcd14f99e729b6f from 2026-04-16 is
    -- causing erroneous highlighting at the end of popup menus. The commit
    -- pinned here is the last working commit for me.
    commit = "5540b3faa2288b226a8d9a4e8244558b12c598aa",
  },

  -- https://github.com/numToStr/Comment.nvim
  -- Comment and uncomment lines and selections
  --
  -- Usage:
  --   gcc         Toggle line comment
  --   gbc         Toggle block comment
  --   <leader>gc  Toggle line comment on selection
  --   <leader>gb  Toggle block comment on selection
  --   gcO         Add a comment on the line above
  --   gco         Add a comment on the line below
  --   gcA         Add a comment at the end of the line
  {
    "numToStr/Comment.nvim",
    opts = {},
  },

  -- https://github.com/tpope/vim-abolish
  -- Abolish variants of a word, make case- and plurality-sensitive
  -- substitutions, and coerce between cases
  --
  -- Usage:
  --   :help abolish
  --   :%S/facilit{y,ies}/building{,s}/g
  --   crs  Coerce to snake_case
  --   crm  Coerce to mixed_case
  --   crc  Coerce to camelCase
  --   cru  Coerce to UPPER_CASE
  --   cr-  Coerce to dash-case
  --   cr.  Coerce to dot.case
  "tpope/vim-abolish",

  -- https://github.com/tpope/vim-surround
  -- Add, change, and delete surrounding pairs
  --
  -- Usage:
  --   cs"'    Changes "Hello world!" to 'Hello world!'
  --   cs'<q>  Changes 'Hello world!' to <q>Hello world!</q>
  --   cst"    Changes <q>Hello world!</q>` to `"Hello world!"
  --   ds"     Changes "Hello world!" to Hello world!
  --   ysiw]   Changes "Hello world!" to "[Hello] world!"
  --   cs]{    Changes "[Hello] world!" to "{ Hello } world!"
  --   ysi")   Changes "Hello world!" to "(Hello world!)"
  --   ds)     Changes "(Hello world!)" to "Hello world!)"
  --   S<tag attrs...>  Wraps visual selection with <tag attrs...>...</tag>
  "tpope/vim-surround",

  -- https://github.com/wellle/targets.vim
  -- Adds pair, quote, separator, argument, and tag text objects
  "wellle/targets.vim",
}

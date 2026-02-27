return {
  -- https://github.com/bronson/vim-trailing-whitespace
  -- Highlights trailing whitespace
  --
  -- Usage:
  --   :FixWhitespace
  "bronson/vim-trailing-whitespace",

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

  -- https://github.com/wakatime/vim-wakatime
  -- Tracks time spent editing
  "wakatime/vim-wakatime",

  -- https://github.com/wellle/targets.vim
  -- Adds pair, quote, separator, argument, and tag text objects
  "wellle/targets.vim",
}

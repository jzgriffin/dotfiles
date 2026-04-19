"" System options
set timeoutlen=300
set updatetime=250
set history=8192
set termguicolors
set lazyredraw
set ttyfast
set belloff=all
if !has("gui_running")
    set t_Co=256
endif

"" Display options
set signcolumn=yes
set colorcolumn=+1
set relativenumber
set cursorline
set scrolloff=2
set sidescroll=1
set laststatus=2
set display=lastline
set showmatch
set noshowmode
set showcmd
syntax on

"" Window options
set splitbelow
set splitright

"" Buffer options
set encoding=utf-8
set autoread
set hidden
set nobackup
set nowritebackup
set noswapfile
set viminfo=

"" Search options
set ignorecase
set smartcase
set hlsearch
set incsearch

"" Editing options
set backspace=indent,eol,start
set matchpairs+=<:>
set spelllang=en_us
set textwidth=80
set expandtab
set shiftwidth=4
set tabstop=4
set autoindent
set smarttab

"" Mouse options
set mouse=a

"" Command options
set completeopt=menuone,noselect
set wildmode=list:longest
set wildmenu

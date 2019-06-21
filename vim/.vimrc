" Important
set nocompatible
set belloff=all

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Display
set lazyredraw
set ttyfast
set display=lastline
set laststatus=2
set showmode
set showcmd
set ruler
set number
set cursorline
set colorcolumn=72,78
set scrolloff=2
set sidescroll=1
syntax on

" Editing
set backspace=indent,eol,start
set showmatch
set pastetoggle=<F12>
set matchpairs+=<:>
set textwidth=78
set formatoptions=tcqj
set spell
set spelllang=en_us

" Indenting
set autoindent
set smartindent
set cindent
set cinoptions=N0
set expandtab
set tabstop=4
set shiftwidth=4
set smarttab

" Buffers
set encoding=utf-8
set autoread
set hidden
set noswapfile
set nobackup
set viminfo=

" Commands
set history=8192
set wildmenu
set wildmode=list:longest

" Windowing
set splitright
set splitbelow

" Convenience mappings
nnoremap <cr> :
let mapleader="\<space>"
let maplocalleader="\\"
nnoremap <space> <nop>
vnoremap . :normal .<cr>
nnoremap Y y$
inoremap <C-c> <C-c>u
nnoremap <silent> <leader>m :make<cr>
nnoremap <silent> <leader>! :source $MYVIMRC<cr>

" Searching mappings
nnoremap <silent> <leader>f :Files<cr>
nnoremap <silent> <leader>/ :BLines<cr>
nnoremap <silent> <leader>b :Buffers<cr>
nnoremap <silent> <leader>r :Rg<cr>
nnoremap <silent> <leader>C :Commands<cr>

" Buffering mappings
nnoremap :Bd :Bdelete<cr>
nnoremap <BS> <C-^>
cnoremap w!! !sudo tee %
nnoremap <silent> <leader>w :write<cr>
nnoremap <silent> <leader>d :Bdelete<cr>
nnoremap <silent> <leader>D :bufdo :Bdelete<cr>
nnoremap <silent> <leader>; :buffers<cr>
nnoremap <silent> <leader>[ :bprevious<cr>
nnoremap <silent> <leader>] :bnext<cr>

" Tabbing mappings
map <S-h> gT
map <S-l> gt

" Windowing mappings
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
nnoremap <silent> <leader>c <C-w>c
nnoremap <silent> <leader>q <C-w>q
nnoremap <silent> <leader>n :enew<cr>
nnoremap <silent> <leader>s :vnew<cr>
nnoremap <silent> <leader>S :new<cr>

" Editing mappings
vnoremap < <gv
vnoremap > >gv
nnoremap <silent> <esc><esc> :nohlsearch<cr>
nnoremap <silent> <leader>ci gg=G
nnoremap <silent> <leader>ct :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
vnoremap <silent> <leader>ct :let _s=@/<Bar>:'<,'>s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
iabbrev </ </<C-X><C-O>

" File types
filetype on
filetype plugin on
filetype indent on
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" matchit
runtime macros/matchit.vim

" netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 1

" polyglot
let g:polyglot_disabled = ['latex']

" airline
let g:airline_theme = 'solarized'

" solarized
let g:solarized_use16 = 1

" vimtex
let g:vimtex_disable_version_warning = 1

" Plugins
call plug#begin()
Plug 'Valloric/YouCompleteMe'
Plug 'airblade/vim-gitgutter'
Plug 'idris-hackers/idris-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'killphi/vim-ebnf'
Plug 'lervag/vimtex'
Plug 'lifepillar/vim-solarized8'
Plug 'moll/vim-bbye'
Plug 'sheerun/vim-polyglot'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'wakatime/vim-wakatime'
call plug#end()

" Color scheme
set background=dark
if has_key(g:plugs, 'vim-solarized8') && isdirectory(g:plugs['vim-solarized8'].dir)
    colorscheme solarized8
else
    colorscheme slate
endif

" Locally-customized vimrc
let vimrclocal = substitute(expand("$MYVIMRC"), "vimrc$", "vimrc.local", "")
if filereadable(vimrclocal)
    execute 'source '.fnameescape(vimrclocal)
endif

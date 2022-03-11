" This file is written for Neovim. It assumes the Neovim default settings.

" Plugin
call plug#begin(stdpath('data').'/plugins')
Plug 'airblade/vim-gitgutter'
Plug 'arcticicestudio/nord-vim'
Plug 'alvan/vim-closetag'
Plug 'bronson/vim-trailing-whitespace'
Plug 'danro/rename.vim'
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'moll/vim-bbye'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'wakatime/vim-wakatime'
call plug#end()

function! HasPlugin(name)
    return (
        \ has_key(g:plugs, a:name) &&
        \ isdirectory(g:plugs[a:name].dir)
        \ )
endfunction

" Searching
set ignorecase
set smartcase

" Display
set colorcolumn=72,78,100
set cursorline
set lazyredraw
set number
set pastetoggle=<F12>
set scrolloff=2
set showmatch

" Editing
autocmd FileType * set formatoptions-=c formatoptions-=r formatoptions-=o
set matchpairs+=<:>
set spell
set spelllang=en_us

" Mouse
set mouse=a

" Indenting
set cindent
set expandtab
set shiftwidth=4
set smartindent
set tabstop=4

" Buffers
set hidden
set nobackup
set noswapfile
set viminfo=

" Commands
set wildmode=list:longest

" Windowing
set splitbelow
set splitright

" Convenience mappings
let mapleader="\<space>"
let maplocalleader="\\"
nnoremap <cr> :
nnoremap <silent> <leader>! :source $MYVIMRC<cr>
nnoremap <space> <nop>
vnoremap . :normal .<cr>

" Editing mappings
inoremap <C-c> <C-c>u
nnoremap Y y$

" Searching mappings
nnoremap <silent> <leader>ff :Files<cr>
nnoremap <silent> <leader>f/ :BLines<cr>
nnoremap <silent> <leader>fb :Buffers<cr>
nnoremap <silent> <leader>fr :Rg<cr>
nnoremap <silent> <leader>fc :Commands<cr>

" Buffering mappings
nnoremap <bs> <C-^>
nnoremap <silent> <leader>w :write<cr>
nnoremap <silent> <leader>W :bufdo :write<cr>
nnoremap <silent> <leader>d :Bdelete<cr>
nnoremap <silent> <leader>D :bufdo :Bdelete<cr>
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
nnoremap <silent> <leader>n :enew<cr>
nnoremap <silent> <leader>% :vnew<cr>
nnoremap <silent> <leader>" :new<cr>

" Editing mappings
vnoremap < <gv
vnoremap > >gv
nnoremap <silent> <esc><esc> :nohlsearch<cr>

" File types
autocmd BufNewFile,BufRead wscript set syntax=python

" Automatically update copyright notice with current year
autocmd BufWritePre *
  \ if &modified |
  \   exe "silent g#\\cCOPYRIGHT \\(".strftime("%Y")."\\)\\@![0-9]\\{4\\}\\(-".strftime("%Y")."\\)\\@!#s#\\([0-9]\\{4\\}\\)\\(-[0-9]\\{4\\}\\)\\?#\\1-".strftime("%Y") |
  \ endif

" Colors
set background=dark
if HasPlugin('nord-vim')
    colorscheme nord
endif
if HasPlugin('airline-themes')
    let g:airline_theme='nord'
endif

" Additional configuration
if HasPlugin('coc.nvim')
    exe 'source '.stdpath('config').'/coc.vim'
endif
exe 'silent! source '.stdpath('config').'/local.vim'

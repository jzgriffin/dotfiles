" Automatically install vim-plug
let data_dir = has("nvim") ? stdpath("data")."/site" : "~/.vim"
if empty(glob(data_dir."/autoload/plug.vim"))
    silent execute "!curl -fLo ".data_dir."/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin("~/.vim/plugged")

Plug 'airblade/vim-gitgutter'
Plug 'bronson/vim-trailing-whitespace'
Plug 'chriskempson/base16-vim'
Plug 'christoomey/vim-sort-motion'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'moll/vim-bbye'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'preservim/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'wellle/targets.vim'

" Must come last!
Plug 'ryanoasis/vim-devicons'

call plug#end()

" Themes
colorscheme base16-tomorrow-night
let g:lightline = {
            \ "colorscheme": "wombat",
            \ }

" Remap vim-sort-motion from the default "gs" to "go" to match sort.nvim
let g:sort_motion_mapping = "go"


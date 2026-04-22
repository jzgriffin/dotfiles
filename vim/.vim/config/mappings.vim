"" airblade/vim-gitgutter mappings

" Hunk navigation
nmap ]c <Plug>(GitGutterNextHunk)
nmap [c <Plug>(GitGutterPrevHunk)

" Hunk actions
nmap <Leader>hs <Plug>(GitGutterStageHunk)
nmap <Leader>hr <Plug>(GitGutterUndoHunk)
nmap <Leader>hp <Plug>(GitGutterPreviewHunk)

" Toggle blame
nnoremap <Leader>tb :GitGutterBlameToggle<CR>

" Hunk text object (inside hunk)
omap ih <Plug>(GitGutterTextObjectInnerPending)
xmap ih <Plug>(GitGutterTextObjectInnerVisual)

"" junegunn/fzf.vim mappings

" Top picker mappings
nnoremap <Leader><Space> :Files<CR>
nnoremap <Leader>,       :Buffers<CR>
nnoremap <Leader>/       :Rg<CR>
nnoremap <Leader>:       :History:<CR>

" Find mappings
nnoremap <Leader>fb :Buffers<CR>
nnoremap <Leader>ff :Files<CR>
nnoremap <Leader>fg :GFiles<CR>
nnoremap <Leader>fr :History<CR>
nnoremap <Leader>fc :Files ~/.vim<CR>

" Search mappings
nnoremap <Leader>sg :Rg<CR>
nnoremap <Leader>sb :BLines<CR>
nnoremap <Leader>sh :Helptags<CR>
nnoremap <Leader>sm :Marks<CR>
nnoremap <Leader>s/ :History/<CR>

"" moll/vim-bbye mappings

" Delete buffer without closing the window
nnoremap <Leader>d :Bdelete<CR>

"" neoclide/coc.nvim mappings

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command `:verbose imap <tab>` to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
            \ coc#pum#visible() ? coc#pum#next(1) :
            \ CheckBackspace() ? "\<Tab>" :
            \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
    let col = col(".") - 1
    return !col || getline(".")[col - 1]  =~# "\s"
endfunction

" Use <C-Space> to trigger completion
if has("nvim")
    inoremap <silent><expr> <C-Space> coc#refresh()
else
    inoremap <silent><expr> <C-@> coc#refresh()
endif

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD <Plug>(coc-declaration)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gI <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Rename symbol
nmap <Leader>cr <Plug>(coc-rename)

" Code actions
nmap <Leader>ca <Plug>(coc-codeaction-cursor)
vmap <Leader>ca <Plug>(coc-codeaction-selected)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
    if CocAction("hasProvider", "hover")
        call CocActionAsync("doHover")
    else
        call feedkeys("K", "in")
    endif
endfunction

" Diagnostic navigation
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync("highlight")

" Map function and class text objects
" NOTE: Requires "textDocument.documentSymbol" support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has("nvim-0.4.0") || has("patch-8.2.0750")
    nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
    inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
    vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

"" preservim/nerdtree mappings
nnoremap <Leader>e :NERDTreeToggle<CR>

"" tpope/vim-eunuch mappings
" Rename the current file on disk and in the buffer
nnoremap <Leader>cR :Rename

"" tpope/vim-fugitive mappings
nnoremap <Leader>hd :Gdiffsplit<CR>
nnoremap <Leader>hb :Git blame<CR>

"" Convenience mappings

" Prevent space from moving forward
nnoremap <silent> <Space> <Nop>
xnoremap <silent> <Space> <Nop>

" Quick command mode (saves you from pressing Shift+; every time)
nnoremap <CR> :

" Repeat the last macro/change on a visual selection
vnoremap . :normal .<CR>

" Quick config reload
nnoremap <silent> <Leader>! :source $MYVIMRC<CR>

"" Tab mappings

" Go to the previous tab page
noremap <S-h> gT
" Go to the next tab page
noremap <S-l> gt

"" Window mappings

" Go to the window to the left
noremap <C-h> <C-w>h
" Go to the window below
noremap <C-j> <C-w>j
" Go to the window above
noremap <C-k> <C-w>k
" Go to the window to the right
noremap <C-l> <C-w>l

" Create a new buffer
nnoremap <Leader>n :enew<CR>
" Create a new buffer in a new vertical window split
nnoremap <Leader>% :vnew<CR>
" Create a new buffer in a new horizontal window split
nnoremap <Leader>" :new<CR>

"" Buffer mappings

" Jump to the most recent buffer
nnoremap <BS> <C-^>
" Jump to the previous buffer
nnoremap <Leader>[ :bprevious<CR>
" Jump to the next buffer
nnoremap <Leader>] :bnext<CR>
" Write the buffer
nnoremap <Leader>w :write<CR>
" Write all buffers
nnoremap <leader>W :wall<CR>

"" Movement mappings

" Go down one visual line
nnoremap <Down> gj
" Go up one visual line
nnoremap <Up> gk

"" Editing mappings

" Stop highlighting the search results
nnoremap <silent> <Esc><Esc> :nohlsearch<CR>

" Delete without changing registers
nnoremap x "_x
xnoremap x "_x

" Yank to clipboard
nnoremap cy "+y
xnoremap cy "+y

" Paste to clipboard
nnoremap cp "+p
xnoremap cp "+p

" Shift selection down
xnoremap <M-j> :m '>+1<CR>gv=gv
" Shift selection up
xnoremap <M-k> :m '<-2<CR>gv=gv
" Shift selection left
xnoremap <M-h> <gv
xnoremap < <gv
" Shift selection right
xnoremap <M-l> >gv
xnoremap > >gv

" Yank to the end of the line
nnoremap Y y$

"" List navigation mappings
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

"" Quickfix navigation
augroup QuickfixMappings
    autocmd!
    autocmd FileType qf nnoremap <buffer> <C-j> :cnext<CR>
    autocmd FileType qf nnoremap <buffer> <C-k> :cprev<CR>
augroup END

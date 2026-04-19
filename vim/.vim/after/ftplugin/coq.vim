setlocal ts=2 sw=2 et

map <F2> :CoqNext<CR>
map <F3> :CoqUndo<CR>
map <F4> :CoqToCursor<CR>
map <F5> :CoqToTop<CR>

imap <F2> <Esc>:CoqNext<CR>i
imap <F3> <Esc>:CoqUndo<CR>i
imap <F4> <Esc>:CoqToCursor<CR>i
imap <F5> <Esc>:CoqToTop<CR>i

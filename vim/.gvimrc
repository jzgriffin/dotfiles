" Interface
set columns=160
set lines=48
set guioptions=!Pc

" Locally-customized gvimrc
let gvimrclocal = substitute(expand("$MYVIMRC"), "vimrc$", "gvimrc.local", "")
if filereadable(gvimrclocal)
    execute 'source '.fnameescape(gvimrclocal)
endif

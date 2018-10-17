set wildignore+=*.pyc
setlocal tabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal autoindent
autocmd BufWritePre * :%s/\s\+$//e

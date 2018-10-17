execute pathogen#infect()
filetype on
filetype plugin on
filetype indent on
syntax on
autocmd BufWritePre * :%s/\s\+$//e
set list listchars=tab:╰━,trail:┉,extends:>
highlight SpecialKey ctermfg=red guifg=red
"set cul
set guifont=Monaco:h13
set number
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

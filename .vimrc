set t_Co=256            " 256 color mode
set number              " show line numbers
set autoindent          " auto indent
set ignorecase          " ignore case when searching
set smartcase           " ignore case if search pattern is all lowercase, case-sensitive otherwise
set smarttab            " indent start of line based on context
set history=50          " keep 50 lines of command line history
set expandtab           " replace <TAB> with spaces

set foldmethod=indent   " sets default fold method to indent
set softtabstop=4
set shiftwidth=4

" movement key remaps
map h <Up>
map l <Down>
map j <Left>
map k <Right>

map <F1> :set paste<CR>
map <F2> :set nopaste<CR>

colorscheme zenburn
syntax on

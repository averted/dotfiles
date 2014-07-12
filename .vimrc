set t_Co=256            " 256 color mode
set number              " show line numbers
set autoindent          " auto indent
set ignorecase          " ignore case when searching
set smartcase           " ignore case if search pattern is all lowercase, case-sensitive otherwise
set smarttab            " indent start of line based on context
set history=50          " keep 50 lines of command line history
set expandtab           " replace <TAB> with spaces
set laststatus=2        " always show statusline

set nobackup
set noswapfile

set foldmethod=indent   " sets default fold method to indent
set foldlevelstart=20
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4

set incsearch           " auto-move to first found search member
set hlsearch            " highlight all search matches

" return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" movement key remaps
map h <Up>
map l <Down>
map j <Left>
map k <Right>
map <F1> :set paste<CR>
map <F2> :set nopaste<CR>
map <Space> :CtrlP<CR>

" CtrlP
let g:ctrlp_working_path_mode = 0                       "CtrlP working path fix
set wildignore+=*/tmp/*,*/vendor/*,*.so,*.swp,*.zip     "Skip the following dirs
set runtimepath^=~/.vim/bundle/ctrlp.vim

au BufNewFile,BufRead *.twig set syntax=html            "Color-coding for twig
au BufNewFile,BufRead *.less set filetype=less          "Color-coding for less

" Status Line
set statusline=%F\ %h%m%r%w\ %P%=
set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\  " highlight
set statusline+=[%{strlen(&ft)?&ft:'none'},  " filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
set statusline+=%{&fileformat}]              " file format

syntax enable
colorscheme averted

set t_Co=256            " 256 color mode
set number              " show line numbers
set autoindent          " auto indent
set ignorecase          " ignore case when searching
set smartcase           " ignore case if search pattern is all lowercase, case-sensitive otherwise
set smarttab            " indent start of line based on context
set history=50          " keep 50 lines of command line history
set expandtab           " replace <TAB> with spaces
set laststatus=2        " always show statusline
"set colorcolumn=80      " show column at 80 char limit

set nobackup
set noswapfile

set foldmethod=indent   " sets default fold method to indent
set foldlevelstart=20
set smartindent
set tabstop=2
set softtabstop=2
set shiftwidth=2

set incsearch           " auto-move to first found search member
set hlsearch            " highlight all search matches

" copy selected to buffer
command! -range W :<line1>,<line2>w !pbcopy

" return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" remove all trailing whitespace on file write
autocmd BufWritePre * :%s/\s\+$//e

" movement key remaps
map h <Up>
map l <Down>
map j <Left>
map k <Right>
map 0 ^
map <F1> :set paste<CR>
map <F2> :set nopaste<CR>
map <F3> :call Retab()<CR>
" map <Space> :CtrlP<CR>

" vim-javascript
let g:javascript_enable_domhtmlcss = 1

" CtrlP
let g:ctrlp_working_path_mode = 0                       "CtrlP working path fix
set wildignore+=*/tmp/*,*/vendor/*,*.so,*.swp,*.zip     "Skip the following dirs
set runtimepath^=~/.vim/bundle/ctrlp.vim

" Filetypes
au BufNewFile,BufRead *.css  set filetype=stylus        "Color-coding for css / stylus
au BufNewFile,BufRead *.twig set syntax=html            "Color-coding for twig
au BufNewFile,BufRead *.less set filetype=less          "Color-coding for less
au BufNewFile,BufRead *.es6  set filetype=javascript    "Treat ES6 extensions as javascript
au BufNewFile,BufRead *.hbs  set filetype=html          "Treat HBS extensions as html

" Makefile
au FileType make setlocal noexpandtab

" Status Line
set statusline=%F\ %h%m%r%w\ %P%=
set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\   " highlight
set statusline+=[%{strlen(&ft)?&ft:'none'},                         " filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc},                        " encoding
set statusline+=%{&fileformat}]                                     " file format

" pathogen
execute pathogen#infect()

syntax on
colorscheme averted-v2

function! Retab()
  :exe "set noexpandtab"
  :exe "set tabstop=4"
  :exe "set shiftwidth=4"
  :exe "retab!"

  :exe "set tabstop=2"
  :exe "set shiftwidth=2"
  :exe "set expandtab"
  :exe "retab!"
endfunction

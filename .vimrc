""""""""""""""""""""""""""""""
" Settings
"
set t_Co=256                    " 256 color mode
set number                      " show line numbers
set autoindent                  " auto indent
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase, case-sensitive otherwise
set smarttab                    " indent start of line based on context
set history=50                  " keep 50 lines of command line history
set expandtab                   " replace <TAB> with spaces
set laststatus=2                " always show statusline
"set colorcolumn=80              " show column at 80 char limit

set nobackup
set noswapfile
set showcmd                     " show incomplete commands

set foldmethod=indent           " sets default fold method to indent
set foldlevelstart=20
set smartindent
set tabstop=2
set softtabstop=2
set shiftwidth=2

set incsearch                   " auto-move to first found search member
set hlsearch                    " highlight all search matches

set splitright
set backspace=indent,eol,start  " allow backspacing indents
let mapleader = ","             " remap Leader
""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" Auto CMD
"
" copy selected to buffer
command! -range W :<line1>,<line2>w !pbcopy

" return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" remove all trailing whitespace on file write
autocmd BufWritePre * :retab
autocmd BufWritePre * :%s/\s\+$//e
""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" movement key remaps
"
map h <Up>
map l <Down>
map j <Left>
map k <Right>
map 0 ^
:nmap <F1> <nop>
:imap <F1> <nop>
inoremap <F1> <nop>
map <F1> :set paste<CR>
map <F2> :set nopaste<CR>
map <F3> :call Retab()<CR>
map <Tab> <C-W><C-W>
map <S-Tab> <C-W>W
map <S-E> :vsp<CR>
noremap <Leader><Leader> :call ConsoleLog()<CR>
noremap <Leader>c :call CommentBlock()<CR>
noremap <Leader>t :call TestSuite()<CR>
" inoremap jj <Esc>

" Show current colorscheme colors
:nmap <F8> <nop>
:imap <F8> <nop>
inoremap <F8> <nop>
map <F8> :so $VIMRUNTIME/syntax/hitest.vim<CR>

" Buffer movement
map [[ :prev<CR>
map ]] :next<CR>

" Easy Vim Grep remaps
nnoremap - :vimgrep <cword> ./**/* <CR>:cw<CR>
set wildignore+=**/node_modules/**,**.jest-cache/**,**.build/**
""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" Plugins
"
" vim-flow
let g:flow#enable = 0
let g:flow#autoclose = 1
let g:flow#timeout = 10

" vim-go
let g:go_version_warning = 0

" vim-javascript
let g:javascript_enable_domhtmlcss = 1
let g:javascript_plugin_flow = 1

" vim-json
let g:vim_json_syntax_conceal = 0

" ctrl-p
map <Space> :CtrlP<CR>
let g:ctrlp_working_path_mode = 0                                                       "CtrlP working path fix
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']     "Ignore files in .gitignore
set wildignore+=*/node_modules/*,*/tmp/*,*/vendor/*,*.so,*.swp,*.zip                    "Skip the following dirs
set runtimepath^=~/.vim/bundle/vim-ctrlp
""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" Filetypes
"
au BufNewFile,BufRead *.css  set filetype=stylus        "Color-coding for css / stylus
au BufNewFile,BufRead *.less set filetype=less          "Color-coding for less
au BufNewFile,BufRead *.es6  set filetype=javascript    "Treat ES6 extensions as javascript
au BufNewFile,BufRead *.ino  set filetype=javascript    "Treat ES6 extensions as javascript
au BufNewFile,BufRead *.hbs  set filetype=html          "Treat HBS extensions as html
au BufNewFile,BufRead *.ejs  set filetype=html          "Treat EJS extensions as html
au BufNewFile,BufRead *.jet  set filetype=html          "Treat JET extensions as html
au FileType make setlocal noexpandtab                   "Makefile
""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" Status Line
"
set statusline=%F\ %h%m%r%w\ %P%=
set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\   " highlight
set statusline+=[%{strlen(&ft)?&ft:'none'},                         " filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc},                        " encoding
set statusline+=%{&fileformat}]                                     " file format
""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" Start plugins
"
execute pathogen#infect()

syntax on
colorscheme averted
""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" Functions
"
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

function! ConsoleLog()
  :exe ":normal o" . "console.log('--',)"
  :exe ":startinsert"
endfunction

function! CommentBlock()
  :exe ":normal o" . "/**"
  :exe ":normal o" . " * Comment."
  :exe ":normal o" . "*/"
endfunction

function! TestSuite()
  :exe "set nopaste"
  :exe ":normal o" . "describe('Test Suite', () => {"
  :exe ":normal o" . "beforeEach(() => {"
  :exe ":normal o" . "// before each"
  :exe ":normal o" . "})"
  :exe ":normal o"
  :exe ":normal o" . "  test('works correctly', () => {"
  :exe ":normal o" . "expect(someVar).not.toBeNull()"
  :exe ":normal o" . "expect(someVar).toHaveLength(1)"
  :exe ":normal o" . "expect(someVar[0].anotherVar).toEqual('test')"
  :exe ":normal o" . "})"
  :exe ":normal o"
  :exe ":normal o" . "  afterEach(() => {"
	:exe ":normal o" . "// after each"
  :exe ":normal o" . "})"
  :exe ":normal o" . "})"
endfunction
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" Settings
"
set encoding=utf-8
set fileencoding=utf-8
set t_Co=256                    " 256 color mode
set number                      " show line numbers
set autoindent                  " auto indent
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase, case-sensitive otherwise
set smarttab                    " indent start of line based on context
set history=50                  " keep 50 lines of command line history
set expandtab                   " replace <TAB> with spaces
set laststatus=2                " always show statusline
" set colorcolumn=100           " show column at char limit

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
set hidden                      " no need to save buffers manually

set splitright
set backspace=indent,eol,start  " allow backspacing indents
let mapleader = ","             " remap Leader
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" Auto CMD
"
"" Copy selected to buffer
command! -range W :<line1>,<line2>w !pbcopy

"" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

"" Remove all trailing whitespace on file write
autocmd BufWritePre * :retab
autocmd BufWritePre * :%s/\s\+$//e
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" Movement Remaps
"
map h <Up>
map l <Down>
map j <Left>
map k <Right>
map 0 ^
:nmap <F1> <nop>
:imap <F1> <nop>
noremap <F1> <nop>
inoremap <F1> <nop>
map <F1> :set paste<CR>
map <F2> :set nopaste<CR>
map <F3> :call Retab()<CR>
map <Tab> <C-W><C-W>
inoremap <Tab> <C-R>=pumvisible() ? "\<lt>C-Y>" : "\<lt>Tab>"<CR>
inoremap <CR> <C-R>=pumvisible() ? "\<lt>C-E>\<lt>CR>" : "\<lt>CR>"<CR>

map <S-Tab> <C-W>W
map <S-E> :vsp<CR>
noremap <Leader><Leader> :call ConsoleLog()<CR>
noremap <Leader>r :call ReactClass()<CR>
noremap <Leader>c :call CommentBlock()<CR>
noremap <Leader>t :call TestSuite()<CR>
noremap <Leader>e :call TestSuiteEnzyme()<CR>
noremap <Leader>f :call FlowFixMe()<CR>

"" File movement
map [[ :prev<CR>
map ]] :next<CR>

"" Buffer movement
map r :bn<CR>
map <BS> :bd<CR>

"" Increase / decrease split window width
map - <C-W>>
map = <C-W><

"" Easy Vim Grep remaps (deprecate?)
nnoremap \ :vimgrep <cword> ./**/* <CR>:cw<CR>
set wildignore+=**/node_modules/**,**.jest-cache/**,**.build/**
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" Filetypes
"
au BufNewFile,BufRead *.css  set filetype=stylus        "Color-coding for css / stylus
au BufNewFile,BufRead *.less set filetype=less          "Color-coding for less
au BufNewFile,BufRead *.es6  set filetype=javascript    "Treat ES6 extensions as javascript
au BufNewFile,BufRead *.ino  set filetype=javascript    "Treat ES6 extensions as javascript
au BufNewFile,BufRead *.jsx  set filetype=javascript    "Treat ES6 extensions as javascript
au BufNewFile,BufRead *.ts   set filetype=javascript    "Treat ES6 extensions as javascript
au BufNewFile,BufRead *.hbs  set filetype=html          "Treat HBS extensions as html
au BufNewFile,BufRead *.ejs  set filetype=html          "Treat EJS extensions as html
au BufNewFile,BufRead *.jet  set filetype=html          "Treat JET extensions as html
au BufNewFile,BufRead *.html set filetype=html          "Treat JET extensions as html
au BufNewFile,BufRead *.java set filetype=javaOverride
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" Dictionaries
"
"" js
au FileType javascript execute 'setlocal dict+=~/.vim/dictionaries/js.dict'

"" JSON
au FileType json execute 'setlocal dict+=~/.vim/dictionaries/json.dict'

"" Makefile
au FileType make setlocal noexpandtab

"" Java (unused)
" au FileType javaOverride setlocal tabstop=4
" au FileType javaOverride setlocal softtabstop=4
" au FileType javaOverride setlocal shiftwidth=4
" au FileType javaOverride execute 'setlocal dict+=~/.vim/dictionaries/java.dict'

" let java_highlight_debug=1
" let java_highlight_functions=1
" let java_highlight_java_lang_ids=1
" let java_space_errors=1
" let java_comment_strings=1
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" NERDtree
"
""" Always open tree on startup
"" autocmd vimenter * NERDTree
"
""" Open tree when no files specified
"" autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"
""" Open tree when opening a directory
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
"
""" Remove arrows
"let g:NERDTreeDirArrowExpandable = ''
"let g:NERDTreeDirArrowCollapsible = ''
"
""" Close tree if it's the only tab
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"
""" Toggle tree shotcut
"map <Leader>x :NERDTreeToggle<CR>
"
""" Custom key re-maps
"let NERDTreeMapOpenExpl = '\e'
"let NERDTreeMapOpenVSplit = 'e'
"let NERDTreeMapPreviewVSplit = 'ge'
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" Airline
"
"" Enable / disable
" let g:airline_disable_statusline = 1

"" Disable default --INSERT-- text
set noshowmode

"" Custom sections
" let g:airline_section_b = '%-0.20{getcwd()}'
let g:airline_section_x = ''
let g:airline_section_y = ''

"" Render powerline fonts
let g:airline_powerline_fonts = 1
let g:airline_highlighting_cache = 1
let g:airline_theme='averted'

"" Disable all airline extensions (more perf)
let g:airline_extensions = ['bufferline']

"" Render tabs / buffers on top
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#formatter = 'unique_tail'

let g:airline#extensions#bufferline#overwrite_variables = 0
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" Bufferline
"
let g:bufferline_echo = 0
let g:bufferline_modified = ' +'
let g:bufferline_fname_mod = ':p:.'
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" Status Line
"
" set statusline=%F\ %h%m%r%w\ %P%=
" set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\   " highlight
" set statusline+=[%{strlen(&ft)?&ft:'none'},                         " filetype
" set statusline+=%{strlen(&fenc)?&fenc:&enc},                        " encoding
" set statusline+=%{&fileformat}]                                     " file format
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" CTRL-p
"
map <Space> :CtrlP<CR>
let g:ctrlp_working_path_mode = 0                                                       "CtrlP working path fix
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']     "Ignore files in .gitignore
set wildignore+=*/node_modules/*,*/tmp/*,*/vendor/*,*.so,*.swp,*.zip                    "Skip the following dirs
set runtimepath^=~/.vim/bundle/vim-ctrlp
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" ACP Completion
"
let g:acp_behaviorKeywordLength = 1
set completeopt=menu
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags noci
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags noci
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" Vim-javascript
"
let g:javascript_enable_domhtmlcss = 1
let g:javascript_plugin_flow = 1
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" Vim-json
"
let g:vim_json_syntax_conceal = 0
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" Init
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
  :exe ":normal o" . "console.log('-- "
  :exe ":startinsert"
endfunction

function! CommentBlock()
  :exe ":normal o" . "/**"
  :exe ":normal o" . " * Comment"
  :exe ":normal o" . "*/"
endfunction

function! ReactClass()
  :exe "set nopaste"
  :exe ":normal o" . "// @flow"
  :exe ":normal o" . "import React from 'react'"
  :exe ":normal o" . ""
  :exe ":normal o" . "export default class ExampleClass extends React.Component<{}> {"
  :exe ":normal o" . "render() {"
  :exe ":normal o" . "const { item } = this.props"
  :exe ":normal o" . "return ("
  :exe ":normal o" . ")"
  :exe ":normal o" . "}"
  :exe ":normal o" . "}"
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

function! TestSuiteEnzyme()
  :exe "set nopaste"
  :exe ":normal o" . "import React from 'react'"
  :exe ":normal o" . "import { mount } from 'enzyme'"
  :exe ":normal o" . "import Logo from '../'"
  :exe ":normal o"
  :exe ":normal o" . "describe('Logo', () => {"
  :exe ":normal o" . "it('renders', () => {"
  :exe ":normal o" . "const wrapper = mount(<Logo name=\"logo example name\" />)"
  :exe ":normal o" . "expect(wrapper.text()).toMatch(/logo example name/)"
  :exe ":normal o" . "expect(wrapper.find('Logo')).toHaveLength(1)"
  :exe ":normal o" . "expect(wrapper.find('Logo').getDOMNode().tagName).toEqual('SPAN')"
  :exe ":normal o" . "expect(wrapper.find('Logo').getDOMNode().localName).toEqual('span')"
  :exe ":normal o" . "})"
  :exe ":normal o" . "})"
endfunction

function! FlowFixMe()
  :exe "set nopaste"
  :exe ":normal o" . "// TODO: $FlowFixMe"
  :exe ":normal o" . "static defaultProps = {}"
  :exe ":normal o"
endfunction
""""""""""""""""""""""""""""""

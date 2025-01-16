""""""""""""""""""""""""""""""
" Settings
"
set encoding=utf-8
set fileencoding=utf-8
set t_Co=256                    " 256 color mode
set number                      " show line numbers
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase, case-sensitive otherwise
set smarttab                    " indent start of line based on context
set history=100                 " increase command line history limit
set expandtab                   " replace <TAB> with spaces
set laststatus=2                " always show statusline
" set colorcolumn=100           " show column at char limit

set nobackup
set nowritebackup
set noswapfile
set showcmd                     " show incomplete commands

set foldmethod=indent           " sets default fold method to indent
set foldlevelstart=20
set tabstop=2
set softtabstop=2
set shiftwidth=2

set autoindent                  " auto indent
"set smartindent

set incsearch                   " auto-move to first found search member
set hlsearch                    " highlight all search matches
set hidden                      " no need to save buffers manually

set splitright
set backspace=indent,eol,start  " allow backspacing indents

set wildmode=full
set showtabline=0

let mapleader = ","             " remap Leader

" coc specific global settings
set updatetime=300
set signcolumn=yes

syntax enable
filetype plugin indent on
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
" Overrides
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
map <Tab> <C-W><C-W>

map <S-Tab> <C-W>W
map <S-E> :vsp<CR>
noremap <Leader><Leader> :call RustDeriveBlock()<CR>
noremap <Leader>r :call ReactClass()<CR>
noremap <Leader>c :call CommentBlock()<CR>
noremap <Leader>t :call RustTestSuite()<CR>
noremap <Leader>l :call RustPrintMarco()<CR>
noremap <Leader>b :ls<CR>:b<Space>
noremap <Leader>s :call RustDocsSearch()<CR><CR>
noremap <Leader>h :call HighlightGroup()<CR><CR>

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

"" Remaps :e to :arga to buffer multiple files
"cnoreabbrev <expr> e getcmdtype() == ":" && getcmdline() == 'e' ? 'argadd' : 'e'

""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" Filetypes
"
au BufNewFile,BufRead *.rs   set filetype=rust          "Color-coding for rust
au BufNewFile,BufRead *.css  set filetype=stylus        "Color-coding for css / stylus
au BufNewFile,BufRead *.less set filetype=less          "Color-coding for less
au BufNewFile,BufRead *.es6  set filetype=javascript    "Treat ES6 extensions as javascript
au BufNewFile,BufRead *.ino  set filetype=javascript    "Treat ES6 extensions as javascript
au BufNewFile,BufRead *.jsx  set filetype=javascript    "Treat ES6 extensions as javascript
au BufNewFile,BufRead *.tsx  set filetype=javascript    "Treat TSX extensions as javascript
au BufNewFile,BufRead *.ts   set filetype=javascript    "Treat TS extensions as javascript
au BufNewFile,BufRead *.hbs  set filetype=html          "Treat HBS extensions as html
au BufNewFile,BufRead *.ejs  set filetype=html          "Treat EJS extensions as html
au BufNewFile,BufRead *.jet  set filetype=html          "Treat JET extensions as html
au BufNewFile,BufRead *.html set filetype=html          "Treat JET extensions as html
au BufNewFile,BufRead *.java set filetype=javaOverride
au BufNewFile,BufRead * setlocal formatoptions-=cro     " disables continuation of comments on the next line
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" Dictionaries
"
"" Rust
au FileType rust execute 'setlocal dict+=~/.vim/dictionaries/rust.dict'

"" js
au FileType javascript execute 'setlocal dict+=~/.vim/dictionaries/js.dict'
au FileType javascript execute 'setlocal dict+=~/.vim/dictionaries/ts.dict'

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

"" Toggle tree shotcut
map <Leader>x :NERDTreeToggle<CR>

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
" Vim-bufferline
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
let g:ctrlp_open_multiple_files = 't'                                                       "CtrlP working path fix
let g:ctrlp_working_path_mode = 0                                                           "CtrlP working path fix
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)|(node_modules|target|dist)$',
  \ 'file': '\v\.(exe|so|dll)|(package-lock.json|yarn.lock)$',
  \ }
"set wildignore+=*/node_modules/*,*/tmp/*,*/vendor/*,*/target/*,*/dist/*,*.so,*.swp,*.zip         "Skip the following dirs
set runtimepath^=~/.vim/bundle/vim-ctrlp
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" ACP Completion
"
" let g:acp_behaviorKeywordLength = 1
" set completeopt=menu
" autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags noci
" autocmd FileType html set omnifunc=htmlcomplete#CompleteTags noci
" inoremap <Tab> <C-R>=pumvisible() ? "\<lt>C-Y>" : "\<lt>Tab>"<CR>
" inoremap <CR> <C-R>=pumvisible() ? "\<lt>C-E>\<lt>CR>" : "\<lt>CR>"<CR>
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
" Vim-rust
"
let g:rustfmt_autosave = 1
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" Vim-rooter
"
let g:rooter_patterns = ['src', '!=www']
let g:rooter_silent_chdir = 1
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" Vim-minimap
"
let g:minimap_width = 20
let g:minimap_auto_start = 0
let g:minimap_auto_start_win_enter = 0
let g:minimap_base_highlight="Comment"
let g:minimap_highlight_search=1

"" Toggle minimap shotcut
map <Leader>m :MinimapToggle<CR>
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" Auto pairs
"
let g:AutoPairsMapCR = 1
let g:AutoPairsCenterLine = 0
let g:AutoPairsFlyMode = 0
let g:AutoPairsMapSpace = 0
let g:AutoPairsMultilineClose = 0
let g:AutoPairsShortcutFastWrap = '<C-n>'
" let g:AutoPairsShortcutJump = '<C-w>'
au Filetype javascript let g:AutoPairsMapCR = 0

""""""""""""""""""""""""""""""
" Ale
"
" let g:ale_set_signs = 0
" let g:ale_lint_on_enter = 0
" let g:ale_lint_delay = 200
" let g:ale_fix_on_save = 0
" let g:ale_set_balloons = 0
" let g:ale_set_highlights = 1
" let g:ale_virtualtext_cursor = 'disabled'     " Removes E: inline errors
" au FileType javascript let g:ale_enabled = 0
"

""""""""""""""""
" Rust - CoC
"
inoremap <silent><expr> <tab> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<TAB>"
inoremap <silent><expr> <cr> "\<c-g>u\<CR>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

""""""""""""""""
" Github Copilot
"
let g:copilot_enabled = 1
let g:copilot_filetypes = {
  \ '*': v:false,
  \ 'javascript': v:true,
  \ 'typescript': v:true,
  \ 'typescriptreact': v:true,
  \ 'javascriptreact': v:true,
  \ 'html': v:true,
  \ 'css': v:true,
  \ 'scss': v:true,
  \ 'less': v:true,
  \ 'json': v:true,
  \ 'yaml': v:true,
  \ 'markdown': v:true,
  \ 'rust': v:true,
  \ 'bash': v:true,
  \ 'lua': v:true,
  \ 'react': v:true
  \ }

" Remap keys for applying code actions at the cursor position
nmap <leader>a  <Plug>(coc-codeaction-cursor)

""""""""""""""""""""""""""""""
" Init
"
execute pathogen#infect()

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
  :exe ":normal o" . "console.log('-- ', )"
endfunction

function! CommentBlock()
  :exe ":normal o" . "/**"
  :exe ":normal o" . " * Comment"
  :exe ":normal o" . "*/"
endfunction

function! Sum()
  :exe ":%!awk '{print; total+=$1}END{print total}'"
endfunction

function! RustPrintMarco()
  :exe ":normal o" . "println!(\"test: {}\", test);"
endfunction

function! ReactClass()
  :exe "set nopaste"
  :exe ":normal i" . "import React from 'react'"
  :exe ":normal o" . ""
  :exe ":normal o" . "type Props = {\<CR>test: string\<CR>\<BS>"
  :exe ":normal o" . ""
  :exe ":normal o" . "export default ({ test }: Props) => {\<CR>return ()\<CR>\<BS>"
endfunction

function! TestSuite()
  :exe "set nopaste"
  :exe ":normal o" . "describe('Test Suite', () => {"
  :exe ":normal o" . "beforeEach(() => {"
  :exe ":normal o" . "// before each"
  :exe ":normal o" . "})"
  :exe ":normal o"
  :exe ":normal o" . "  it('works correctly', () => {"
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

function! RustTestSuite()
  :exe "set nopaste"
  :exe ":normal o" . "#[cfg(test)]"
  :exe ":normal o" . "mod tests {\<CR>use super::*;"
  :exe ":normal o"
  :exe ":normal o" . "#[test]"
  :exe ":normal o" . "fn some_test() {\<CR>assert_eq!(true, true);"
endfunction

function! RustDeriveBlock()
  :exe "set nopaste"
  :exe ":normal O" . "#[derive(Debug)]"
endfunction

function! RustDocsSearch()
  :exe "!/Applications/Firefox.app/Contents/MacOS/firefox https://doc.rust-lang.org/stable/std/index.html?search=" . expand("<cword>")
endfunction

function! HighlightGroup()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

""""""""""""""""""""""""""""""

" ============================================================================
" File: averted.vim
" Description: averted colorscheme.
" Mantainer: https://github.com/averted
" Url: https://github.com/averted/vim/colors/averted.vim
" License: MIT
" Version: 0.1
" Last Changed: 24 Nov 2013
" ============================================================================

" Init colors

" dark-bg colors
let s:dark_fg              = "dfdfdf"
let s:dark_bg              = "303030"
let s:dark_red             = "e2366d"  " f22c40 bright red
let s:dark_pink            = "f66fd6"
let s:dark_blue            = "407ee7"  " 407ee7 a bit lighter blue / 4271ae default
let s:dark_cyan            = "00aea3"  " 00c7b4 (new color) / 00c7c5 / 3e999f / 00ad9c / 159393
let s:dark_light_blue      = "00b3c8"
let s:dark_orange          = "ff9000"  " ff9000 - orange (dark)
let s:dark_green           = "4bbf23"  " 4bbf23 | 53d527
let s:dark_yellow          = "c3b622"
let s:dark_gold            = "c3a922"
let s:dark_violet          = "5353fe"
let s:dark_magenta         = "d90da9"
let s:dark_grey_comment    = "808080"  " 68615e
let s:dark_grey0           = "848484"
let s:dark_grey1           = "919191"
let s:dark_grey2           = "9e9e9e"
let s:dark_grey3           = "aaaaaa"
let s:dark_grey4           = "b7b7b7"
let s:dark_grey5           = "c4c4c4"
let s:dark_black           = "1f1f1f"
let s:dark_unknown         = "bc27f2"  " magenta
let s:dark_test            = "f6708d"  " magenta

" light-bg colors
let s:light_fg              = "505050"
let s:light_bg              = "fafafa"
let s:light_red             = "d70000"
let s:light_blue            = "4193a0" " 0070af - navy; 268bd2 - bright; 4193a0 - git
let s:light_cyan            = "008B8B"
let s:light_orange          = "ff7302"
let s:light_white           = "ffffff"
let s:light_yellow          = "af8700"
let s:light_violet          = "715ba1"
let s:light_magenta         = "FF1493"
let s:light_gold            = "c3a922"
let s:light_green           = "1d771d"
let s:light_grey            = "444444"
let s:light_grey1           = "7f7f7f"
let s:light_grey2           = "262626"
let s:light_grey3           = "888a85"
let s:light_grey4           = "a6a6a6"
let s:light_black           = "073642"
let s:light_unknown         = "FF1493"

let s:curr_bg = "dark"

let g:colors_name = "averted"

if version > 580
  " no guarantees for version 5.8 and below, but this makes it stop
  " complaining
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif

if has("gui_running") || &t_Co == 88 || &t_Co == 256
  " functions {{{
  " returns an approximate grey index for the given grey level
  fun <SID>grey_number(x)
    if &t_Co == 88
      if a:x < 23
        return 0
      elseif a:x < 69
        return 1
      elseif a:x < 103
        return 2
      elseif a:x < 127
        return 3
      elseif a:x < 150
        return 4
      elseif a:x < 173
        return 5
      elseif a:x < 196
        return 6
      elseif a:x < 219
        return 7
      elseif a:x < 243
        return 8
      else
        return 9
      endif
    else
      if a:x < 14
        return 0
      else
        let l:n = (a:x - 8) / 10
        let l:m = (a:x - 8) % 10
        if l:m < 5
          return l:n
        else
          return l:n + 1
        endif
      endif
    endif
  endfun

  " returns the actual grey level represented by the grey index
  fun <SID>grey_level(n)
    if &t_Co == 88
      if a:n == 0
        return 0
      elseif a:n == 1
        return 46
      elseif a:n == 2
        return 92
      elseif a:n == 3
        return 115
      elseif a:n == 4
        return 139
      elseif a:n == 5
        return 162
      elseif a:n == 6
        return 185
      elseif a:n == 7
        return 208
      elseif a:n == 8
        return 231
      else
        return 255
      endif
    else
      if a:n == 0
        return 0
      else
        return 8 + (a:n * 10)
      endif
    endif
  endfun

  " returns the palette index for the given grey index
  fun <SID>grey_color(n)
    if &t_Co == 88
      if a:n == 0
        return 16
      elseif a:n == 9
        return 79
      else
        return 79 + a:n
      endif
    else
      if a:n == 0
        return 16
      elseif a:n == 25
        return 231
      else
        return 231 + a:n
      endif
    endif
  endfun

  " returns an approximate color index for the given color level
  fun <SID>rgb_number(x)
    if &t_Co == 88
      if a:x < 69
        return 0
      elseif a:x < 172
        return 1
      elseif a:x < 230
        return 2
      else
        return 3
      endif
    else
      if a:x < 75
        return 0
      else
        let l:n = (a:x - 55) / 40
        let l:m = (a:x - 55) % 40
        if l:m < 20
          return l:n
        else
          return l:n + 1
        endif
      endif
    endif
  endfun

  " returns the actual color level for the given color index
  fun <SID>rgb_level(n)
      if &t_Co == 88
          if a:n == 0
              return 0
          elseif a:n == 1
              return 139
          elseif a:n == 2
              return 205
          else
              return 255
          endif
      else
          if a:n == 0
              return 0
          else
              return 55 + (a:n * 40)
          endif
      endif
  endfun

  " returns the palette index for the given R/G/B color indices
  fun <SID>rgb_color(x, y, z)
    if &t_Co == 88
      return 16 + (a:x * 16) + (a:y * 4) + a:z
    else
      return 16 + (a:x * 36) + (a:y * 6) + a:z
    endif
  endfun

  " returns the palette index to approximate the given R/G/B color levels
  fun <SID>color(r, g, b)
    " get the closest grey
    let l:gx = <SID>grey_number(a:r)
    let l:gy = <SID>grey_number(a:g)
    let l:gz = <SID>grey_number(a:b)

    " get the closest color
    let l:x = <SID>rgb_number(a:r)
    let l:y = <SID>rgb_number(a:g)
    let l:z = <SID>rgb_number(a:b)

    if l:gx == l:gy && l:gy == l:gz
      " there are two possibilities
      let l:dgr = <SID>grey_level(l:gx) - a:r
      let l:dgg = <SID>grey_level(l:gy) - a:g
      let l:dgb = <SID>grey_level(l:gz) - a:b
      let l:dgrey = (l:dgr * l:dgr) + (l:dgg * l:dgg) + (l:dgb * l:dgb)
      let l:dr = <SID>rgb_level(l:gx) - a:r
      let l:dg = <SID>rgb_level(l:gy) - a:g
      let l:db = <SID>rgb_level(l:gz) - a:b
      let l:drgb = (l:dr * l:dr) + (l:dg * l:dg) + (l:db * l:db)
      if l:dgrey < l:drgb
        " use the grey
        return <SID>grey_color(l:gx)
      else
        " use the color
        return <SID>rgb_color(l:x, l:y, l:z)
      endif
    else
      " only one possibility
      return <SID>rgb_color(l:x, l:y, l:z)
    endif
  endfun

  " returns the palette index to approximate the 'rrggbb' hex string
  fun <SID>rgb(rgb)
    let l:r = ("0x" . strpart(a:rgb, 0, 2)) + 0
    let l:g = ("0x" . strpart(a:rgb, 2, 2)) + 0
    let l:b = ("0x" . strpart(a:rgb, 4, 2)) + 0

    return <SID>color(l:r, l:g, l:b)
  endfun

  " sets the highlighting for the given group
  fun <SID>X(group, fg, bg, attr)
    if s:curr_bg == "dark"
      if !empty(a:fg)
        exec "hi " . a:group . " guifg=#" . a:fg[0] . " ctermfg=" . <SID>rgb(a:fg[0])
      endif
      if !empty(a:bg)
        exec "hi " . a:group . " guibg=#" . a:bg[0] . " ctermbg=" . <SID>rgb(a:bg[0])
      endif
    else
      if !empty(a:fg)
        exec "hi " . a:group . " guifg=#" . a:fg[1] . " ctermfg=" . <SID>rgb(a:fg[1])
      endif
      if !empty(a:bg)
        exec "hi " . a:group . " guibg=#" . a:bg[1] . " ctermbg=" . <SID>rgb(a:bg[1])
      endif
    endif
    if a:attr != ""
      exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
    endif
  endfun
  " }}}

  " Vim Highlighting
  call <SID>X( "Normal", [s:dark_fg, s:light_fg], [s:dark_bg, s:light_bg], "")  " normal text
  call <SID>X( "Cursor", [s:dark_red, s:light_red], [s:dark_cyan, s:light_blue], "")  " the character under the cursor
  call <SID>X( "NonText", [s:dark_orange, s:light_blue], [], "none")  " '~' and '@' at the end of the window
  call <SID>X( "SpecialKey", [s:dark_grey3, s:light_red], [s:dark_black, s:light_black], "none")  " Meta and special keys listed with ':map'

  call <SID>X( "Search", [s:dark_bg, s:light_bg],  [s:dark_orange, s:light_grey], "")  " Last search pattern highlighting (see 'hlsearch').
  call <SID>X( "IncSearch", [s:dark_orange, s:light_grey], [s:dark_bg, s:light_bg], "")  " 'incsearch' highlighting; also used for the text replaced with ':s///c'

  call <SID>X( "StatusLine", [s:dark_orange, s:light_bg], [s:dark_black, s:light_grey1], "none" )  " status line of current window
  call <SID>X( "StatusLineNC", [s:dark_bg, s:light_blue], [s:dark_grey_comment, s:light_black], "" )  " status lines of not-current windows
  "call <SID>X( "StatusLineErr", [s:dark_red, s:light_lightred], [s:dark_lighterbg1, s:light_grey4], "" )  " custom
  "call <SID>X( "StatusLineBold", [s:dark_blue, s:light_blue], [s:dark_lighterbg1, s:light_grey4], "bold" )  " custom

  call <SID>X( "VertSplit", [s:dark_black, s:light_unknown],  [s:dark_orange, s:light_cyan], "" )  " the column separating vertically split windows

  call <SID>X( "Visual", [s:dark_black, s:light_white], [s:dark_orange, s:light_blue], "")  " visual mode selection
  call <SID>X( "MatchParen", [s:dark_black, s:light_bg], [s:dark_orange, s:light_blue], "")  " The character under the cursor or just before it, if it is a paired bracket, and its match.

  call <SID>X( "Directory", [s:dark_blue, s:light_blue], [], "" )  " directory names (and other special names in listings

  call <SID>X( "Folded", [s:dark_orange, s:light_bg], [s:dark_black, s:light_grey1], "")  " line used for closed folds
  call <SID>X( "FoldColumn", [s:dark_orange, s:light_unknown], [s:dark_bg, s:light_grey1], "")  " see 'foldcolumn'

  call <SID>X( "WarningMsg", [s:dark_orange, s:light_black], [], "" ) " warning messages
  call <SID>X( "ErrorMsg", [s:dark_black, s:light_bg], [s:dark_orange, s:light_grey], "")  " error messages on the command line
  call <SID>X( "ModeMsg", [s:dark_orange, s:light_black], [], "none")  " 'showmode' message (e.g., '-- INSERT --')
  call <SID>X( "MoreMsg", [s:dark_orange, s:light_black], [], "")  " more-prompt

  call <SID>X( "Question", [s:dark_red, s:light_unknown],  [], "")  " hit-enter prompt and yes/no questions
  call <SID>X( "WildMenu", [s:dark_red, s:light_red], [s:dark_bg, s:light_bg], "" )  " current match in 'wildmenu' completion
  call <SID>X( "SignColumn", [], [s:dark_red, s:light_red], "" )  " column where signs are displayed

  call <SID>X( "Linenr", [s:dark_orange, s:light_grey4], [], "" )  " line number for ':number' and ':#' commands, and when 'number' or 'relativenumber' option is set.

  call <SID>X( "DiffAdd", [s:dark_bg, s:light_bg], [s:dark_green, s:light_green], "")  " diff mode: Added line
  call <SID>X( "DiffDelete", [s:dark_bg, s:light_bg], [s:dark_red, s:light_red], "" )  " diff mode: Deleted line
  call <SID>X( "DiffChange", [s:dark_bg, s:light_bg], [s:dark_blue, s:light_gold], "" )  " diff mode: Changed line
  call <SID>X( "DiffText", [s:dark_bg, s:light_bg], [s:dark_orange, s:light_red], "" )  " diff mode: Changed text within a changed line
  call <SID>X( "ColorColumn", [], [s:dark_grey0, s:light_red], "" )  " used for the columns set with 'colorcolumn'

  if version >= 700

  "call <SID>X( "CursorLineNr", [s:dark_cyan, s:light_cyan], [], "none" )  " like LineNr when 'cursorline' is set for the cursor line.
  "call <SID>X( "CursorLine", [], [s:dark_bg, s:light_bg], "none" )  " the screen line that the cursor is in when 'cursorline' is set
  "call <SID>X( "CursorColumn", [], [s:dark_bg, s:light_bg], "" )  " the screen column that the cursor is in when 'cursorcolumn' is set

  call <SID>X( "PMenu", [s:dark_orange, s:light_blue], [s:dark_black, s:light_fg], "none" )  " popup menu: normal item
  call <SID>X( "PMenuSel", [s:dark_black, s:light_fg], [s:dark_orange, s:light_blue], "none" )  " popup menu: selected item
  call <SID>X( "PMenuSBar", [s:dark_grey0, s:light_grey1], [s:dark_grey0, s:light_grey1], "none" )  " popup menu: scrollbar
  call <SID>X( "PMenuThumb", [s:dark_grey0, s:light_grey1], [s:dark_grey3, s:light_grey2], "none" )  " popup menu: Thumb of the scrollbar

  "call <SID>X( "TabLine", [s:dark_fg, s:light_grey1], [s:dark_lighterbg2, s:light_grey4], "none" )  " tab pages line, not active tab page label
  "call <SID>X( "TabLineSel", [s:dark_bg, s:light_bg], [s:dark_lightblue, s:light_lightblue], "none" )  " tab pages line, active tab page label
  "call <SID>X( "TabLineFill", [s:dark_lightgrey, s:light_grey2], [s:dark_lighterbg2, s:light_grey4], "none" )  " tab pages line, where there are no labels

  endif

  if version >= 703

  "call <SID>X( "Conceal", [s:dark_lighterbg2, s:light_grey2], [s:dark_bg, s:light_bg], "" )  " placeholder characters substituted for concealed text (see 'conceallevel')

  " TODO
  "call <SID>X( "SpellBad", [], [], "undercurl" )  " word that is not recognized by the spellchecker. This will be combined with the highlighting used otherwise
  "call <SID>X( "SpellCap", [], [], "" )  " word that should start with a capital. This will be combined with the highlighting used otherwise
  "call <SID>X( "SpellLocal", [], [], "" )  " word that is recognized by the spellchecker as one that is used in another region. This will be combined with the highlighting used otherwise
  "call <SID>X( "SpellRare", [], [], "" )  " word that is recognized by the spellchecker as one that is hardly ever used. This will be combined with the highlighting used otherwise
  end

  " Standard Language Highlighting
  call <SID>X( "Constant", [s:dark_fg, s:light_green], [], "" )  " any constant
  call <SID>X( "String", [s:dark_green, s:light_red], [], "" )   " a string constant: 'this is a string'
  "call <SID>X( "Character", [s:dark_plum, s:light_green], [], "" )  " a character constant: 'c', '\n'
  call <SID>X( "Identifier", [s:dark_orange, s:light_black], [], "" )  " any variable name
  call <SID>X( "Identifiero", [s:dark_unknown, s:light_fg], [], "none")
  call <SID>X( "Function", [s:dark_blue, s:light_blue], [], "" )  " function name (also: methods for classes)
  call <SID>X( "Statement",  [s:dark_orange, s:light_blue], [], "" )  " any statement
  call <SID>X( "Conditional",[s:dark_orange, s:light_blue], [], "" )  " if, then, else, endif, switch, etc
  "call <SID>X( "Label", [s:dark_pink, s:light_purple], [], "" )  "  case, default, etc.
  "call <SID>X( "Repeat", [s:dark_orange, s:light_orange], [], "" )  " for, do, while, etc.
  call <SID>X( "Comment", [s:dark_grey_comment, s:light_grey4], [], "")  " any comment
  "call <SID>X( "Operator", [s:dark_cyan, s:light_cyan], [], "none" )  " 'sizeof', '+', '*', etc.
  "call <SID>X( "Keyword", [s:dark_fg, s:light_fg], [], "" )  " any other keyword
  "call <SID>X( "Exception", [s:dark_red, s:light_lightred], [], "" )  " try, catch, throw
  call <SID>X( "PreProc", [s:dark_orange, s:light_fg], [], "" )  " generic Preprocessor
  "call <SID>X( "Include", [s:dark_darkerfg, s:light_grey1], [], "" )  " preprocessor #include
  "call <SID>X( "Define", [s:dark_pink, s:light_purple], [], "none" )  " preprocessor #define
  "call <SID>X( "Macro", [s:dark_pink, s:light_purple], [], "none" )  " preprocessor #define
  "call <SID>X( "PreCondit", [s:dark_pink, s:light_purple], [], "")  " preprocessor #if, #else, #endif, etc
  call <SID>X( "Type", [s:dark_unknown, s:light_fg], [], "none" )  " int, long, char, etc.
  "call <SID>X( "StorageClass", [s:dark_cyan, s:light_cyan], [], "" )  " static, register, volatile, etc.
  "call <SID>X( "Structure", [s:dark_cyan, s:light_cyan], [], "" )  " struct, union, enum, etc.
  "call <SID>X( "Typedef", [s:dark_darkerfg, s:light_grey1], [], "" )  " a typedef
  call <SID>X( "Special", [s:dark_unknown, s:light_fg], [], "")  " any special symbol
  call <SID>X( "Underlined", [s:dark_unknown, s:light_fg], [], "underline" )  " text that stands out, HTML links
  call <SID>X( "Title", [s:dark_orange, s:light_black], [], "bold" )
  call <SID>X( "Error", [], [s:dark_red, s:light_red], "none" )  " any erroneous construct
  call <SID>X( "Todo", [s:dark_black, s:light_white], [s:dark_grey_comment, s:light_grey4], "")  " anything that needs extra attention; mostly the keywords TODO FIXME and XXX

  "" Vimrc Highlighting
  call <SID>X( "vimCommand", [s:dark_blue, s:light_blue], [], "none" )
  call <SID>X( "vimFuncName", [s:dark_cyan, s:light_cyan], [], "none" )

  "" HTML Highlighting
  call <SID>X( "htmlTag", [s:dark_yellow, s:light_fg], [], "" )
  call <SID>X( "htmlTagN", [s:dark_yellow, s:light_fg], [], "" )
  call <SID>X( "htmlTagName", [s:dark_yellow, s:light_fg], [], "" )
  call <SID>X( "htmlEndTag", [s:dark_yellow, s:light_grey1], [], "" )
  call <SID>X( "htmlArg", [s:dark_yellow, s:light_blue],[], "" )
  call <SID>X( "htmlSpecialChar", [s:dark_red, s:light_blue],[], "" )
  "call <SID>X( "htmlScriptTag", [s:dark_paleblue, s:light_grey1], [], "" )

  "" Jade Highlighting
  call <SID>X( "jadeClass", [s:dark_blue, s:light_blue], [], "" )
  call <SID>X( "jadeClassChar", [s:dark_blue, s:light_blue], [], "" )
  call <SID>X( "jadeId", [s:dark_blue, s:light_black], [], "" )
  call <SID>X( "jadeIdChar", [s:dark_blue, s:light_black], [], "" )
  call <SID>X( "jadeAttributes", [s:dark_yellow, s:light_black], [], "" )
  call <SID>X( "jadeAttributesDelimiter", [s:dark_orange, s:light_black], [], "" )
  call <SID>X( "jadeHtmlArg", [s:dark_yellow, s:light_violet], [], "" )
  call <SID>X( "jadePipeChar", [s:dark_red, s:light_black], [], "" )
  call <SID>X( "jadePipedText", [s:dark_green, s:light_black], [], "" )
  call <SID>X( "jadeTagBlockChar", [s:dark_fg, s:light_black], [], "" )
  call <SID>X( "jadeBlockExpansionChar", [s:dark_fg, s:light_black], [], "" )
  call <SID>X( "jadeScriptStatement", [s:dark_orange, s:light_green], [], "" )

  "" GIT Highlighting
  call <SID>X( "gitrebasePick", [s:dark_red, s:light_violet], [], "" )
  call <SID>X( "gitrebaseReword", [s:dark_red, s:light_violet], [], "" )
  call <SID>X( "gitrebaseEdit", [s:dark_red, s:light_violet], [], "" )
  call <SID>X( "gitrebaseSquash", [s:dark_red, s:light_violet], [], "" )
  call <SID>X( "gitrebaseFixup", [s:dark_red, s:light_violet], [], "" )
  call <SID>X( "gitrebaseExec", [s:dark_red, s:light_violet], [], "" )
  call <SID>X( "gitrebaseDrop", [s:dark_red, s:light_violet], [], "" )

  "" JS Highlighting
  call <SID>X( "jsNull", [s:dark_blue, s:light_fg], [], "" )
  call <SID>X( "jsUndefined", [s:dark_blue, s:light_fg], [], "" )
  call <SID>X( "jsNumber", [s:dark_blue, s:light_fg], [], "" )
  call <SID>X( "jsFloat", [s:dark_blue, s:light_fg], [], "" )

  call <SID>X( "jsParen", [s:dark_yellow, s:light_fg], [], "" )
  call <SID>X( "jsParens", [s:dark_yellow, s:light_fg], [], "" )
  call <SID>X( "jsBraces", [s:dark_yellow, s:light_fg], [], "" )
  call <SID>X( "jsBrackets", [s:dark_yellow, s:light_fg], [], "" )
  call <SID>X( "jsOperator", [s:dark_orange, s:light_fg], [], "" )
  call <SID>X( "jsGlobalObjects", [s:dark_fg, s:light_fg], [], "" )
  call <SID>X( "jsBuiltins", [s:dark_magenta, s:light_fg], [], "" )

  call <SID>X( "jsNoise", [s:dark_yellow, s:light_fg], [], "" )
  call <SID>X( "jsDotNotation", [s:dark_yellow, s:light_fg], [], "" )
  call <SID>X( "jsObjectKey", [s:dark_light_blue, s:light_fg], [], "" )

  call <SID>X( "jsStatic", [s:dark_red, s:light_fg], [], "" )
  call <SID>X( "jsFunction", [s:dark_red, s:light_fg], [], "" )
  call <SID>X( "jsFuncName", [s:dark_red, s:light_fg], [], "" )
  call <SID>X( "jsFuncCall", [s:dark_red, s:light_fg], [], "" )
  call <SID>X( "jsFuncArgs", [s:dark_yellow, s:light_fg], [], "" )
  call <SID>X( "jsFunctionKey", [s:dark_red, s:light_fg], [], "" )
  call <SID>X( "jsFuncParens", [s:dark_yellow, s:light_fg], [], "" )
  call <SID>X( "jsFuncBraces", [s:dark_red, s:light_fg], [], "" )
  call <SID>X( "jsArrowFunction", [s:dark_red, s:light_fg], [], "" )
  call <SID>X( "jsExceptions", [s:dark_red, s:light_fg], [], "underline" )

  call <SID>X( "jsStorageClass", [s:dark_orange, s:light_fg], [], "" )
  call <SID>X( "jsBooleanTrue", [s:dark_orange, s:light_fg], [], "" )
  call <SID>X( "jsBooleanFalse", [s:dark_orange, s:light_fg], [], "" )

  call <SID>X( "jsDecorator", [s:dark_red, s:light_fg], [], "" )
  call <SID>X( "jsDecoratorFunction", [s:dark_red, s:light_fg], [], "" )
  call <SID>X( "jsClass", [s:dark_orange, s:light_fg], [], "underline" )
  call <SID>X( "jsPrototype", [s:dark_orange, s:light_fg], [], "underline" )
  call <SID>X( "jsSuper", [s:dark_pink, s:light_fg], [], "" )
  call <SID>X( "jsThis", [s:dark_pink, s:light_fg], [], "" )

  call <SID>X( "jsTemplateVar", [s:dark_yellow, s:light_fg], [], "" )
  call <SID>X( "jsHtmlElemAttrs", [s:dark_fg, s:light_fg], [], "" )
  call <SID>X( "jsHtmlEvents", [s:dark_yellow, s:light_fg], [], "" )

  call <SID>X( "jsDocTags", [s:dark_orange, s:light_fg], [], "" )
  call <SID>X( "jsDocType", [s:dark_orange, s:light_fg], [], "" )
  call <SID>X( "jsDocTypeNoParam", [s:dark_orange, s:light_fg], [], "" )
  call <SID>X( "jsDocParam", [s:dark_grey_comment, s:light_fg], [], "" )

  "" JSON Highlighting
  call <SID>X( "jsonBraces", [s:dark_yellow, s:light_fg], [], "" )
  call <SID>X( "jsonQuote", [s:dark_yellow, s:light_fg], [], "" )
  call <SID>X( "jsonNumber", [s:dark_blue, s:light_fg], [], "" )
  call <SID>X( "jsonNoise", [s:dark_yellow, s:light_fg], [], "" )
  call <SID>X( "jsonKeyword", [s:dark_orange, s:light_fg], [], "" )
  call <SID>X( "jsonKeywordMatch", [s:dark_yellow, s:light_fg], [], "" )

  "" GO Highlighting
  "call <SID>X( "goDirective", [s:dark_blue, s:light_fg], [], "" )
  call <SID>X( "goDeclaration", [s:dark_red, s:light_fg], [], "" )

  call <SID>X( "goType", [s:dark_red, s:light_fg], [], "" )
  call <SID>X( "goSignedInts", [s:dark_red, s:light_fg], [], "" )
  call <SID>X( "goUnsignedInts", [s:dark_red, s:light_fg], [], "" )
  call <SID>X( "goComplexes", [s:dark_red, s:light_fg], [], "" )
  call <SID>X( "goDecimalInt", [s:dark_blue, s:light_fg], [], "" )
  call <SID>X( "goFloats", [s:dark_red, s:light_fg], [], "" )
  call <SID>X( "goImaginary", [s:dark_light_blue, s:light_fg], [], "" )

  call <SID>X( "goFormatSpecifier", [s:dark_orange, s:light_fg], [], "" )
  " call <SID>X( "goEscapeC", [s:dark_light_blue, s:light_fg], [], "" )

  "" JavaScript Highlighting
  call <SID>X( "javaScriptAsync", [s:dark_violet, s:light_fg], [], "" )

  call <SID>X( "javaScriptFunction", [s:dark_yellow, s:light_fg], [], "" )
  call <SID>X( "javaScriptParens", [s:dark_yellow, s:light_white], [], "" )
  call <SID>X( "javaScriptBraces", [s:dark_yellow, s:light_white], [], "" )
  call <SID>X( "javaScriptEndColons", [s:dark_yellow, s:light_white], [], "" )

  call <SID>X( "javaScriptDocTags", [s:dark_grey_comment, s:light_white], [], "" )
  call <SID>X( "javaScriptDocParam", [s:dark_grey_comment, s:light_white], [], "" )
  call <SID>X( "javaScriptFuncKeyword", [s:dark_cyan, s:light_white], [], "" )
  call <SID>X( "javaScriptFuncDef", [s:dark_pink, s:light_white], [], "" )
  call <SID>X( "javaScriptFuncArg", [s:dark_pink, s:light_white], [], "" )
  call <SID>X( "javaScriptEventListenerKeywords", [s:dark_fg, s:light_white], [], "" )
  call <SID>X( "javaScriptOpSymbols", [s:dark_fg, s:light_white], [], "" )
  call <SID>X( "javaScriptHtmlElemProperties", [s:dark_fg, s:light_white], [], "" )

  call <SID>X( "javaScriptMessage", [s:dark_fg, s:light_white], [], "" )
  call <SID>X( "javaScriptStatement", [s:dark_orange, s:light_white], [], "" )
  call <SID>X( "javaScriptNumber", [s:dark_blue, s:light_white], [], "" )
  call <SID>X( "javaScriptFloat", [s:dark_blue, s:light_white], [], "" )
  call <SID>X( "javaScriptNull", [s:dark_blue, s:light_fg], [], "" )

  call <SID>X( "javaScriptGlobalObjects", [s:dark_cyan, s:light_fg], [s:dark_bg, s:light_bg], "underline" )
  call <SID>X( "javaScriptPrototype", [s:dark_red, s:light_fg], [s:dark_bg, s:light_bg], "" )
  call <SID>X( "javaScriptExceptions", [s:dark_red, s:light_fg], [s:dark_bg, s:light_bg], "" )

  call <SID>X( "javaScriptType", [s:dark_orange, s:light_fg], [], "" )
  call <SID>X( "javaScriptBoolean", [s:dark_orange, s:light_fg], [], "" )
  call <SID>X( "javaScriptAjaxMethods", [s:dark_fg, s:light_fg], [], "" )

  call <SID>X( "javaScriptHtmlEvents", [s:dark_yellow, s:light_violet], [], "" )
  call <SID>X( "javaScriptTemplateVar", [s:dark_yellow, s:light_white], [], "" )
  call <SID>X( "javaScriptTemplateDelim", [s:dark_orange, s:light_white], [], "" )
  call <SID>X( "javaScriptTemplateString", [s:dark_green, s:light_white], [], "" )
  call <SID>X( "javaScriptDotAccess", [s:dark_fg, s:light_white], [], "" )

  call <SID>X( "javaScriptWebAPI", [s:dark_fg, s:light_white], [], "" )

  "call <SID>X( "javaScriptIdentifier", [s:dark_darkerfg, s:light_fg], [], "" )
  "call <SID>X( "javaScriptLabel", [s:dark_pink, s:light_purple], [], "" )
  "call <SID>X( "javaScriptMember", [s:dark_darkerfg, s:light_purple], [], "" )
  "call <SID>X( "javaScriptGlobal", [s:dark_darkerfg, s:light_orange], [], "" )
  "call <SID>X( "javaScriptReserver", [s:dark_blue, s:light_blue], [], "" )

  "" CoffeeScript Highlighting
  call <SID>X( "coffeeObject", [s:dark_red, s:light_black], [s:dark_bg, s:light_bg], "underline" )
  call <SID>X( "coffeeParen", [s:dark_yellow, s:light_fg], [s:dark_bg, s:light_bg], "" )
  call <SID>X( "coffeeNumber", [s:dark_blue, s:light_fg], [s:dark_bg, s:light_bg], "" )
  call <SID>X( "coffeeFloat", [s:dark_blue, s:light_fg], [s:dark_bg, s:light_bg], "" )
  call <SID>X( "coffeeBracket", [s:dark_yellow, s:light_fg], [s:dark_bg, s:light_bg], "" )
  call <SID>X( "coffeeCurly", [s:dark_yellow, s:light_blue], [s:dark_bg, s:light_bg], "" )
  call <SID>X( "coffeeSpecialOp", [s:dark_cyan, s:light_black], [s:dark_bg, s:light_bg], "" )
  call <SID>X( "coffeeBoolean", [s:dark_yellow, s:light_green], [s:dark_bg, s:light_bg], "" )
  call <SID>X( "coffeeGlobal", [s:dark_yellow, s:light_green], [s:dark_bg, s:light_bg], "" )
  call <SID>X( "coffeeDotAccess", [s:dark_yellow, s:light_fg], [s:dark_bg, s:light_bg], "bold" )
  call <SID>X( "coffeeSpecialOp", [s:dark_yellow, s:light_fg], [s:dark_bg, s:light_bg], "bold" )
  "call <SID>X( "coffeeInterpDelim", [s:dark_yellow, s:light_fg], [s:dark_bg, s:light_bg], "" )

  "" CSS Highlighting
  call <SID>X( "cssIdentifier", [s:dark_red, s:light_blue], [], "" )
  call <SID>X( "cssImportant", [s:dark_cyan, s:light_red], [], "" )
  call <SID>X( "cssClassName", [s:dark_red, s:light_blue], [], "" )
  call <SID>X( "cssPseudoClass", [s:dark_green, s:light_green], [], "" )
  call <SID>X( "cssPseudoClassId", [s:dark_green, s:light_green], [], "" )
  call <SID>X( "cssTagName", [s:dark_yellow, s:light_blue], [], "" )

  call <SID>X( "cssStyle", [s:dark_orange, s:light_grey1], [], "" )
  call <SID>X( "cssNoise", [s:dark_grey1, s:light_grey1], [], "" )
  call <SID>X( "cssParens", [s:dark_yellow, s:light_grey1], [], "" )
  call <SID>X( "cssBraces", [s:dark_yellow, s:light_grey1], [], "" )
  call <SID>X( "cssBrackets", [s:dark_yellow, s:light_grey1], [], "" )
  call <SID>X( "cssParentSelector", [s:dark_red, s:light_grey1], [], "" )

  call <SID>X( "cssBoxProp", [s:dark_orange, s:light_black], [], "" )
  call <SID>X( "cssFontProp", [s:dark_orange, s:light_black], [], "" )
  call <SID>X( "cssTextProp", [s:dark_orange, s:light_black], [], "" )
  call <SID>X( "cssColorProp", [s:dark_orange, s:light_black], [], "" )
  call <SID>X( "cssVisualProp", [s:dark_orange, s:light_black], [], "" )
  call <SID>X( "cssBorderProp", [s:dark_orange, s:light_black], [], "" )
  call <SID>X( "cssAdvancedProp", [s:dark_orange, s:light_black], [], "" )
  call <SID>X( "cssBackgroundProp", [s:dark_orange, s:light_black], [], "" )
  call <SID>X( "cssListProp", [s:dark_orange, s:light_black], [], "" )
  call <SID>X( "cssCommonProp", [s:dark_orange, s:light_black], [], "" )
  call <SID>X( "cssRenderProp", [s:dark_orange, s:light_black], [], "" )
  call <SID>X( "cssUIProp", [s:dark_orange, s:light_black], [], "" )
  call <SID>X( "cssGeneratedContentProp", [s:dark_orange, s:light_black], [], "" )

  call <SID>X( "cssBoxVal", [s:dark_grey1, s:light_grey1], [], "" )
  call <SID>X( "cssFontVal", [s:dark_grey1, s:light_grey1], [], "" )
  call <SID>X( "cssTextVal", [s:dark_grey1, s:light_grey1], [], "" )
  call <SID>X( "cssColorVal", [s:dark_grey1, s:light_grey1], [], "" )
  call <SID>X( "cssVisualVal", [s:dark_grey1, s:light_grey1], [], "" )
  call <SID>X( "cssBorderVal", [s:dark_grey1, s:light_grey1], [], "" )
  call <SID>X( "cssAdvancedVal", [s:dark_grey1, s:light_grey1], [], "" )
  call <SID>X( "cssBackgroundVal", [s:dark_grey1, s:light_grey1], [], "" )
  call <SID>X( "cssListVal", [s:dark_grey1, s:light_grey1], [], "" )
  call <SID>X( "cssCommonVal", [s:dark_grey1, s:light_grey1], [], "" )
  call <SID>X( "cssRenderVal", [s:dark_grey1, s:light_grey1], [], "" )

  call <SID>X( "cssBoxAttr", [s:dark_grey1, s:light_grey1], [], "" )
  call <SID>X( "cssFontAttr", [s:dark_grey1, s:light_grey1], [], "" )
  call <SID>X( "cssTextAttr", [s:dark_grey1, s:light_grey1], [], "" )
  call <SID>X( "cssColorAttr", [s:dark_grey1, s:light_grey1], [], "" )
  call <SID>X( "cssVisualAttr", [s:dark_grey1, s:light_grey1], [], "" )
  call <SID>X( "cssBorderAttr", [s:dark_grey1, s:light_grey1], [], "" )
  call <SID>X( "cssAdvancedAttr", [s:dark_grey1, s:light_grey1], [], "" )
  call <SID>X( "cssBackgroundAttr", [s:dark_grey1, s:light_grey1], [], "" )
  call <SID>X( "cssCommonAttr", [s:dark_grey1, s:light_grey1], [], "" )
  call <SID>X( "cssRenderAttr", [s:dark_grey1, s:light_grey1], [], "" )
  call <SID>X( "cssFontDescriptorAttr", [s:dark_grey1, s:light_grey1], [], "" )
  call <SID>X( "cssTableAttr", [s:dark_grey1, s:light_grey1], [], "" )
  call <SID>X( "cssUIAttr", [s:dark_grey1, s:light_grey1], [], "" )

  call <SID>X( "cssColor", [s:dark_grey1, s:light_grey1], [], "" )
  call <SID>X( "cssValueNumber", [s:dark_grey1, s:light_grey1], [], "" )
  call <SID>X( "cssValueTime", [s:dark_grey1, s:light_grey1], [], "" )
  call <SID>X( "cssValueLength", [s:dark_grey1, s:light_grey1], [], "" )
  call <SID>X( "cssStringQ", [s:dark_grey1, s:light_grey1], [], "" )
  call <SID>X( "cssStringQQ", [s:dark_grey1, s:light_grey1], [], "" )
  call <SID>X( "cssURL", [s:dark_grey1, s:light_grey1], [], "" )

  "" Stylus Highlighting
  call <SID>X( "stylusIdChar", [s:dark_orange, s:light_blue], [], "" )
  call <SID>X( "stylusAmpersand", [s:dark_yellow, s:light_blue], [], "" )
  call <SID>X( "stylusVariable", [s:dark_grey2, s:light_grey1], [], "" )
  call <SID>X( "stylusCssAttribute", [s:dark_grey2, s:light_grey1], [], "" )
  call <SID>X( "stylusClass", [s:dark_red, s:light_blue], [], "" )
  call <SID>X( "stylusClassChar", [s:dark_red, s:light_blue], [], "" )
  call <SID>X( "stylusProperty", [s:dark_orange, s:light_blue], [], "" )

  "" PHP Highlighting
  call <SID>X( "phpRegionDelimiter", [s:dark_blue, s:light_fg], [], "" ) " <?php
  call <SID>X( "phpIdentifier",  [s:dark_yellow, s:light_fg], [], "" )  " $
  call <SID>X( "phpVarSelector", [s:dark_yellow, s:light_fg], [], "" )
  call <SID>X( "phpSuperglobal", [s:dark_yellow, s:light_fg], [], "" )
  call <SID>X( "phpMemberHere", [s:dark_grey1, s:light_fg], [], "" )

  call <SID>X( "phpParent", [s:dark_grey1, s:light_fg], [], "" )
  call <SID>X( "phpBrace", [s:dark_orange, s:light_fg], [], "" )
  call <SID>X( "phpBraceFunc", [s:dark_grey1, s:light_fg], [], "" )
  call <SID>X( "phpBraceClass", [s:dark_blue, s:light_fg], [], "" )
  call <SID>X( "phpMemberSelector", [s:dark_grey1, s:light_fg], [], "" )
  call <SID>X( "phpOperator", [s:dark_orange, s:light_fg], [], "" )
  call <SID>X( "phpBoolean", [s:dark_orange, s:light_fg], [], "" )
  call <SID>X( "phpRelation", [s:dark_orange, s:light_fg], [], "" )  " class structure
  call <SID>X( "phpAssign", [s:dark_grey1, s:light_fg], [], "" )  " class structure
  call <SID>X( "phpSemicolon", [s:dark_grey1, s:light_fg], [], "" )
  call <SID>X( "phpControlParent", [s:dark_grey1, s:light_fg], [], "" )
  call <SID>X( "phpQuoteSingle", [s:dark_green, s:light_fg], [], "" )
  call <SID>X( "phpQuoteDouble", [s:dark_green, s:light_fg], [], "" )

  call <SID>X( "phpStatement", [s:dark_yellow, s:light_fg], [], "" )  " class structure
  call <SID>X( "phpFunctions", [s:dark_violet, s:light_fg], [], "" )  " class structure
  call <SID>X( "phpSpecialFunction", [s:dark_violet, s:light_fg], [], "" )  " class structure

  call <SID>X( "phpStructure", [s:dark_blue, s:light_fg], [], "" )  " class structure
  call <SID>X( "phpDefineClassName", [s:dark_cyan, s:light_fg], [], "" )
  call <SID>X( "phpDefineClassImplementsName", [s:dark_cyan, s:light_fg], [], "" )

  call <SID>X( "phpArrayParens", [s:dark_orange, s:light_fg], [], "" )  " class structure
  call <SID>X( "phpArrayPair", [s:dark_orange, s:light_fg], [], "" )

  call <SID>X( "phpType", [s:dark_orange, s:light_fg], [], "" )
  "call <SID>X( "phpCoreConstant", [s:dark_orange, s:light_fg], [], "" )
  "call <SID>X( "phpMagicConstant", [s:dark_orange, s:light_fg], [], "" )

  call <SID>X( "phpStorageClass2", [s:dark_orange, s:light_fg], [], "" )  " public, static
  call <SID>X( "phpDefineMethod", [s:dark_orange, s:light_fg], [], "" )  " function
  call <SID>X( "phpDefineMethodName", [s:dark_fg, s:light_fg], [], "" )
  call <SID>X( "phpDefineFuncProto", [s:dark_cyan, s:light_fg], [], "" )
  "call <SID>X( "phpDefineImplementsName", [s:dark_blue, s:light_grey1], [], "" )

  call <SID>X( "phpConditional", [s:dark_orange, s:light_grey1], [], "" )
  call <SID>X( "phpRepeat", [s:dark_orange, s:light_grey1], [], "" )
  "call <SID>X( "phpSemicolon", [s:dark_blue, s:light_grey1], [], "" )

  "" Go Highlighting
  "call <SID>X( "goDirective", [s:dark_paleblue, s:light_grey1], [], "" )
  "call <SID>X( "goGoroutine", [s:dark_red, s:light_lightred], [], "" )
  "call <SID>X( "goFunction", [s:dark_fg, s:light_fg], [], "" )
  "call <SID>X( "goConditionalOperator", [s:dark_pink, s:light_purple], [], "" )

  "" Markdown Highlighting
  "call <SID>X( "markdownListMarker", [s:dark_cyan, s:light_cyan], [], "" )
  "call <SID>X( "markdownCode", [s:dark_paleblue, s:light_grey2], [], "" )
  "call <SID>X( "markdownBold", [s:dark_darkerfg, s:light_grey1], [], "bold" )
  "call <SID>X( "markdownBlockquote", [s:dark_darkerfg, s:light_grey1], [], "" )
  call <SID>X( "markdownLinkText", [s:dark_green, s:light_grey1], [], "" )
  call <SID>X( "markdownHeadingDelimiter", [s:dark_red, s:light_grey1], [], "" )

  " delete functions
  delf <SID>X
  delf <SID>rgb
  delf <SID>color
  delf <SID>rgb_color
  delf <SID>rgb_level
  delf <SID>rgb_number
  delf <SID>grey_color
  delf <SID>grey_level
  delf <SID>grey_number
else
    " color terminal definitions
endif

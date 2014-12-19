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
let s:dark_fg              = "d7d7d7"
let s:dark_bg              = "292929"
let s:dark_red             = "df4320"  " f22c40
let s:dark_blue            = "3f7ac4"  " 407ee7 a bit lighter blue / 4271ae default
let s:dark_cyan            = "45abb1"  " 3e999f / 00ad9c / 159393
let s:dark_orange          = "ff7302"
let s:dark_green           = "4bbf23"
let s:dark_yellow          = "c3b622"
let s:dark_gold            = "c3a922"
let s:dark_violet          = "6666ea"
let s:dark_grey            = "545454"  " 68615e
let s:dark_grey1           = "848484"
let s:dark_grey2           = "9c9491"
let s:dark_grey3           = "a8a19f"  " 888a85
let s:dark_black           = "000000"
let s:dark_unknown         = "bc27f2"  " magenta

" light-bg colors
let s:light_fg              = "65658b"
let s:light_bg              = "000116"
let s:light_red             = "ff0000"
let s:light_blue            = "4271ae"
let s:light_cyan            = "3e999f"
let s:light_orange          = "ff7302"
let s:light_green           = "4bbf23"
let s:light_grey            = "62645f"
let s:light_grey1           = "262626"
let s:light_grey2           = "7f7f7f"
let s:light_grey3           = "888a85"
let s:light_black           = "000000"
let s:light_unknown         = "f856f9"

let s:curr_bg = "dark" "&bg

let g:colors_name="averted"

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

    call <SID>X( "Cursor", [], [s:dark_cyan, s:light_red], "")  " the character under the cursor

    call <SID>X( "NonText", [s:dark_orange, s:light_orange], [], "none")  " '~' and '@' at the end of the window 
    call <SID>X( "SpecialKey", [s:dark_grey3, s:light_grey3], [s:dark_black, s:light_black], "none")  " Meta and special keys listed with ':map', also for text used to show unprintable characters in the text, 'listchars'. Generally: text that is displayed differently from what it really is.

    call <SID>X( "Search", [s:dark_bg, s:light_bg],  [s:dark_orange, s:light_orange], "")  " Last search pattern highlighting (see 'hlsearch'). Also used for highlighting the current line in the quickfix window and similar items that need to stand out.
    call <SID>X( "IncSearch", [s:dark_orange, s:light_orange], [s:dark_bg, s:light_bg], "")  " 'incsearch' highlighting; also used for the text replaced with ':s///c'

    call <SID>X( "StatusLine", [s:dark_orange, s:light_orange], [s:dark_black, s:light_black], "none" )  " status line of current window
    call <SID>X( "StatusLineNC", [s:dark_orange, s:light_orange], [s:dark_black, s:light_black], "reverse" )  " status lines of not-current windows
    "call <SID>X( "StatusLineErr", [s:dark_red, s:light_lightred], [s:dark_lighterbg1, s:light_grey4], "" )  " custom
    "call <SID>X( "StatusLineBold", [s:dark_blue, s:light_blue], [s:dark_lighterbg1, s:light_grey4], "bold" )  " custom

    call <SID>X( "VertSplit", [s:dark_unknown, s:light_unknown],  [s:dark_cyan, s:light_cyan], "inverse" )  " the column separating vertically split windows

    call <SID>X( "Visual", [s:dark_black, s:light_black], [s:dark_orange, s:light_orange], "")  " visual mode selection
    call <SID>X( "MatchParen", [s:dark_black, s:light_black], [s:dark_orange, s:light_orange], "")  " The character under the cursor or just before it, if it is a paired bracket, and its match.

    call <SID>X( "Directory", [s:dark_blue, s:light_blue], [], "" )  " directory names (and other special names in listings

    call <SID>X( "Folded", [s:dark_orange, s:light_orange], [s:dark_black, s:light_black], "")  " line used for closed folds
    call <SID>X( "FoldColumn", [s:dark_unknown, s:light_unknown], [], "")  " see 'foldcolumn'

    call <SID>X( "WarningMsg", [s:dark_orange, s:light_orange], [], "" ) " warning messages
    call <SID>X( "ErrorMsg", [s:dark_black, s:light_black], [s:dark_orange, s:light_orange], "")  " error messages on the command line

    call <SID>X( "ModeMsg", [s:dark_orange, s:light_orange], [], "none")  " 'showmode' message (e.g., '-- INSERT --')
    call <SID>X( "MoreMsg", [s:dark_orange, s:light_orange], [], "")  " more-prompt
    call <SID>X( "Question", [s:dark_unknown, s:light_unknown],  [], "")  " hit-enter prompt and yes/no questions

    call <SID>X( "WildMenu", [s:dark_red, s:light_red], [s:dark_bg, s:light_bg], "" )  " current match in 'wildmenu' completion

    call <SID>X( "SignColumn", [], [s:dark_red, s:light_red], "" )  " column where signs are displayed

    call <SID>X( "Linenr", [s:dark_orange, s:light_orange], [], "" )  " line number for ':number' and ':#' commands, and when 'number' or 'relativenumber' option is set.

    "call <SID>X( "DiffAdd", [s:dark_bg, s:light_bg], [s:dark_cyan, s:light_green], "")  " diff mode: Added line
    "call <SID>X( "DiffDelete", [s:dark_bg, s:light_bg], [s:dark_red, s:light_lightred], "" )  " diff mode: Deleted line
    "call <SID>X( "DiffChange", [s:dark_bg, s:light_bg], [s:dark_paleblue, s:light_gold], "" )  " diff mode: Changed line
    "call <SID>X( "DiffText", [s:dark_bg, s:light_bg], [s:dark_red, s:light_lightred], "none" )  " diff mode: Changed text within a changed line

    if version >= 700

    "call <SID>X( "CursorLineNr", [s:dark_cyan, s:light_cyan], [], "none" )  " like LineNr when 'cursorline' is set for the cursor line.
    "call <SID>X( "CursorLine", [], [s:dark_bg, s:light_bg], "none" )  " the screen line that the cursor is in when 'cursorline' is set
    "call <SID>X( "CursorColumn", [], [s:dark_bg, s:light_bg], "" )  " the screen column that the cursor is in when 'cursorcolumn' is set

    "call <SID>X( "PMenu", [s:dark_blue, s:light_blue], [s:dark_lightblue, s:light_lightblue], "none" )  " popup menu: normal item
    "call <SID>X( "PMenuSel", [s:dark_lightblue, s:light_lightblue], [s:dark_blue, s:light_blue], "none" )  " popup menu: selected item
    "call <SID>X( "PMenuSBar", [s:dark_grey, s:light_grey1], [s:dark_grey, s:light_grey1], "none" )  " popup menu: scrollbar
    "call <SID>X( "PMenuThumb", [s:dark_grey, s:light_grey1], [s:dark_lightgrey, s:light_grey2], "none" )  " popup menu: Thumb of the scrollbar

    "call <SID>X( "TabLine", [s:dark_fg, s:light_grey1], [s:dark_lighterbg2, s:light_grey4], "none" )  " tab pages line, not active tab page label
    "call <SID>X( "TabLineSel", [s:dark_bg, s:light_bg], [s:dark_lightblue, s:light_lightblue], "none" )  " tab pages line, active tab page label
    "call <SID>X( "TabLineFill", [s:dark_lightgrey, s:light_grey2], [s:dark_lighterbg2, s:light_grey4], "none" )  " tab pages line, where there are no labels

    endif

    if version >= 703

    "call <SID>X( "ColorColumn", [], [s:dark_lighterbg1, s:light_grey4], "" )  " used for the columns set with 'colorcolumn'

    "call <SID>X( "Conceal", [s:dark_lighterbg2, s:light_grey2], [s:dark_bg, s:light_bg], "" )  " placeholder characters substituted for concealed text (see 'conceallevel')

    " TODO
    "call <SID>X( "SpellBad", [], [], "undercurl" )  " word that is not recognized by the spellchecker. This will be combined with the highlighting used otherwise
    "call <SID>X( "SpellCap", [], [], "" )  " word that should start with a capital. This will be combined with the highlighting used otherwise
    "call <SID>X( "SpellLocal", [], [], "" )  " word that is recognized by the spellchecker as one that is used in another region. This will be combined with the highlighting used otherwise
    "call <SID>X( "SpellRare", [], [], "" )  " word that is recognized by the spellchecker as one that is hardly ever used. This will be combined with the highlighting used otherwise
    end

    " Standard Language Highlighting
    call <SID>X( "Constant", [s:dark_fg, s:light_fg], [], "" )  " any constant
    call <SID>X( "String", [s:dark_green, s:light_green], [], "" )   " a string constant: 'this is a string'
    "call <SID>X( "Character", [s:dark_plum, s:light_green], [], "" )  " a character constant: 'c', '\n'
    "call <SID>X( "Number", [s:dark_grey, s:light_grey1], [], "" )  " a number constant: 234, 0xff
    "call <SID>X( "Boolean", [s:dark_grey, s:light_green], [], "" )  " a boolean constant: TRUE, false
    "call <SID>X( "Float", [s:dark_grey, s:light_grey1], [], "" )  " a floating point constant: 2.3e10
    call <SID>X( "Identifier", [s:dark_orange, s:light_orange], [], "none" )  " any variable name
    call <SID>X( "Identifiero", [s:dark_unknown, s:light_unknown], [], "none")
    "call <SID>X( "Function", [s:dark_blue, s:light_blue], [], "" )  " function name (also: methods for classes)
    call <SID>X( "Statement",  [s:dark_orange, s:light_orange], [], "none" )  " any statement
    "call <SID>X( "Conditional",[s:dark_pink, s:light_blue], [], "" )  " if, then, else, endif, switch, etc
    "call <SID>X( "Label", [s:dark_pink, s:light_purple], [], "" )  "  case, default, etc.
    "call <SID>X( "Repeat", [s:dark_orange, s:light_orange], [], "" )  " for, do, while, etc.
    call <SID>X( "Comment", [s:dark_grey, s:light_grey], [], "")  " any comment
    "call <SID>X( "Operator", [s:dark_cyan, s:light_cyan], [], "none" )  " 'sizeof', '+', '*', etc.
    "call <SID>X( "Keyword", [s:dark_fg, s:light_fg], [], "" )  " any other keyword
    "call <SID>X( "Exception", [s:dark_red, s:light_lightred], [], "" )  " try, catch, throw
    call <SID>X( "PreProc", [s:dark_orange, s:light_orange], [], "" )  " generic Preprocessor
    "call <SID>X( "Include", [s:dark_darkerfg, s:light_grey1], [], "" )  " preprocessor #include
    "call <SID>X( "Define", [s:dark_pink, s:light_purple], [], "none" )  " preprocessor #define
    "call <SID>X( "Macro", [s:dark_pink, s:light_purple], [], "none" )  " preprocessor #define
    "call <SID>X( "PreCondit", [s:dark_pink, s:light_purple], [], "")  " preprocessor #if, #else, #endif, etc
    call <SID>X( "Type", [s:dark_unknown, s:light_unknown], [], "none" )  " int, long, char, etc.
    "call <SID>X( "StorageClass", [s:dark_cyan, s:light_cyan], [], "" )  " static, register, volatile, etc.
    "call <SID>X( "Structure", [s:dark_cyan, s:light_cyan], [], "" )  " struct, union, enum, etc.
    "call <SID>X( "Typedef", [s:dark_darkerfg, s:light_grey1], [], "" )  " a typedef
    call <SID>X( "Special", [s:dark_unknown, s:light_unknown], [], "")  " any special symbol
    call <SID>X( "Underlined", [s:dark_unknown, s:light_unknown], [], "underline" )  " text that stands out, HTML links
    call <SID>X( "Title", [s:dark_orange, s:light_orange], [s:dark_black, s:light_black], "bold" )
    call <SID>X( "Error", [], [s:dark_red, s:light_red], "none" )  " any erroneous construct
    call <SID>X( "Todo", [s:dark_black, s:light_black], [s:dark_grey, s:light_grey], "")  " anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    "" Vimrc Highlighting
    call <SID>X( "vimCommand", [s:dark_blue, s:light_blue], [], "none" )
    call <SID>X( "vimFuncName", [s:dark_cyan, s:light_cyan], [], "none" )

    "" Python Highlighting
    "call <SID>X( "pythonFunction", [s:dark_fg, s:light_fg], [], "" )
    "call <SID>X( "pythonPreCondit",  [s:dark_paleblue, s:light_orange], [], "" )
    "call <SID>X( "pythonDottedName",  [s:dark_darkerfg, s:light_grey1], [], "" )

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

    "" HTML Highlighting
    "call <SID>X( "htmlTag", [s:dark_paleblue, s:light_grey1], [], "" )
    "call <SID>X( "htmlEndTag", [s:dark_paleblue, s:light_grey1], [], "" )
    "call <SID>X( "htmlTagName", [s:dark_blue, s:light_blue], [], "" )
    "call <SID>X( "htmlArg", [s:dark_paleblue, s:light_cyan],[], "" )
    "call <SID>X( "htmlScriptTag", [s:dark_paleblue, s:light_grey1], [], "" )

    "" JavaScript Highlighting
    "call <SID>X( "javaScriptBraces", [s:dark_darkerfg, s:light_grey1], [], "" )
    "call <SID>X( "javaScriptIdentifier", [s:dark_darkerfg, s:light_fg], [], "" )
    "call <SID>X( "javaScriptLabel", [s:dark_pink, s:light_purple], [], "" )
    "call <SID>X( "javaScriptMember", [s:dark_darkerfg, s:light_purple], [], "" )
    "call <SID>X( "javaScriptGlobal", [s:dark_darkerfg, s:light_orange], [], "" )
    "call <SID>X( "javaScriptReserver", [s:dark_blue, s:light_blue], [], "" )
    "call <SID>X( "javaScriptNull", [s:dark_grey, s:light_cyan], [], "" )
    call <SID>X( "javaScriptType", [s:dark_orange, s:light_fg], [], "" )
    call <SID>X( "javaScriptBoolean", [s:dark_orange, s:light_fg], [], "" )
    "call <SID>X( "javaScriptNumber", [s:dark_grey, s:light_cyan], [], "" )

    "" CSS Highlighting
    call <SID>X( "cssIdentifier", [s:dark_blue, s:light_grey1], [], "" )
    call <SID>X( "cssImportant", [s:dark_cyan, s:light_grey1], [], "" )
    call <SID>X( "cssClassName", [s:dark_blue, s:light_grey1], [], "" )
    call <SID>X( "cssPseudoClass", [s:dark_green, s:light_grey1], [], "" )
    call <SID>X( "cssPseudoClassId", [s:dark_green, s:light_grey1], [], "" )
    call <SID>X( "cssBraces", [s:dark_orange, s:light_grey1], [], "" )
    call <SID>X( "cssTagName", [s:dark_yellow, s:light_grey1], [], "" )

    call <SID>X( "stylusAmpersand", [s:dark_yellow, s:light_grey1], [], "" )
    call <SID>X( "stylusVariable", [s:dark_grey1, s:light_red], [], "" )
    call <SID>X( "stylusCssAttribute", [s:dark_grey1, s:light_red], [], "" )
    call <SID>X( "stylusClass", [s:dark_blue, s:light_grey1], [], "" )
    call <SID>X( "stylusClassChar", [s:dark_blue, s:light_grey1], [], "" )
    call <SID>X( "stylusProperty", [s:dark_orange, s:light_grey1], [], "" )

    call <SID>X( "cssBoxProp", [s:dark_orange, s:light_grey1], [], "" )
    call <SID>X( "cssFontProp", [s:dark_orange, s:light_grey1], [], "" )
    call <SID>X( "cssTextProp", [s:dark_orange, s:light_grey1], [], "" )
    call <SID>X( "cssColorProp", [s:dark_orange, s:light_grey1], [], "" )
    call <SID>X( "cssVisualProp", [s:dark_orange, s:light_grey1], [], "" )
    call <SID>X( "cssBorderProp", [s:dark_orange, s:light_grey1], [], "" )
    call <SID>X( "cssAdvancedProp", [s:dark_orange, s:light_grey1], [], "" )
    call <SID>X( "cssBackgroundProp", [s:dark_orange, s:light_grey1], [], "" )
    call <SID>X( "cssListProp", [s:dark_orange, s:light_grey1], [], "" )
    call <SID>X( "cssCommonProp", [s:dark_orange, s:light_grey1], [], "" )
    call <SID>X( "cssRenderProp", [s:dark_orange, s:light_grey1], [], "" )
    call <SID>X( "cssUIProp", [s:dark_orange, s:light_grey1], [], "" )
    call <SID>X( "cssGeneratedContentProp", [s:dark_orange, s:light_grey1], [], "" )

    call <SID>X( "cssBoxVal", [s:dark_grey1, s:light_red], [], "" )
    call <SID>X( "cssFontVal", [s:dark_grey1, s:light_red], [], "" )
    call <SID>X( "cssTextVal", [s:dark_grey1, s:light_red], [], "" )
    call <SID>X( "cssColorVal", [s:dark_grey1, s:light_red], [], "" )
    call <SID>X( "cssVisualVal", [s:dark_grey1, s:light_red], [], "" )
    call <SID>X( "cssBorderVal", [s:dark_grey1, s:light_red], [], "" )
    call <SID>X( "cssAdvancedVal", [s:dark_grey1, s:light_red], [], "" )
    call <SID>X( "cssBackgroundVal", [s:dark_grey1, s:light_red], [], "" )
    call <SID>X( "cssListVal", [s:dark_grey1, s:light_red], [], "" )
    call <SID>X( "cssCommonVal", [s:dark_grey1, s:light_red], [], "" )
    call <SID>X( "cssRenderVal", [s:dark_grey1, s:light_red], [], "" )

    call <SID>X( "cssBoxAttr", [s:dark_grey1, s:light_red], [], "" )
    call <SID>X( "cssFontAttr", [s:dark_grey1, s:light_red], [], "" )
    call <SID>X( "cssTextAttr", [s:dark_grey1, s:light_red], [], "" )
    call <SID>X( "cssColorAttr", [s:dark_grey1, s:light_red], [], "" )
    call <SID>X( "cssVisualAttr", [s:dark_grey1, s:light_red], [], "" )
    call <SID>X( "cssBorderAttr", [s:dark_grey1, s:light_red], [], "" )
    call <SID>X( "cssAdvancedAttr", [s:dark_grey1, s:light_red], [], "" )
    call <SID>X( "cssBackgroundAttr", [s:dark_grey1, s:light_red], [], "" )
    call <SID>X( "cssCommonAttr", [s:dark_grey1, s:light_red], [], "" )
    call <SID>X( "cssRenderAttr", [s:dark_grey1, s:light_red], [], "" )
    call <SID>X( "cssFontDescriptorAttr", [s:dark_grey1, s:light_red], [], "" )
    call <SID>X( "cssTableAttr", [s:dark_grey1, s:light_red], [], "" )
    call <SID>X( "cssUIAttr", [s:dark_grey1, s:light_red], [], "" )
    
    call <SID>X( "cssColor", [s:dark_grey1, s:light_red], [], "" )
    call <SID>X( "cssValueNumber", [s:dark_grey1, s:light_red], [], "" )
    call <SID>X( "cssValueTime", [s:dark_grey1, s:light_red], [], "" )
    call <SID>X( "cssValueLength", [s:dark_grey1, s:light_red], [], "" )
    call <SID>X( "cssStringQ", [s:dark_grey1, s:light_red], [], "" )
    call <SID>X( "cssStringQQ", [s:dark_grey1, s:light_red], [], "" )
    call <SID>X( "cssURL", [s:dark_grey1, s:light_red], [], "" )

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
    "call <SID>X( "phpMagicConstant", [s:dark_orange, s:light_fg], [], "" )
    "call <SID>X( "phpCoreConstant", [s:dark_orange, s:light_fg], [], "" )
    
    call <SID>X( "phpStorageClass2", [s:dark_orange, s:light_fg], [], "" )  " public, static
    call <SID>X( "phpDefineMethod", [s:dark_orange, s:light_fg], [], "" )  " function
    call <SID>X( "phpDefineMethodName", [s:dark_fg, s:light_fg], [], "" )
    call <SID>X( "phpDefineFuncProto", [s:dark_cyan, s:light_fg], [], "" )

    call <SID>X( "phpConditional", [s:dark_orange, s:light_grey1], [], "" )
    call <SID>X( "phpRepeat", [s:dark_orange, s:light_grey1], [], "" )
    "call <SID>X( "phpSemicolon", [s:dark_blue, s:light_grey1], [], "" )
    "call <SID>X( "phpSemicolon", [s:dark_blue, s:light_grey1], [], "" )
    "call <SID>X( "phpDefineImplementsName", [s:dark_blue, s:light_grey1], [], "" )

    "call <SID>X( "phpSemicolon", [s:dark_blue, s:light_grey1], [], "" )
    "call <SID>X( "phpSemicolon", [s:dark_blue, s:light_grey1], [], "" )
    "call <SID>X( "phpSemicolon", [s:dark_blue, s:light_grey1], [], "" )
    "call <SID>X( "phpSemicolon", [s:dark_blue, s:light_grey1], [], "" )
    "call <SID>X( "phpSemicolon", [s:dark_blue, s:light_grey1], [], "" )
    
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

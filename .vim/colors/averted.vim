" ============================================================================
" File: averted.vim
" Description: averted colorscheme.
" Mantainer: https://github.com/averted
" Url: https://github.com/averted/vim/colors/averted.vim
" License: MIT
" Version: 0.1
" Last Changed: 24 Nov 2013
" ============================================================================

"
" Init colors
"
let s:dark_fg               = [253, "#dfdfdf"]
let s:dark_bg               = [235, "#303030"]
let s:dark_bg_other         = [236, '#303030']
let s:dark_red              = [161, "#e2366d"] " f22c40 bright red
let s:dark_red_bright       = [160, "#d70000"]
let s:dark_pink             = [206, "#f66fd6"]
let s:dark_blue             = [32, "#407ee7"]  " 407ee7 a bit lighter blue / 4271ae default
let s:dark_blue_other       = [39, '#00afff']
let s:dark_cyan             = [37, "#00aea3"] " 00c7b4 (new color) / 00c7c5 / 3e999f / 00ad9c / 159393
let s:dark_light_blue       = [38, "#00b3c8"]
let s:dark_light_blue_other = [45, '#00d7ff']
let s:dark_orange           = [208, "#ff9000"]  " ff9000 - orange (dark)
let s:dark_orange_other     = [208, '#ff9000']
let s:dark_green            = [70, "#4bbf23"]  " 4bbf23 | 53d527
let s:dark_yellow           = [178, "#c3b622"]
let s:dark_yellow_other     = [178, '#ffd700']
let s:dark_gold             = [178, "#c3a922"]
let s:dark_violet           = [63, "#5353fe"]
let s:dark_magenta          = [163, "#d90da9"]
let s:dark_grey             = [244, '#808080']
let s:dark_grey_comment     = [243, "#808080"] " 68615e
let s:dark_grey0            = [243, "#848484"]
let s:dark_grey1            = [245, "#919191"]
let s:dark_grey2            = [246, "#9e9e9e"]
let s:dark_grey3            = [247, "#aaaaaa"]
let s:dark_grey4            = [249, "#b7b7b7"]
let s:dark_grey5            = [250, "#c4c4c4"]
let s:dark_black            = [233, "#1f1f1f"]
let s:dark_unknown          = [129, "#bc27f2"] " magenta
let s:dark_airline_fg       = [248, "#b2b2b2"]
let s:dark_airline_bg       = [235, "#303030"]

let s:curr_bg = "dark"
let g:colors_name = "averted"

"
" Functions
"
fun <SID>HI(group, fg, bg, attr)
  if !empty(a:fg)
    exec "hi " . a:group . " ctermfg=" . a:fg[0] . " guifg=" . a:fg[1]
  endif

  if !empty(a:bg)
    exec "hi " . a:group . " ctermbg=" . a:bg[0] . " guibg=" . a:bg[1]
  endif

  if a:attr != ""
    exec "hi " . a:group . " cterm=" . a:attr . " gui=" . a:attr
  endif
endfun

"
" Popup menu
"
call <SID>HI("PMenu", s:dark_black, s:dark_grey1, "none" )  " popup menu: normal item
call <SID>HI("PMenuSel", s:dark_black, s:dark_orange, "none" )  " popup menu: selected item
call <SID>HI("PMenuSBar", s:dark_grey0, s:dark_grey0, "none" )  " popup menu: scrollbar
call <SID>HI("PMenuThumb", s:dark_grey0, s:dark_grey3, "none" )  " popup menu: Thumb of the scrollbar

"
" Status Line
"
call <SID>HI("StatusLine", s:dark_bg_other, s:dark_orange_other, "")  " status line of current window
call <SID>HI("StatusLineNC", s:dark_bg_other, s:dark_grey, "")  " status lines of not-current windows
"call <SID>HI("StatusLine", s:dark_orange, s:dark_airline_bg, "none" )  " status line of current window
"call <SID>HI("StatusLineNC", s:dark_airline_bg, s:dark_grey_comment, "" )  " status lines of not-current windows
"call <SID>HI("StatusLineErr", s:dark_red, s:dark_lighterbg1, "" )  " custom
"call <SID>HI("StatusLineBold", s:dark_blue, s:dark_lighterbg1, "bold" )  " custom

"
" Regular
"
call <SID>HI("Normal", s:dark_fg, s:dark_bg, "")  " normal text
call <SID>HI("Cursor", s:dark_red, s:dark_cyan, "")  " the character under the cursor
call <SID>HI("NonText", s:dark_orange, [], "none")  " '~' and '@' at the end of the window
call <SID>HI("SpecialKey", s:dark_grey3, s:dark_black, "none")  " Meta and special keys listed with ':map'
call <SID>HI("Search", s:dark_bg,  s:dark_orange, "")  " Last search pattern highlighting (see 'hlsearch').
call <SID>HI("IncSearch", s:dark_orange, s:dark_bg, "")  " also used for the text replaced with ':s///c'
call <SID>HI("VertSplit", s:dark_black,  s:dark_orange, "")  " the column separating vertically split windows
call <SID>HI("Visual", s:dark_black, s:dark_orange, "")  " visual mode selection
call <SID>HI("VisualNOS", s:dark_red, s:dark_red, "")  " visual mode selection
call <SID>HI("MatchParen", s:dark_black, s:dark_orange, "")  " The character under the cursor or just before it
call <SID>HI("Directory", s:dark_blue_other, s:dark_bg_other, "")  " directory names (and other special names in listings
call <SID>HI("Folded", s:dark_orange, s:dark_black, "")  " line used for closed folds
call <SID>HI("FoldColumn", s:dark_orange, s:dark_bg, "")  " see 'foldcolumn'
call <SID>HI("WarningMsg", s:dark_orange, [], "" ) " warning messages
call <SID>HI("ErrorMsg", s:dark_black, s:dark_orange, "")  " error messages on the command line
call <SID>HI("ModeMsg", s:dark_orange, [], "none")  " 'showmode' message (e.g., '-- INSERT --')
call <SID>HI("MoreMsg", s:dark_orange, [], "")  " more-prompt
call <SID>HI("Question", s:dark_red,  [], "")  " hit-enter prompt and yes/no questions
call <SID>HI("WildMenu", s:dark_red, s:dark_bg, "" )  " current match in 'wildmenu' completion
call <SID>HI("SignColumn", [], s:dark_red, "" )  " column where signs are displayed
call <SID>HI("Linenr", s:dark_orange, [], "" )  " line number for ':number' and ':#' commands
call <SID>HI("DiffAdd", s:dark_bg, s:dark_green, "")  " diff mode: Added line
call <SID>HI("DiffDelete", s:dark_bg, s:dark_red, "" )  " diff mode: Deleted line
call <SID>HI("DiffChange", s:dark_bg, s:dark_blue, "" )  " diff mode: Changed line
call <SID>HI("DiffText", s:dark_bg, s:dark_orange, "" )  " diff mode: Changed text within a changed line
call <SID>HI("ColorColumn", [], s:dark_grey0, "" )  " used for the columns set with 'colorcolumn'

"
" Common Syntax
"
call <SID>HI("Constant", s:dark_fg, [], "" )  " any constant
call <SID>HI("String", s:dark_green, [], "" )   " a string constant: 'this is a string'
call <SID>HI("Identifier", s:dark_orange, [], "" )  " any variable name
call <SID>HI("Identifiero", s:dark_unknown, [], "none")
call <SID>HI("Function", s:dark_blue, [], "" )  " function name (also: methods for classes)
call <SID>HI("Statement",  s:dark_orange, [], "" )  " any statement
call <SID>HI("Conditional",s:dark_orange, [], "" )  " if, then, else, endif, switch, etc
call <SID>HI("Comment", s:dark_grey_comment, [], "italic")  " any comment
call <SID>HI("PreProc", s:dark_orange, [], "" )  " generic Preprocessor
call <SID>HI("Type", s:dark_unknown, [], "none" )  " int, long, char, etc.
call <SID>HI("Special", s:dark_unknown, [], "")  " any special symbol
call <SID>HI("Underlined", s:dark_unknown, [], "underline" )  " text that stands out, HTML links
call <SID>HI("Title", s:dark_orange, [], "bold" )
call <SID>HI("Error", s:dark_black, s:dark_red_bright, "none" )  " any erroneous construct
call <SID>HI("Todo", s:dark_black, s:dark_grey_comment, "")  " keywords TODO FIXME and XXX
"call <SID>HI("Character", s:dark_plum, [], "" )  " a character constant: 'c', '\n'
"call <SID>HI("Label", s:dark_pink, [], "" )  "  case, default, etc.
"call <SID>HI("Repeat", s:dark_orange, [], "" )  " for, do, while, etc.
"call <SID>HI("Operator", s:dark_cyan, [], "none" )  " 'sizeof', '+', '*', etc.
"call <SID>HI("Keyword", s:dark_fg, [], "" )  " any other keyword
"call <SID>HI("Exception", s:dark_red, [], "" )  " try, catch, throw
"call <SID>HI("Include", s:dark_darkerfg, [], "" )  " preprocessor #include
"call <SID>HI("Define", s:dark_pink, [], "none" )  " preprocessor #define
"call <SID>HI("Macro", s:dark_pink, [], "none" )  " preprocessor #define
"call <SID>HI("PreCondit", s:dark_pink, [], "")  " preprocessor #if, #else, #endif, etc
"call <SID>HI("StorageClass", s:dark_cyan, [], "" )  " static, register, volatile, etc.
"call <SID>HI("Structure", s:dark_cyan, [], "" )  " struct, union, enum, etc.
"call <SID>HI("Typedef", s:dark_darkerfg, [], "" )  " a typedef

"
" Vimrc
"
call <SID>HI("vimCommand", s:dark_blue, [], "none" )
call <SID>HI("vimFuncName", s:dark_cyan, [], "none" )

"
" HTML
"
call <SID>HI("htmlTag", s:dark_yellow, [], "" )
call <SID>HI("htmlTagN", s:dark_yellow, [], "" )
call <SID>HI("htmlTagName", s:dark_yellow, [], "" )
call <SID>HI("htmlEndTag", s:dark_yellow, [], "" )
call <SID>HI("htmlArg", s:dark_yellow, [], "" )
call <SID>HI("htmlSpecialChar", s:dark_red, [], "" )
"call <SID>HI("htmlScriptTag", s:dark_paleblue, [], "" )

"
" Git
"
call <SID>HI("gitrebasePick", s:dark_red, [], "" )
call <SID>HI("gitrebaseReword", s:dark_red, [], "" )
call <SID>HI("gitrebaseEdit", s:dark_red, [], "" )
call <SID>HI("gitrebaseSquash", s:dark_red, [], "" )
call <SID>HI("gitrebaseFixup", s:dark_red, [], "" )
call <SID>HI("gitrebaseExec", s:dark_red, [], "" )
call <SID>HI("gitrebaseDrop", s:dark_red, [], "" )

"
" JS
"
call <SID>HI("jsNull", s:dark_blue, [], "" )
call <SID>HI("jsUndefined", s:dark_blue, [], "" )
call <SID>HI("jsNumber", s:dark_blue, [], "" )
call <SID>HI("jsFloat", s:dark_blue, [], "" )

call <SID>HI("jsParen", s:dark_yellow, [], "" )
call <SID>HI("jsParenIfElse", s:dark_yellow, [], "" )
call <SID>HI("jsParenSwitch", s:dark_yellow, [], "" )
call <SID>HI("jsParens", s:dark_yellow, [], "" )
call <SID>HI("jsBraces", s:dark_yellow, [], "" )
call <SID>HI("jsSwitchColon", s:dark_yellow, [], "")
call <SID>HI("jsSwitchBraces", s:dark_yellow, [], "" )
call <SID>HI("jsObjectBraces", s:dark_yellow, [], "" )
call <SID>HI("jsIfElseBraces", s:dark_yellow, [], "" )
call <SID>HI("jsRepeatBraces", s:dark_yellow, [], "")
call <SID>HI("jsTryCatchBraces", s:dark_orange, [], "")
call <SID>HI("jsBrackets", s:dark_yellow, [], "" )
call <SID>HI("jsOperator", s:dark_orange, [], "" )
call <SID>HI("jsGlobalObjects", s:dark_orange, [], "" )
call <SID>HI("jsBuiltins", s:dark_magenta, [], "" )

call <SID>HI("jsNoise", s:dark_yellow, [], "" )
call <SID>HI("jsDotNotation", s:dark_yellow, [], "" )
call <SID>HI("jsObject", s:dark_yellow, [], "" )
call <SID>HI("jsObjectKey", s:dark_light_blue, [], "" )
call <SID>HI("jsObjectProp", s:dark_fg, [], "" )
call <SID>HI("jsObjectSeparator", s:dark_yellow, [], "" )
call <SID>HI("jsObjectFuncName", s:dark_red, [], "" )

call <SID>HI("jsStatic", s:dark_red, [], "" )
call <SID>HI("jsFunction", s:dark_red, [], "" )
call <SID>HI("jsFuncName", s:dark_red, [], "" )
call <SID>HI("jsFuncCall", s:dark_red, [], "" )
call <SID>HI("jsFuncArgs", s:dark_yellow, [], "" )
call <SID>HI("jsFuncArgCommas", s:dark_orange, [], "" )
call <SID>HI("jsFunctionKey", s:dark_red, [], "" )
call <SID>HI("jsFuncParens", s:dark_yellow, [], "" )
call <SID>HI("jsFuncBraces", s:dark_red, [], "" )
call <SID>HI("jsArrowFunction", s:dark_red, [], "" )
call <SID>HI("jsExceptions", s:dark_red, [], "underline" )

call <SID>HI("jsFutureKeys", s:dark_orange, [], "" )
call <SID>HI("jsStorageClass", s:dark_orange, [], "" )
call <SID>HI("jsBooleanTrue", s:dark_orange, [], "" )
call <SID>HI("jsBooleanFalse", s:dark_orange, [], "" )

call <SID>HI("jsDecorator", s:dark_red, [], "" )
call <SID>HI("jsDecoratorFunction", s:dark_red, [], "" )
call <SID>HI("jsPrototype", s:dark_orange, [], "underline" )
call <SID>HI("jsSuper", s:dark_pink, [], "" )
call <SID>HI("jsThis", s:dark_pink, [], "" )

call <SID>HI("jsHtmlElemAttrs", s:dark_fg, [], "" )
call <SID>HI("jsHtmlEvents", s:dark_yellow, [], "" )

call <SID>HI("jsDocTags", s:dark_orange, [], "" )
call <SID>HI("jsDocType", s:dark_orange, [], "" )
call <SID>HI("jsDocTypeNoParam", s:dark_orange, [], "" )
call <SID>HI("jsDocParam", s:dark_grey_comment, [], "" )

call <SID>HI("jsImport", s:dark_orange, [], "" )
call <SID>HI("jsExport", s:dark_orange, [], "" )
call <SID>HI("jsExportDefault", s:dark_orange, [], "" )

call <SID>HI("jsClass", s:dark_orange, [], "underline" )
call <SID>HI("jsClassNoise", s:dark_red, [], "" )
call <SID>HI("jsClassKeyword", s:dark_orange, [], "underline" )
call <SID>HI("jsExtendsKeyword", s:dark_orange, [], "underline" )
call <SID>HI("jsClassBlock", s:dark_orange, [], "" )
call <SID>HI("jsClassBraces", s:dark_orange, [], "" )
call <SID>HI("jsClassDefinition", s:dark_red, [], "" )
call <SID>HI("jsClassMethodType", s:dark_red, [], "" )

call <SID>HI("jsModule", s:dark_orange, [], "" )
call <SID>HI("jsModuleBraces", s:dark_yellow, [], "" )
call <SID>HI("jsModuleKeyword", s:dark_fg, [], "" )

call <SID>HI("jsDestructuringNoise", s:dark_yellow, [], "" )
call <SID>HI("jsDestructuringBraces", s:dark_yellow, [], "" )
call <SID>HI("jsDestructuringBlock", s:dark_yellow, [], "" )

call <SID>HI("jsVariableDef", s:dark_fg, [], "" )
call <SID>HI("jsGlobalNodeObjects", s:dark_red, [], "" )

call <SID>HI("jsTaggedTemplate", s:dark_yellow, [], "" )
call <SID>HI("jsTemplateVar", s:dark_yellow, [], "" )
call <SID>HI("jsTemplateBraces", s:dark_orange, [], "" )
call <SID>HI("jsTemplateExpression", s:dark_yellow, [], "" )

call <SID>HI("jsComment", s:dark_grey_comment, [], "italic")
call <SID>HI("jsCommentTodo", s:dark_bg, s:dark_grey3, "italic")

" TODO: Remove after this issue is fixed (https://github.com/pangloss/vim-javascript/issues/955)
call <SID>HI("jsParensError", s:dark_orange, [], "" )

"
" JavaScript
"
call <SID>HI("javaScriptAsync", s:dark_violet, [], "" )
call <SID>HI("javaScriptFunction", s:dark_yellow, [], "" )
call <SID>HI("javaScriptParens", s:dark_yellow, [], "" )
call <SID>HI("javaScriptBraces", s:dark_yellow, [], "" )
call <SID>HI("javaScriptEndColons", s:dark_yellow, [], "" )
call <SID>HI("javaScriptDocTags", s:dark_grey_comment, [], "" )
call <SID>HI("javaScriptDocParam", s:dark_grey_comment, [], "" )
call <SID>HI("javaScriptFuncKeyword", s:dark_cyan, [], "" )
call <SID>HI("javaScriptFuncDef", s:dark_yellow, [], "" )
call <SID>HI("javaScriptFuncArg", s:dark_pink, [], "" )
call <SID>HI("javaScriptEventListenerKeywords", s:dark_fg, [], "" )
call <SID>HI("javaScriptOpSymbols", s:dark_fg, [], "" )
call <SID>HI("javaScriptHtmlElemProperties", s:dark_fg, [], "" )
call <SID>HI("javaScriptMessage", s:dark_fg, [], "" )
call <SID>HI("javaScriptStatement", s:dark_orange, [], "" )
call <SID>HI("javaScriptNumber", s:dark_blue, [], "" )
call <SID>HI("javaScriptFloat", s:dark_blue, [], "" )
call <SID>HI("javaScriptNull", s:dark_blue, [], "" )
call <SID>HI("javaScriptGlobalObjects", s:dark_cyan, s:dark_bg, "underline" )
call <SID>HI("javaScriptPrototype", s:dark_red, s:dark_bg, "" )
call <SID>HI("javaScriptExceptions", s:dark_red, s:dark_bg, "" )
call <SID>HI("javaScriptType", s:dark_orange, [], "" )
call <SID>HI("javaScriptBoolean", s:dark_orange, [], "" )
call <SID>HI("javaScriptAjaxMethods", s:dark_fg, [], "" )
call <SID>HI("javaScriptHtmlEvents", s:dark_yellow, [], "" )
call <SID>HI("javaScriptTemplateVar", s:dark_yellow, [], "" )
call <SID>HI("javaScriptTemplateDelim", s:dark_orange, [], "" )
call <SID>HI("javaScriptTemplateString", s:dark_green, [], "" )
call <SID>HI("javaScriptDotAccess", s:dark_fg, [], "" )
call <SID>HI("javaScriptWebAPI", s:dark_fg, [], "" )

"
" Typescript / Flow
"
call <SID>HI("jsFlowNoise", s:dark_yellow, [], "italic" )
call <SID>HI("jsFlowArray", s:dark_magenta, [], "italic" )
call <SID>HI("jsFlowArgumentDef", s:dark_magenta, [], "italic" )
call <SID>HI("jsFlowClassDef", s:dark_magenta, [], "italic" )
call <SID>HI("jsFlowClassGroup", s:dark_magenta, [], "italic" )
call <SID>HI("jsFlowClassProperty", s:dark_magenta, [], "italic" )
call <SID>HI("jsFlowType", s:dark_magenta, [], "italic" )
call <SID>HI("jsFlowTypeOf", s:dark_magenta, [], "italic" )
call <SID>HI("jsFlowTypeValue", s:dark_magenta, [], "italic" )
call <SID>HI("jsFlowTypeCustom", s:dark_magenta, [], "italic" )
call <SID>HI("jsFlowTypeStatement", s:dark_magenta, [], "italic" )
call <SID>HI("jsFlowMaybe", s:dark_magenta, [], "italic" )
call <SID>HI("jsFlowObject", s:dark_magenta, [], "italic" )
call <SID>HI("jsFlowGroup", s:dark_magenta, [], "italic" )
call <SID>HI("jsFlowOrOperator", s:dark_magenta, [], "" )
call <SID>HI("jsFlowWildcard", s:dark_magenta, [], "" )
call <SID>HI("jsFlowArrow", s:dark_yellow, [], "italic" )
call <SID>HI("jsFlowArrowArguments", s:dark_yellow, [], "italic" )
call <SID>HI("jsFlowArrowArguments", s:dark_yellow, [], "italic" )
call <SID>HI("jsFlowDefinition", s:dark_magenta, [], "italic" )
call <SID>HI("jsFlowParenAnnotation", s:dark_magenta, [], "italic" )
call <SID>HI("jsFlowFunctionGroup", s:dark_magenta, [], "italic" )
call <SID>HI("jsFlowReturnMaybe", s:dark_magenta, [], "italic" )

"
" JSON
"
call <SID>HI("jsonBraces", s:dark_yellow, [], "" )
call <SID>HI("jsonQuote", s:dark_yellow, [], "" )
call <SID>HI("jsonNumber", s:dark_blue, [], "" )
call <SID>HI("jsonNoise", s:dark_yellow, [], "" )
call <SID>HI("jsonKeyword", s:dark_orange, [], "" )
call <SID>HI("jsonKeywordMatch", s:dark_yellow, [], "" )
call <SID>HI("jsonKeywordMatch", s:dark_yellow, [], "" )

"
" GO
"
call <SID>HI("goDeclaration", s:dark_red, [], "" )
call <SID>HI("goType", s:dark_red, [], "" )
call <SID>HI("goSignedInts", s:dark_red, [], "" )
call <SID>HI("goUnsignedInts", s:dark_red, [], "" )
call <SID>HI("goComplexes", s:dark_red, [], "" )
call <SID>HI("goDecimalInt", s:dark_blue, [], "" )
call <SID>HI("goFloats", s:dark_red, [], "" )
call <SID>HI("goImaginary", s:dark_light_blue, [], "" )
call <SID>HI("goFormatSpecifier", s:dark_orange, [], "" )

"
" CSS
"
call <SID>HI("cssIdentifier", s:dark_red, [], "" )
call <SID>HI("cssImportant", s:dark_cyan, [], "" )
call <SID>HI("cssClassName", s:dark_red, [], "" )
call <SID>HI("cssPseudoClass", s:dark_green, [], "" )
call <SID>HI("cssPseudoClassId", s:dark_green, [], "" )
call <SID>HI("cssTagName", s:dark_yellow, [], "" )

call <SID>HI("cssStyle", s:dark_orange, [], "" )
call <SID>HI("cssNoise", s:dark_grey1, [], "" )
call <SID>HI("cssParens", s:dark_yellow, [], "" )
call <SID>HI("cssBraces", s:dark_yellow, [], "" )
call <SID>HI("cssBrackets", s:dark_yellow, [], "" )
call <SID>HI("cssParentSelector", s:dark_orange, [], "" )

call <SID>HI("cssBoxProp", s:dark_orange, [], "" )
call <SID>HI("cssFontProp", s:dark_orange, [], "" )
call <SID>HI("cssTextProp", s:dark_orange, [], "" )
call <SID>HI("cssColorProp", s:dark_orange, [], "" )
call <SID>HI("cssVisualProp", s:dark_orange, [], "" )
call <SID>HI("cssBorderProp", s:dark_orange, [], "" )
call <SID>HI("cssAdvancedProp", s:dark_orange, [], "" )
call <SID>HI("cssBackgroundProp", s:dark_orange, [], "" )
call <SID>HI("cssListProp", s:dark_orange, [], "" )
call <SID>HI("cssCommonProp", s:dark_orange, [], "" )
call <SID>HI("cssRenderProp", s:dark_orange, [], "" )
call <SID>HI("cssUIProp", s:dark_orange, [], "" )
call <SID>HI("cssGeneratedContentProp", s:dark_orange, [], "" )

call <SID>HI("cssBoxVal", s:dark_grey1, [], "" )
call <SID>HI("cssFontVal", s:dark_grey1, [], "" )
call <SID>HI("cssTextVal", s:dark_grey1, [], "" )
call <SID>HI("cssColorVal", s:dark_grey1, [], "" )
call <SID>HI("cssVisualVal", s:dark_grey1, [], "" )
call <SID>HI("cssBorderVal", s:dark_grey1, [], "" )
call <SID>HI("cssAdvancedVal", s:dark_grey1, [], "" )
call <SID>HI("cssBackgroundVal", s:dark_grey1, [], "" )
call <SID>HI("cssListVal", s:dark_grey1, [], "" )
call <SID>HI("cssCommonVal", s:dark_grey1, [], "" )
call <SID>HI("cssRenderVal", s:dark_grey1, [], "" )
call <SID>HI("cssRuleProp", s:dark_grey1, [], "" )
call <SID>HI("cssPseudo", s:dark_grey1, [], "" )

call <SID>HI("cssBoxAttr", s:dark_grey1, [], "" )
call <SID>HI("cssFontAttr", s:dark_grey1, [], "" )
call <SID>HI("cssTextAttr", s:dark_grey1, [], "" )
call <SID>HI("cssColorAttr", s:dark_grey1, [], "" )
call <SID>HI("cssVisualAttr", s:dark_grey1, [], "" )
call <SID>HI("cssBorderAttr", s:dark_grey1, [], "" )
call <SID>HI("cssAdvancedAttr", s:dark_grey1, [], "" )
call <SID>HI("cssBackgroundAttr", s:dark_grey1, [], "" )
call <SID>HI("cssCommonAttr", s:dark_grey1, [], "" )
call <SID>HI("cssRenderAttr", s:dark_grey1, [], "" )
call <SID>HI("cssFontDescriptorAttr", s:dark_grey1, [], "" )
call <SID>HI("cssTableAttr", s:dark_grey1, [], "" )
call <SID>HI("cssUIAttr", s:dark_grey1, [], "" )

call <SID>HI("cssColor", s:dark_grey1, [], "" )
call <SID>HI("cssValueNumber", s:dark_grey1, [], "" )
call <SID>HI("cssValueTime", s:dark_grey1, [], "" )
call <SID>HI("cssValueLength", s:dark_grey1, [], "" )
call <SID>HI("cssStringQ", s:dark_grey1, [], "" )
call <SID>HI("cssStringQQ", s:dark_grey1, [], "" )
call <SID>HI("cssURL", s:dark_grey1, [], "" )

call <SID>HI("stylusCssAttribute", s:dark_grey1, [], "" )
call <SID>HI("stylusControl", s:dark_grey1, [], "" )
call <SID>HI("stylusInterpolation", s:dark_grey1, [], "" )
call <SID>HI("stylusAmpersand", s:dark_red, [], "" )
call <SID>HI("stylusClass", s:dark_red, [], "" )
call <SID>HI("stylusClassChar", s:dark_red, [], "" )
call <SID>HI("stylusIdChar", s:dark_orange, [], "" )

"
" Markdown
"
call <SID>HI("markdownLinkText", s:dark_green, [], "" )
call <SID>HI("markdownHeadingDelimiter", s:dark_red, [], "" )
"call <SID>HI("markdownListMarker", s:dark_cyan, [], "" )
"call <SID>HI("markdownCode", s:dark_paleblue, [], "" )
"call <SID>HI("markdownBold", s:dark_darkerfg, [], "bold" )
"call <SID>HI("markdownBlockquote", s:dark_darkerfg, [], "" )

"
" NERDTree
"
fun <SID>NERDTreeHighlightFile(extension, fg, bg, attr)
 exec 'au FileType nerdtree highlight ' . a:extension . ' guifg=' . a:fg[1] . ' ctermfg=' . a:fg[0] .' guibg=' . a:bg[1] .' ctermbg=' . a:bg[0]
 exec 'au FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'

 if a:attr != ""
   exec 'au FileType nerdtree highlight ' . a:extension . ' gui=' . a:attr . ' cterm=' . a:attr
 endif
endfun

call <SID>NERDTreeHighlightFile('sh', s:dark_yellow, s:dark_bg, '')
call <SID>NERDTreeHighlightFile('env', s:dark_red, s:dark_bg, '')
call <SID>NERDTreeHighlightFile('sample', s:dark_green, s:dark_bg, 'italic')
call <SID>NERDTreeHighlightFile('json', s:dark_green, s:dark_bg, 'italic')
call <SID>NERDTreeHighlightFile('html', s:dark_yellow, s:dark_bg, '')
call <SID>NERDTreeHighlightFile('css', s:dark_pink, s:dark_bg, '')
call <SID>NERDTreeHighlightFile('js', s:dark_orange, s:dark_bg, '')
call <SID>NERDTreeHighlightFile('ico', s:dark_grey2, s:dark_bg, '')

"
" ALE
"
call <SID>HI("ALEError", s:dark_black, s:dark_red, "italic" )
call <SID>HI("ALEStyleError", s:dark_red, s:dark_black, "" )
call <SID>HI("ALEStyleWarning", s:dark_black, s:dark_green, "" )
call <SID>HI("ALEWarning", s:dark_black, s:dark_green, "italic" )
call <SID>HI("ALEInfo", s:dark_green, s:dark_black, "" )

"
" Cleanup
"
delf <SID>HI
delf <SID>NERDTreeHighlightFile

" Vim color scheme
"
" Name:        ultimate.vim
" Maintainer:  Christian Persson <c0r73x@fulhax.nu>
" License:     public domain

set background=dark
hi clear
if exists('syntax_on')
  syntax reset
endif
let g:colors_name = 'ultimate'

exe 'hi MatchParen ctermfg=9 ctermbg=0 cterm=none'
exe 'hi MatchTag ctermfg=9 ctermbg=0 cterm=none'

exe 'hi ColorColumn ctermbg=233'
exe 'hi Nontext ctermfg=7 ctermbg=none'
exe 'hi Normal ctermfg=none'
exe 'hi Cursor ctermfg=none ctermbg=15'
exe 'hi CursorLineNr ctermbg=4 ctermfg=15'
exe 'hi CursorLine ctermbg=233 cterm=none'
exe 'hi CursorColumn ctermbg=233 cterm=none'
exe 'hi LineNr ctermfg=8 ctermbg=none'
exe 'hi Search ctermfg=15 ctermbg=0'
exe 'hi VertSplit cterm=none ctermfg=0 ctermbg=none'

exe 'hi Visual ctermbg=8'
exe 'hi NonText ctermfg=0'
exe 'hi Define ctermfg=5'
exe 'hi Include ctermfg=5'
exe 'hi PreCondit ctermfg=5'
exe 'hi Macro ctermfg=5'
exe 'hi Identifier ctermfg=6'
exe 'hi Number ctermfg=3'
exe 'hi PreProc ctermfg=4'
exe 'hi StorageClass ctermfg=4'
exe 'hi Statement ctermfg=4'
exe 'hi Structure ctermfg=4'
exe 'hi String ctermfg=10'
exe 'hi Type ctermfg=6'
exe 'hi Special ctermfg=9'

exe 'hi Folded ctermbg=0 ctermfg=7'
exe 'hi FoldColumn ctermfg=7 ctermbg=none'

exe 'hi DiffAdd ctermfg=0 ctermbg=2'
exe 'hi DiffDelete ctermfg=0 ctermbg=1'
exe 'hi DiffChange ctermfg=0 ctermbg=3'
exe 'hi DiffText ctermfg=0 ctermbg=13'

exe 'hi Comment ctermfg=0'
exe 'hi Constant ctermfg=1'
exe 'hi Todo ctermfg=7 ctermbg=none'
exe 'hi Function ctermfg=6'
exe 'hi Error ctermfg=9 ctermbg=none'
exe 'hi Warning ctermfg=11 ctermbg=none'

exe 'hi Pmenu ctermfg=15 ctermbg=8'
exe 'hi PmenuSel ctermfg=15 ctermbg=6'
exe 'hi PMenuSbar ctermbg=6'
exe 'hi PMenuThumb ctermbg=6'

exe 'hi Delimiter ctermfg=8'
exe 'hi Operator ctermfg=5'

exe 'hi Directory ctermfg=15'
exe 'hi SpecialKey ctermfg=5'
exe 'hi Keyword ctermfg=6'
exe 'hi Title ctermfg=7'
exe 'hi SignColumn term=none ctermfg=6 ctermbg=none'

exe 'hi xmlTag ctermfg=5'
exe 'hi xmlTagName ctermfg=13'
exe 'hi xmlEndTag ctermfg=5'

exe 'hi WarningMarker ctermfg=3 ctermbg=none'
exe 'hi ErrorMarker ctermfg=1 ctermbg=none'
exe 'hi InfoMarker ctermfg=4 ctermbg=none'

exe 'hi StatusLine ctermfg=4 ctermbg=none cterm=none'
exe 'hi StatusLineNC ctermfg=8 ctermbg=none cterm=none'

exe 'hi User1 ctermfg=1 ctermbg=none'
exe 'hi User2 ctermfg=15 ctermbg=none'
exe 'hi User3 ctermfg=2 ctermbg=none'
exe 'hi User4 ctermfg=6 ctermbg=none'
exe 'hi User5 ctermfg=5 ctermbg=none'
exe 'hi User7 ctermfg=8 ctermbg=none'
exe 'hi User8 ctermfg=3 ctermbg=none'
exe 'hi User9 ctermfg=4 ctermbg=none'

exe 'hi SpellBad ctermfg=9 ctermbg=none'
exe 'hi SpellCap ctermfg=12 ctermbg=none'
exe 'hi SpellLocal ctermfg=14 ctermbg=none'
exe 'hi SpellRare ctermfg=13 ctermbg=none'

exe 'hi CSVColumnOdd ctermfg=7 ctermbg=0'
exe 'hi CSVColumnEven ctermfg=8 ctermbg=none'

exe 'hi CSVColumnHeaderOdd ctermfg=15 ctermbg=0'
exe 'hi CSVColumnHeaderEven ctermfg=7 ctermbg=none'

hi! link htmlTag xmlTag
hi! link htmlTagName xmlTagName
hi! link htmlEndTag xmlEndTag
hi! link Conceal Function

hi! link ErrorMsg Error
hi! link WarningMsg Warning

hi! link SyntasticErrorSign ErrorMarker
hi! link SyntasticWarningSign WarningMarker

exe 'hi diffAdded ctermfg=2'

" qml
exec 'hi link JavaScriptValue Number'
exec 'hi link JavaScriptSpecial Special'
exec 'hi link JavaScriptError Error'

" NERDTree
exe 'hi NERDTreeDirSlash ctermfg=8'

" easytags 
" c/cpp {{{1
exe 'hi cTypeTag ctermfg=3'
exe 'hi link cEnumTag cEnum'
exe 'hi cPreProcTag ctermfg=5'
exe 'hi cFunctionTag ctermfg=1'
exe 'hi link cMemberTag cMember'
" 1}}}
" java {{{1
exec 'hi javaClassTag ctermfg=3'
exec 'hi javaInterfaceTag ctermfg=5'
exec 'hi javaMethodTag ctermfg=1'
" 1}}}
" perl {{{1
exe 'hi PerlFunctionTag ctermfg=1'
" 1}}}
" ruby {{{1
exe 'hi rubyModuleNameTag ctermfg=2'
exe 'hi rubyClassNameTag ctermfg=3'
exe 'hi rubyMethodNameTag ctermfg=1'
" 1}}}
" shell {{{1
exe 'hi shFunctionTag ctermfg=1'
" 1}}}
" vim {{{1
exe 'hi vimAutoGroupTag ctermfg=5'
exe 'hi vimCommandTag ctermfg=3'
exe 'hi vimFuncNameTag ctermfg=1'
exe 'hi vimScriptFuncNameTag ctermfg=1'
" 1}}}
" python {{{1 "
exe 'hi pythonFunctionTag ctermfg=1'
exe 'hi pythonMethodTag ctermfg=1'
exe 'hi pythonClassTag ctermfg=3'
" 1}}}
" php {{{1 "
exe 'hi phpFunction ctermfg=12'
exe 'hi phpFunctions ctermfg=12'
exe 'hi phpMethods ctermfg=12'

exe 'hi phpClasses ctermfg=14'
exe 'hi phpClass ctermfg=14'

exe 'hi phpType ctermfg=6'
exe 'hi phpDefine ctermfg=6'
exe 'hi phpClassExtends ctermfg=14'

"exe 'hi phpOperator ctermfg='
"exe 'hi phpDefine ctermfg=7'
"
"exe 'hi phpOperator ctermfg=7'
"exe 'hi phpSpecial ctermfg=7'
"
"exe 'hi phpIdentifier ctermfg=7'
"exe 'hi phpMethodsVar ctermfg=6'
exe 'hi phpComment ctermfg=0'
" 1}}}

" vim: set ts=4 sw=4 tw=78 ft=vim fdm=marker et :

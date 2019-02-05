inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect

inoremap <c-c> <ESC>



inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

let g:LanguageClient_serverCommands = {
  \ 'typescript': ['typescript-language-server', '--stdio'],
  \ 'javascript': ['typescript-language-server', '--stdio'],
  \ 'javascript.jsx': ['typescript-language-server', '--stdio'],
  \ 'vue': ['vls', '--stdio'],
  \ 'css': ['css-languageserver', '--stdio'],
  \ 'scss': ['css-languageserver', '--stdio'],
  \ 'less': ['css-languageserver', '--stdio'],
  \ 'json': ['vscode-json-languageserver', '--stdio'],
  \ 'jsonc': ['vscode-json-languageserver', '--stdio'],
  \ 'html': ['html-languageserver', '--stdio'],
  \ }



" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" 
" xnoremap <silent> <A-Return> :call UltiSnips#SaveLastVisualSelection()<CR>gvs
" 
" inoremap <silent> <C-Space> <C-R>=ncm2#_do_auto_trigger()<CR>
" inoremap <silent> <A-Return> <C-R>=UltiSnips#ExpandSnippet()<CR>
"
"    " ncm2 {{{1
    " augroup ncm2
    "     autocmd!
    "     autocmd BufEnter * call ncm2#enable_for_buffer()
    "     autocmd TextChangedI * call ncm2#auto_trigger()
    "     autocmd User Ncm2PopupOpen set completeopt=menu,menuone,noinsert,noselect
    "     autocmd User Ncm2PopupClose set completeopt=menuone
    " augroup END
    " " 1}}}
    "
    "
    "

" " LanguageClient-neovim {{{2
" "call LanguageClient_setLoggingLevel('DEBUG')
" 
" let g:LanguageClient_diagnosticsEnable = 0
" let g:LanguageClient_diagnosticsDisplay = {
"             \   1: {
"             \       'name': 'Error',
"             \       'texthl': 'ALEError',
"             \       'signText': g:ale_sign_error,
"             \       'signTexthl': 'ALEErrorSign',
"             \   },
"             \   2: {
"             \       'name': 'Warning',
"             \       'texthl': 'ALEWarning',
"             \       'signText': g:ale_sign_warning,
"             \       'signTexthl': 'ALEWarningSign',
"             \   },
"             \   3: {
"             \       'name': 'Information',
"             \       'texthl': 'ALEInfo',
"             \       'signText': g:ale_sign_info,
"             \       'signTexthl': 'ALEInfoSign',
"             \   },
"             \   4: {
"             \       'name': 'Hint',
"             \       'texthl': 'ALEInfo',
"             \       'signText': g:ale_sign_info,
"             \       'signTexthl': 'ALEInfoSign',
"             \   },
"             \ }
" 
" let g:LanguageClient_serverCommands = {
"             \   'c': ['clangd', g:compile_commands],
"             \   'cpp': ['clangd', g:compile_commands],
"             \   'python': ['pyls'],
"             \   'ruby': ['language_server-ruby'],
"             \   'java': [$VIMPATH . '/utils/java/java-ls', getcwd()],
"             \   'typescript': ['typescript-language-server', '--stdio'],
"             \   'javascript.jsx': ['typescript-language-server', '--stdio'],
"             \   'javascript': ['typescript-language-server', '--stdio'],
"             \   'flow': ['typescript-language-server', '--stdio'],
"             \   'css': ['css-languageserver', '--stdio'],
"             \   'less': ['css-languageserver', '--stdio'],
"             \   'scss': ['css-languageserver', '--stdio'],
"             \   'html': ['html-languageserver', '--stdio'],
"             \   'json': ['json-languageserver', '--stdio'],
"             \   'bash': ['bash-language-server', 'start'],
"             \   'sh': ['bash-language-server', 'start'],
"             \   'lua': ['lua-lsp'],
"             \ }
" 
" " 2}}}

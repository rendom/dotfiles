" " " " " " " " Use tab for trigger completion with characters ahead.
" " " " " " " inoremap <silent><expr> <TAB>
" " " " " " "       \ pumvisible() ? "\<C-n>" :
" " " " " " "       \ <SID>check_back_space() ? "\<TAB>" :
" " " " " " "       \ coc#refresh()
" " " " " " " inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" " " " " " " 
" " " " " " " function! s:check_back_space() abort
" " " " " " "   let col = col('.') - 1
" " " " " " "   return !col || getline('.')[col - 1]  =~# '\s'
" " " " " " " endfunction
" " " " " " " 
" " " " " " " " Use <c-space> for trigger completion.
" " " " " " " inoremap <silent><expr> <c-space> coc#refresh()
" " " " " " " 
" " " " " " " " Use <cr> for confirm completion.
" " " " " " " "inoremap <expr><cr>  pumvisible() ? "\<C-y>" : "\<cr>"
" " " " " " " "inoremap <expr><cr> <Nop>
" " " " " " " inoremap <expr><cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" " " " " " " 
" " " " " " " " Use `[c` and `]c` for navigate diagnostics
" " " " " " " nmap <silent> [c <Plug>(coc-diagnostic-prev)
" " " " " " " nmap <silent> ]c <Plug>(coc-diagnostic-next)
" " " " " " " 
" " " " " " " " Remap keys for gotos
" " " " " " " nmap <silent> gd <Plug>(coc-definition)
" " " " " " " nmap <silent> gy <Plug>(coc-type-definition)
" " " " " " " nmap <silent> gi <Plug>(coc-implementation)
" " " " " " " nmap <silent> gr <Plug>(coc-references)
" " " " " " " 
" " " " " " " " Use K for show documentation in preview window
" " " " " " " nnoremap <silent> K :call <SID>show_documentation()<CR>
" " " " " " " 
" " " " " " " function! s:show_documentation()
" " " " " " "   if &filetype == 'vim'
" " " " " " "     execute 'h '.expand('<cword>')
" " " " " " "   else
" " " " " " "     call CocAction('doHover')
" " " " " " "   endif
" " " " " " " endfunction
" " " " " " " 
" " " " " " " " Show signature help while editing
" " " " " " " autocmd CursorHoldI,CursorMovedI * silent! call CocAction('showSignatureHelp')
" " " " " " " 
" " " " " " " " Open quickfix list on quickfix change triggered by coc
" " " " " " " autocmd User CocQuickfixChange :copen
" " " " " " " 
" " " " " " " " Remap for rename current word
" " " " " " " nmap <leader>rn <Plug>(coc-rename)
" " " " " " " 
" " " " " " " " Remap for format selected region
" " " " " " " vmap <leader>f  <Plug>(coc-format-selected)
" " " " " " " nmap <leader>f  <Plug>(coc-format-selected)
" " " " " " " 
" " " " " " " " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
" " " " " " " vmap <leader>a  <Plug>(coc-codeaction-selected)
" " " " " " " nmap <leader>a  <Plug>(coc-codeaction-selected)
" " " " " " " 
" " " " " " " " Remap for do codeAction of current line
" " " " " " " nmap <leader>ac  <Plug>(coc-codeaction)
" " " " " " " 
" " " " " " " " Use `:Format` for format current file
" " " " " " " command! -nargs=0 Format :call CocAction('format')
" " " " " " " 
" " " " " " " " Add diagnostic info for https://github.com/itchyny/lightline.vim
" " " " " " " let g:lightline = {
" " " " " " "       \ 'colorscheme': 'wombat',
" " " " " " "       \ 'active': {
" " " " " " "       \   'left': [ [ 'mode', 'paste' ],
" " " " " " "       \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
" " " " " " "       \ },
" " " " " " "       \ 'component_function': {
" " " " " " "       \   'cocstatus': 'coc#status'
" " " " " " "       \ },
" " " " " " "       \ }
" " " " " " " 
" " " " " " " 
" " " " " " " " Shortcuts for denite interface
" " " " " " " " Show symbols of current buffer
" " " " " " " nnoremap <silent> <space>o  :<C-u>Denite coc-symbols<cr>
" " " " " " " " Search symbols of current workspace
" " " " " " " "nnoremap <silent> <space>t  :<C-u>Denite coc-workspace<cr>
" " " " " " " " Show diagnostics of current workspace
" " " " " " " nnoremap <silent> <space>a  :<C-u>Denite coc-diagnostic<cr>
" " " " " " " " Show available commands
" " " " " " " nnoremap <silent> <space>c  :<C-u>Denite coc-command<cr>
" " " " " " " " Show available services
" " " " " " " nnoremap <silent> <space>s  :<C-u>Denite coc-service<cr>
" " " " " " "
" " " " " " " if hidden not set, TextEdit might fail.
" " " " " " set hidden
" " " " " " 
" " " " " " " Better display for messages
" " " " " " set cmdheight=2
" " " " " " 
" " " " " " " Smaller updatetime for CursorHold & CursorHoldI
" " " " " " " set updatetime=300
" " " " " " 
" " " " " " " don't give |ins-completion-menu| messages.
" " " " " " set shortmess+=c
" " " " " " 
" " " " " " " always show signcolumns
" " " " " " set signcolumn=yes
" " " " " " 
" " " " " " " Use tab for trigger completion with characters ahead and navigate.
" " " " " " " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
" " " " " " inoremap <silent><expr> <TAB>
" " " " " "       \ pumvisible() ? "\<C-n>" :
" " " " " "       \ <SID>check_back_space() ? "\<TAB>" :
" " " " " "       \ coc#refresh()
" " " " " " inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" " " " " " 
" " " " " " function! s:check_back_space() abort
" " " " " "   let col = col('.') - 1
" " " " " "   return !col || getline('.')[col - 1]  =~# '\s'
" " " " " " endfunction
" " " " " " 
" " " " " " " Use <c-space> for trigger completion.
" " " " " " inoremap <silent><expr> <c-space> coc#refresh()
" " " " " " 
" " " " " " " Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" " " " " " " Coc only does snippet and additional edit on confirm.
" " " " " " inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" " " " " " 
" " " " " " " Use `[c` and `]c` for navigate diagnostics
" " " " " " nmap <silent> [c <Plug>(coc-diagnostic-prev)
" " " " " " nmap <silent> ]c <Plug>(coc-diagnostic-next)
" " " " " " 
" " " " " " " Remap keys for gotos
" " " " " " nmap <silent> gd <Plug>(coc-definition)
" " " " " " nmap <silent> gy <Plug>(coc-type-definition)
" " " " " " nmap <silent> gi <Plug>(coc-implementation)
" " " " " " nmap <silent> gr <Plug>(coc-references)
" " " " " " 
" " " " " " " Use K for show documentation in preview window
" " " " " " nnoremap <silent> K :call <SID>show_documentation()<CR>
" " " " " " 
" " " " " " function! s:show_documentation()
" " " " " "   if &filetype == 'vim'
" " " " " "     execute 'h '.expand('<cword>')
" " " " " "   else
" " " " " "     call CocAction('doHover')
" " " " " "   endif
" " " " " " endfunction
" " " " " " 
" " " " " " " Highlight symbol under cursor on CursorHold
" " " " " " " autocmd CursorHold * silent call CocActionAsync('highlight')
" " " " " " 
" " " " " " " Remap for rename current word
" " " " " " nmap <leader>rn <Plug>(coc-rename)
" " " " " " 
" " " " " " " Remap for format selected region
" " " " " " vmap <leader>f  <Plug>(coc-format-selected)
" " " " " " nmap <leader>f  <Plug>(coc-format-selected)
" " " " " " 
" " " " " " augroup mygroup
" " " " " "   autocmd!
" " " " " "   " Setup formatexpr specified filetype(s).
" " " " " "   autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
" " " " " "   " Update signature help on jump placeholder
" " " " " "   autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
" " " " " " augroup end
" " " " " " 
" " " " " " " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
" " " " " " vmap <leader>a  <Plug>(coc-codeaction-selected)
" " " " " " nmap <leader>a  <Plug>(coc-codeaction-selected)
" " " " " " 
" " " " " " " Remap for do codeAction of current line
" " " " " " nmap <leader>ac  <Plug>(coc-codeaction)
" " " " " " " Fix autofix problem of current line
" " " " " " nmap <leader>qf  <Plug>(coc-fix-current)
" " " " " " 
" " " " " " " Use `:Format` for format current buffer
" " " " " " command! -nargs=0 Format :call CocAction('format')
" " " " " " 
" " " " " " " Use `:Fold` for fold current buffer
" " " " " " command! -nargs=? Fold :call     CocAction('fold', <f-args>)
" " " " " " 
" " " " " " 
" " " " " " " Add diagnostic info for https://github.com/itchyny/lightline.vim
" " " " " " "let g:lightline = {
" " " " " " "      \ 'colorscheme': 'wombat',
" " " " " " "      \ 'active': {
" " " " " " "      \   'left': [ [ 'mode', 'paste' ],
" " " " " " "      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
" " " " " " "      \ },
" " " " " " "      \ 'component_function': {
" " " " " " "      \   'cocstatus': 'coc#status'
" " " " " " "      \ },
" " " " " " "      \ }
" " " " " " 
" " " " " " 
" " " " " " 
" " " " " " " Using CocList
" " " " " " " Show all diagnostics
" " " " " " nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" " " " " " " Manage extensions
" " " " " " nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" " " " " " " Show commands
" " " " " " nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" " " " " " " Find symbol of current document
" " " " " " nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" " " " " " " Search workspace symbols
" " " " " " nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" " " " " " " Do default action for next item.
" " " " " " nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" " " " " " " Do default action for previous item.
" " " " " " nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" " " " " " " Resume latest coc list
" " " " " " nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
" nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>


"nnoremap <leader>t :<C-u>CocList files<CR>
"nnoremap <leader>g :<C-u>CocList grep<CR>
"nnoremap <leader>b :<C-u>CocList buffer<CR>

hi CocHighlightText ctermfg=253 guifg=#cfcfcf ctermbg=240 guibg=#83a598
"hi CocHighlightText deco=reverse
"call s:h('CocHighlightText', { 'deco': 'reverse' })
"call s:h('CocWarningSign',   { 'link': 'WarningMarker' })
"call s:h('CocErrorSign',     { 'link': 'ErrorMarker' })
"call s:h('CocInfoSign',      { 'link': 'InfoMarker' })
"call s:h('CocInfoSign',      { 'fg': s:purple })
"call s:h('CocUnderline',     { 'bg': s:darkbrown, 'fg': s:lightyellow, 'deco': 'underline' })

let g:coc_node_path="/opt/homebrew/bin/node"

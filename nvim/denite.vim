let s:denite_options = {'default' : {
\ 'split': 'floating',
\ 'start_filter': 1,
\ 'auto_resize': 1,
\ 'source_names': 'short',
\ 'prompt': '> ',
\ 'statusline': 0,
\ 'highlight_matched_char': 'QuickFixLine',
\ 'highlight_matched_range': 'Visual',
\ 'highlight_window_background': 'Visual',
\ 'highlight_filter_background': 'DiffAdd',
\ 'winrow': 1,
\ 'vertical_preview': 1
\ }}

" Loop through denite options and enable them
function! s:profile(opts) abort
  for l:fname in keys(a:opts)
    for l:dopt in keys(a:opts[l:fname])
      call denite#custom#option(l:fname, l:dopt, a:opts[l:fname][l:dopt])
    endfor
  endfor
endfunction

call s:profile(s:denite_options)

call denite#custom#var('file/rec', 'command',
	\ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])

call denite#custom#alias('source', 'file/rec/git', 'file/rec')
	call denite#custom#var('file/rec/git', 'command',
	      \ ['git', 'ls-files', '-co', '--exclude-standard'])

call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts',
        \ ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" Change ignore_globs
call denite#custom#filter('matcher/ignore_globs', 'ignore_globs',
            \ [ '.git/', '.ropeproject/', '__pycache__/',
            \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])

"nmap ; :Denite buffer<CR>
nmap <leader>t :DeniteProjectDir file/rec<CR>
nnoremap <leader>g :<C-u>Denite grep:. -no-empty<CR>
nnoremap <leader>b :<C-u>Denite buffer<CR>
"nnoremap <leader>j :<C-u>DeniteCursorWord grep:.<CR>

" Define mappings while in 'filter' mode
"   <C-o>         - Switch to normal mode inside of search results
"   <Esc>         - Exit denite window in any mode
"   <CR>          - Open currently selected file in any mode
"   <C-t>         - Open currently selected file in a new tab
"   <C-v>         - Open currently selected file a vertical split
"   <C-h>         - Open currently selected file in a horizontal split
" autocmd FileType denite-filter call s:denite_filter_my_settings()
" function! s:denite_filter_my_settings() abort
"   imap <silent><buffer> <C-o>
"   \ <Plug>(denite_filter_quit)
"   inoremap <silent><buffer><expr> <Esc>
"   \ denite#do_map('quit')
"   nnoremap <silent><buffer><expr> <Esc>
"   \ denite#do_map('quit')
"   inoremap <silent><buffer><expr> <CR>
"   \ denite#do_map('do_action')
"   inoremap <silent><buffer><expr> <C-t>
"   \ denite#do_map('do_action', 'tabopen')
"   inoremap <silent><buffer><expr> <C-v>
"   \ denite#do_map('do_action', 'vsplit')
"   inoremap <silent><buffer><expr> <C-h>
"   \ denite#do_map('do_action', 'split')
" endfunction

" Define mappings while in denite window
"   <CR>        - Opens currently selected file
"   q or <Esc>  - Quit Denite window
"   d           - Delete currenly selected file
"   p           - Preview currently selected file
"   <C-o> or i  - Switch to insert mode inside of filter prompt
"   <C-t>       - Open currently selected file in a new tab
"   <C-v>       - Open currently selected file a vertical split
"   <C-h>       - Open currently selected file in a horizontal split
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> <Esc>
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <C-o>
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <C-t>
  \ denite#do_map('do_action', 'tabopen')
  nnoremap <silent><buffer><expr> <C-v>
  \ denite#do_map('do_action', 'vsplit')
  nnoremap <silent><buffer><expr> <C-h>
  \ denite#do_map('do_action', 'split')
endfunction

"call denite#custom#var('file_rec', 'command',
"      \ ['ag', '--follow', '--nocolor', '--nogroup', '--column', '-g', ''])
"
"call denite#custom#map('_', "\<C-j>", '<denite:move_to_next_line>')
"call denite#custom#map('_', "\<C-s>", '<denite:do_action:vsplit>')
"call denite#custom#map('_', "\<C-k>", '<denite:move_to_prev_line>')
"call denite#custom#map('_', "\<esc>", '<denite:enter_mode:normal>')
"
"
"call denite#custom#alias('source', 'file_rec/git', 'file_rec')
"call denite#custom#var('file_rec/git', 'command',
"            \ ['git', 'ls-files', '-co', '--exclude-standard'])
"
"call denite#custom#option('default', 'prompt', '>')
"
"nnoremap <silent> <leader>b :<C-U>Denite buffer<cr>
"nnoremap <silent> <leader>t :<C-U>Denite file_rec<cr>
"nnoremap <silent> <leader>g :<C-U>Denite grep<cr>
"nnoremap <silent> <leader>l :<C-U>Denite line<cr>
"nnoremap <silent> <leader>q :<C-U>Denite qflist<cr>
" 
"
"call denite#custom#var('grep', 'command', ['ag'])
"call denite#custom#var('grep', 
"            \ 'default_opts',
"            \ [
"            \   '-i',
"            \   '--nocolor',
"            \   '--follow',
"            \   '--vimgrep'
"            \ ])
"call denite#custom#var('grep', 'recursive_opts', [])
"call denite#custom#var('grep', 'pattern_opt', [])
"call denite#custom#var('grep', 'separator', ['--'])
"call denite#custom#var('grep', 'final_opts', [])
"

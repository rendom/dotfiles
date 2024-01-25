return {
  "Shougo/denite.nvim",
  keys = {
    { "<leader>t", "<cmd>DeniteProjectDir file/rec<CR>", desc = "Foobar" },
    { "<leader>g", "<cmd>Denite grep:. -no-empty<CR>", desc = "Foobar" },
    { "<leader>b", "<cmd>Denite buffer<CR>", desc = "Foobar" },
  },
  config = function()
    vim.cmd([[

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
    ]])
  end,
}

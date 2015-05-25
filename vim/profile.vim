let mapleader = "\<space>"
nnoremap <space> <nop>

colorscheme distinguished
syntax on
set nu
set history=1000
set undolevels=1000
set encoding=utf-8
set autoindent
set smartindent
set shiftwidth=4
set expandtab
set tabstop=4
set softtabstop=4
set nowrap
set linebreak

set backspace=2 
set synmaxcol=150

set noesckeys
set ttimeout
set ttimeoutlen=50

set laststatus=2


" ignore case in search
set ignorecase
set smartcase

set conceallevel=2
set concealcursor=nc

" Search stuff
set hlsearch
set showmatch
set incsearch

" utf8
set encoding=utf-8

" highlight cursor line
"set cursorline

" split opening
set splitbelow
set splitright

" javascript jox
let javascript_enable_domhtmlcss = 1
let g:javascript_conceal = 1
let g:syntastic_javascript_checkers = ['jshint']


"ultisnips
let g:UltiSnipsDontReverseSearchPath = 1
let g:UltiSnipsSnippetDirectories    = ["UltiSnips", "snips"]
let g:UltiSnipsExpandTrigger         = "<C-l>"
let g:UltiSnipsJumpForwardTrigger    = "<C-l>"
let g:UltiSnipsJumpBackwardTrigger   = "<C-h>"
let g:UltiSnipsUsePythonVersion      = 2



" unite {{{1
nnoremap <silent> <leader>b :<C-U>Unite buffer<cr>
nnoremap <silent> <leader>t :exec "Unite ".UniteGetSource()<cr>
nnoremap <silent> <leader>g :<C-U>Unite grep<cr>
nnoremap <silent> <leader>l :<C-U>Unite line<cr>
nnoremap <silent> <leader>q :<C-U>Unite qflist<cr>
" 1}}}
" unite {{{2
let g:unite_source_buffer_time_format  = '%Y-%m-%d %H:%M:%S '
let g:unite_source_grep_command        = 'ag'
let g:unite_source_grep_default_opts   = '--nocolor --follow --nogroup --column'
let g:unite_source_find_default_opts   = '-L'
let g:unite_source_rec_max_cache_files = 0
let g:unite_redraw_hold_candidates     = 50000
let g:unite_source_rec_async_command   = 'ag
            \ --follow
            \ --nocolor
            \ --nogroup
            \ --column
            \ -g ""'

let g:unite_source_grep_recursive_opt = ''

silent! call unite#custom#profile(
            \ 'default', 'context', {
            \    'start_insert': 1,
            \    'direction': 'botright',
            \    'auto_size': 1
            \ })


silent! call unite#custom#source(
            \ 'buffer,file_rec,file_rec/async,file_rec/git',
            \ 'required_pattern_length', 2
            \ )

silent! call unite#custom#source(
            \ 'buffer,file_rec,file_rec/async,file_rec/git',
            \ 'matchers',
            \ [
            \   'converter_relative_word',
            \   'matcher_fuzzy',
            \   'ignore_globs'
            \ ])
" 2}}}
function! UniteGetSource() " {{{2
    " If inside git dir, do file_rec/git, else file_rec/async
    if exists('b:gd') && (b:gd ==# '' || b:gd =~# '/$')
        unlet b:gd
    endif

    if !exists('b:gd')
        let dir = s:ExtractGitProject()
        if dir !=# ''
            let b:gd = dir
        endif
    endif
    return b:gd !=# '' ? 'file_rec/git' : 'file_rec/async:!'
endfunction
" 2}}}

function! s:ExtractGitProject() " {{{2
    let b:gd = finddir('.git', ';')
    return b:gd
endfunction
" 2}}}


"vim go
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1


set nocompatible
set norelativenumber
set nocursorline
"set nolazyredraw
"set nottyfast

let g:formatprg_javascript      = 'js-beautify'
let g:formatprg_args_javascript = '
            \ --type js
            \ -i
            \ -j
            \ --brace-style=collapse
            \ -k
            \ -x
            \ -w 120
            \ -f -'


"Neocomplete
let g:neocomplete#enable_at_startup                    = 1
let g:neocomplete#enable_smart_case                    = 1
let g:neocomplete#sources#syntax#min_keyword_length    = 3
let g:neocomplete#lock_buffer_name_pattern             = '\*ku\*'
let g:neocomplete#enable_fuzzy_completion              = 1
let g:neocomplete#enable_auto_select                   = 0
let g:neocomplete#force_overwrite_completefunc         = 1
let g:neocomplete_enable_fuzzy_completion_start_length = 2
let g:neocomplete_enable_camel_case_completion         = 0
let g:neocomplete#enable_auto_delimiter                = 1
let g:neocomplete#max_list                             = 10

let g:neocomplete#sources#dictionary#dictionaries = { 'default' : '' }
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif

let g:neocomplete#keyword_patterns['default'] = '\h\w*'

if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\|\h\w*::\|\(new\|use\|extends\|implements\)\s'
let g:neocomplete#sources#omni#input_patterns.c = 
          \ '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = 
          \ '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.ruby =
          \ '[^. *\t]\.\h\w*\|\h\w*::'

if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#force_omni_input_patterns.javascript = '[^. \t]\.\w*'

"easy tags
let g:easytags_file = expand('$XDG_CACHE_HOME/vim/tags/') . substitute(getcwd(),'/','%', 'g').'.tags'

" let g:easytags_dynamic_files        = 2
let g:easytags_auto_update            = 1 
let g:easytags_auto_highlight         = 1 
let g:easytags_include_members        = 1 
let g:easytags_dynamic_files          = 1 
let g:easytags_autorecurse            = 0 
let g:easytags_suppress_report        = 1 
let g:easytags_suppress_ctags_warning = 1 
let g:easytags_async                  = 1 
let g:easytags_resolve_links          = 1 
let g:easytags_syntax_keyword         = 'always'
let g:easytags_on_cursorhold          = 1 
let g:easytags_always_enabled         = 1 
"let g:easytags_events                 = ['BufWritePost', 'BufReadPost']

if len(matchstr(getcwd(), '^'.$HOME)) > 0 
  if getcwd() !=# $HOME
      let g:easytags_autorecurse = 1 
  endif
endif


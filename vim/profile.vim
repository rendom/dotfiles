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
set cursorline

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

" unite {{{2
 let g:unite_source_buffer_time_format = "%Y-%m-%d %H:%M:%S "
 let g:unite_source_grep_command       = 'ag'
 let g:unite_source_grep_default_opts  = '--nocolor --follow --nogroup --column'
  let g:unite_source_find_default_opts  = '-L'
  let g:unite_source_rec_async_command  = 'ag --follow --nocolor --nogroup --column -g ""'
let g:unite_source_grep_recursive_opt = ''

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#custom#profile('default', 'context', {
            \    'start_insert': 1,
            \    'direction': 'botright',
            \    'auto_size': 1
            \ })
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

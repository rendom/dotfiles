let mapleader = "\<space>"
nnoremap <space> <nop>

filetype plugin indent on

colorscheme hybrid
set background=dark

syntax enable
syntax sync fromstart
syntax sync clear
syntax sync minlines=0
syntax sync maxlines=256


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
set synmaxcol=120
set colorcolumn=80,120

set noesckeys
set ttimeout
set ttimeoutlen=50

set laststatus=2

set nocompatible
set relativenumber
set nocursorline
set lazyredraw

set list "show non-printing chars

" no lagg :O
set re=1

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


" foldstuff
set foldmethod=syntax
set foldenable
set foldlevel=100
let g:vimsyn_folding='af'

" php hax
let g:php_folding=1
let g:php_sql_query=0






"ultisnips
let g:UltiSnipsDontReverseSearchPath = 1
let g:UltiSnipsSnippetDirectories    = ["UltiSnips", "snips"]
let g:UltiSnipsExpandTrigger         = "<C-l>"
let g:UltiSnipsJumpForwardTrigger    = "<C-l>"
let g:UltiSnipsJumpBackwardTrigger   = "<C-h>"
let g:UltiSnipsUsePythonVersion      = 3



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
let g:unite_source_rec_async_command   =  [
            \ 'ag',
            \ '--follow',
            \ '--nocolor',
            \ '--nogroup',
            \ '--column',
            \ '-g',
            \ '',
            \ ]

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
"let g:neomake_go_checkers = ['golint', 'govet', 'errcheck']


let g:formatdef_custom_cpp = '"astyle
            \ -A10
            \ -S
            \ -N
            \ -w
            \ -Y
            \ -H
            \ -m0
            \ -xC78
            \ -xL
            \ -p
            \ -U
            \ -k3
            \ -W3
            \ -j
            \ -c
            \ -xy
            \ -xp
            \ -xw
            \ -xW
            \ -xy
            \ -w
            \ -Y
            \ -q
            \ -z2
            \ -f"'
let g:formatters_cpp = ['custom_cpp']
let g:formatters_c   = ['custom_cpp']
let g:formatters_java   = ['custom_cpp']

let g:formatdef_custom_javascript = '"js-beautify
            \ --type js
            \ -i
            \ -j
            \ --brace-style=collapse
            \ -k
            \ -x
            \ -X
            \ -w 78
            \ -f -"'
let g:formatters_javascript = ['custom_javascript']

let g:formatdef_custom_css = '"js-beautify
            \ --type css
            \ -i
            \ -j
            \ --brace-style=collapse
            \ -k
            \ -x
            \ -w 78
            \ -f -"'
let g:formatters_css = ['custom_css']

let g:formatdef_custom_html = '"js-beautify
            \ --type html
            \ -i
            \ -I
            \ -S
            \ -j
            \ --brace-style=collapse
            \ -k
            \ -x
            \ -w 78
            \ -f -"'
let g:formatters_html = ['custom_html']
let g:formatters_eruby  = ['custom_html']

let g:formatdef_custom_perl = '"perltidy
            \ -l=78
            \ -i=4
            \ -cti=0
            \ -pt=2
            \ -sbt=2
            \ -ci=2
            \ -nsfs
            \ -nsak=*
            \ -ce
            \ -sbl
            \ -asbl
            \ -vt=0
            \ -sot
            \ -cab=0
            \ -wba=.
            \ -boc
            \ -bbs
            \ -bbb
            \ -mbl=1"'
let g:formatters_perl = ['custom_perl']

let g:formatdef_custom_json = '"jq -M \".\""'
let g:formatters_json = ['custom_json']

let g:formatdef_custom_ruby = '"rbeautify -s -c 4"'
let g:formatters_ruby = ['custom_ruby']
" "Neocomplete
" let g:neocomplete#enable_at_startup                    = 1
" let g:neocomplete#enable_smart_case                    = 1
" let g:neocomplete#sources#syntax#min_keyword_length    = 3
" let g:neocomplete#lock_buffer_name_pattern             = '\*ku\*'
" let g:neocomplete#enable_fuzzy_completion              = 1
" let g:neocomplete#enable_auto_select                   = 0
" let g:neocomplete#force_overwrite_completefunc         = 1
" let g:neocomplete_enable_fuzzy_completion_start_length = 2
" let g:neocomplete_enable_camel_case_completion         = 0
" let g:neocomplete#enable_auto_delimiter                = 0
" let g:neocomplete#max_list                             = 10
" 
" let g:neocomplete#sources#dictionary#dictionaries = { 'default' : '' }
" if !exists('g:neocomplete#keyword_patterns')
"   let g:neocomplete#keyword_patterns = {}
" endif
" 
" let g:neocomplete#keyword_patterns['default'] = '\h\w*'
" 
" if !exists('g:neocomplete#sources#omni#input_patterns')
"   let g:neocomplete#sources#omni#input_patterns = {}
" endif
" 
" "let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\|\h\w*::\|\(new\|use\|extends\|implements\)\s'
" let g:neocomplete#sources#omni#input_patterns.c = 
"           \ '[^.[:digit:] *\t]\%(\.\|->\)'
" let g:neocomplete#sources#omni#input_patterns.cpp = 
"           \ '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
" let g:neocomplete#sources#omni#input_patterns.ruby =
"           \ '[^. *\t]\.\h\w*\|\h\w*::'
" 
" if !exists('g:neocomplete#force_omni_input_patterns')
"   let g:neocomplete#force_omni_input_patterns = {}
" endif
" 
" let g:neocomplete#force_omni_input_patterns.javascript = '[^. \t]\.\w*'

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


if has("macunix")
  let g:quickfixsigns_classes = ['qfl', 'loc', 'marks', 'breakpoints']
  let g:vvt_browser_command = 'echo "%URL%" | pbcopy'
  function! CopyShit(line1, line2)
    let foo = getline(a:line1, a:line2)
    let ret = system('pbcopy', foo)
  endfunction

  command! -range CopyShit <line1>,<line2>call SourceRange()
else
  let g:vvt_browser_command = 'echo "%URL%" | xclip'
endif

let g:choosewin_overlay_enable = 1
let g:choosewin_color_overlay = {
            \ 'gui'   : ['blue', 'blue' ],
            \ 'cterm' : [ 'blue', 'blue' ]
            \}
let g:choosewin_color_overlay_current = {
            \ 'gui'   : ['red', 'red' ],
            \ 'cterm' : [ 'red', 'red' ]
            \}
let g:choosewin_color_land = {
            \ 'gui'   : ['yellow', 'yellow' ],
            \ 'cterm' : [ 'yellow', 'yellow' ]
            \}
let g:choosewin_overlay_enable          = 1
let g:choosewin_overlay_clear_multibyte = 1
let g:choosewin_blink_on_land           = 0 " dont' blink at land
let g:choosewin_statusline_replace      = 0 " don't replace statusline
let g:choosewin_tabline_replace         = 0 " don't replace tabline


function! MyOnCompleteDone() " {{{2
    if !exists('v:completed_item') || empty(v:completed_item)
        return
    endif

    let complete_str = v:completed_item.word
    if complete_str ==# ''
        return
    endif

    let abbr = v:completed_item.menu
    let startIdx = match(abbr,'(')
    let endIdx = match(abbr,')')
    if endIdx - startIdx > 1
        echo v:completed_item.menu
    endif
endfunction

autocmd CompleteDone * call MyOnCompleteDone()


if has('unnamedplus')
    set clipboard=unnamedplus,unnamed
else
    set clipboard+=unnamed
endif

let g:bl_no_autoupdate = 1
let g:bl_pagefiletypes = []


" build makefile
nnoremap <F5> :<C-U>make<CR>

" pls... fu
highlight htmlItalic term=NONE cterm=NONE gui=NONE

" Background fu
hi Normal ctermbg=none
highlight NonText ctermbg=none


" neomake {{{2
let s:num_cores = substitute(system('nproc'), "\n", '', 'g')
let s:compile_commands = ''

if filereadable(getcwd() . '/Makefile')
            \ || filereadable(getcwd() . '/CMakeLists.txt')

    let s:compile_commands = system(
                \ 'ag ' .
                \ getcwd() . ' ' .
                \ '-Uu ' .
                \ '--follow ' .
                \ '--nocolor ' .
                \ '--nogroup ' .
                \ '-g compile_commands.json ' .
                \ '| head -n 1 | tr -d "\n"')
endif

let g:neomake_place_signs = 0
let g:neomake_airline = 1
let g:neomake_verbose = 0
let g:neomake_echo_current_error = 1

let g:neomake_serialize = 0
let g:neomake_serialize_abort_on_error = 0

let g:neomake_cpp_cppcheck_maker = {
            \ 'exe': 'cppcheck',
            \ 'args': [
            \       '-j ' . s:num_cores,
            \       ' --enable=all',
            \       ' --inconclusive'
            \ ],
            \ 'append_file': 1,
            \ 'postprocess': function('functions#setWarningType'),
            \ 'errorformat':
            \   '[%f:%l] -> [%s]: (%trror) %m,'.
            \   '[%f:%l] -> [%s]: (%tarning) %m,'.
            \   '[%f:%l] -> [%s]: (%ttyle) %m,'.
            \   '[%f:%l] -> [%s]: (%terformance) %m,'.
            \   '[%f:%l] -> [%s]: (%tortability) %m,'.
            \   '[%f:%l] -> [%s]: (%tnformation) %m,'.
            \   '[%f:%l] -> [%s]: (%tnconclusive) %m,'.
            \   '[%f:%l]: (%trror) %m,'.
            \   '[%f:%l]: (%tarning) %m,'.
            \   '[%f:%l]: (%ttyle) %m,'.
            \   '[%f:%l]: (%terformance) %m,'.
            \   '[%f:%l]: (%tortability) %m,'.
            \   '[%f:%l]: (%tnformation) %m,'.
            \   '[%f:%l]: (%tnconclusive) %m,'.
            \   '%-G%.%#'
            \ }

let g:neomake_cpp_cpplint_maker = {
            \ 'exe': 'cpplint.py',
            \ 'errorformat': '%f:%l:  %m [%t],%-G%.%#',
            \ 'postprocess': function('functions#setWarningType'),
            \ 'args': [
            \       '--filter=-whitespace,-legal/copyright,-readability/utf8'
            \   ]
            \ }

let g:neomake_cpp_clang_maker = {
            \ 'exe': 'clang++',
            \ 'postprocess': function('functions#setWarningType'),
            \ }

let g:neomake_c_clang_maker = {
            \ 'exe': 'clang',
            \ 'postprocess': function('functions#setWarningType'),
            \ }

let g:neomake_c_clangcheck_maker = {
            \ 'exe': 'clang-check',
            \ 'postprocess': function('functions#setWarningType'),
            \ }

let g:neomake_c_clangtidy_maker = {
            \ 'exe': 'clang-tidy',
            \ 'postprocess': function('functions#setWarningType'),
            \ }

let g:neomake_cpp_clangcheck_maker = g:neomake_c_clangcheck_maker
let g:neomake_cpp_clangtidy_maker = g:neomake_c_clangtidy_maker

let g:neomake_c_enabled_makers = [
            \ 'clangcheck',
            \ 'clangtidy',
            \ 'clang',
            \ ]

let g:neomake_cpp_enabled_makers = [
            \ 'cppcheck',
            \ 'cpplint',
            \ 'clangcheck',
            \ 'clangtidy',
            \ 'clang',
            \ ]

let g:neomake_c_clang_args = [
            \ '-std=c11',
            \ '-fsyntax-only',
            \ '-Wall'
            \ ]

let g:neomake_c_clangtidy_args = [
            \ '-extra-arg=-std=c11',
            \ '-checks="*"'
            \ ]

let g:neomake_c_clangcheck_args = [
            \ '-extra-arg=-std=c11'
            \ ]

let g:neomake_cpp_clang_args = [
            \ '-std=c++14',
            \ '-fsyntax-only',
            \ '-Wall'
            \ ]

let g:neomake_cpp_clangcheck_args = [
            \ '-extra-arg=-std=c++14'
            \ ]

let g:neomake_cpp_clangtidy_args = [
            \ '-checks="*"',
            \ '-extra-arg=-std=c++14'
            \ ]

if s:compile_commands !=# ''
    let s:arg = [ '-p=' . fnamemodify(s:compile_commands, ':h') ]

    let g:neomake_c_clangcheck_args += s:arg
    let g:neomake_c_clangtidy_args += s:arg

    let g:neomake_cpp_clangcheck_args += s:arg
    let g:neomake_cpp_clangtidy_args += s:arg
else
    if filereadable(getcwd() . '/.clang')
        let s:cfile = split(system('cat "' . getcwd() . '/.clang"'), '\n')

        for s:arg in s:cfile
            let s:escarg = escape(s:arg, ' ')
            let s:extarg = [ '-extra-arg=' . s:escarg ]

            let g:neomake_c_clang_args += [ s:escarg ]
            let g:neomake_cpp_clang_args += [ s:escarg ]

            let g:neomake_c_clangcheck_args += s:extarg
            let g:neomake_c_clangtidy_args += s:extarg

            let g:neomake_cpp_clangcheck_args += s:extarg
            let g:neomake_cpp_clangtidy_args += s:extarg
        endfor
    endif
endif

let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_ruby_enabled_makers = ['rubocop', 'mri']

let g:neomake_perl_perlcritic_maker = {
            \ 'exe': 'perlcritic',
            \ 'errorformat': '%t:%f:%l:%c:%m',
            \ 'postprocess': function('functions#setWarningType'),
            \ 'append_file': 0,
            \ 'args': [
            \   '%:p',
            \   '--quiet',
            \   '--nocolor',
            \   '--verbose',
            \   '\\%s:\\%f:\\%l:\\%c:(\\%s) \\%m (\\%e)\\n'
            \ ]
            \ }

let g:neomake_perl_perl_maker = {
            \ 'exe': 'perl',
            \ 'postprocess': function('functions#setWarningType'),
            \ 'errorformat':
            \   '%-G%.%#had compilation errors.,'.
            \   '%-G%.%#syntax OK,'.
            \   '%m at %f line %l%.%#',
            \ 'args': [ '-c' ]
            \ }

let g:neomake_perl_enabled_makers = [
            \ 'perlcritic',
            \ 'perl'
            \ ]

if filereadable(getcwd() . '/build.gradle')
    let g:neomake_java_javac_autoload_maven_classpath = 0
    let g:neomake_java_javac_autoload_gradle_classpath = 0
    let g:neomake_java_javac_autoload_eclipse_classpath = 0

    let g:JavaComplete_GradleExecutable = 'dontusetheirbrokenshit'

    let $CLASSPATH .= ':' . functions#generateClassPath()

    let g:JavaComplete_MavenRepositoryDisable = 1
    let g:JavaComplete_LibsPath = $CLASSPATH
    let g:neomake_java_javac_classpath = $CLASSPATH
endif
" 2}}}


" quickfixsigns {{{2
let g:quickfixsigns_classes = ['qfl', 'vcsdiff', 'loc', 'marks' ]
let g:quickfixsigns_events = [
            \ 'BufEnter',
            \ 'BufWinEnter',
            \ 'BufWritePost',
            \ 'BufReadPost',
            \ 'InsertLeave',
            \ 'InsertEnter',
            \ 'CursorHold',
            \ 'CursorHoldI',
            \ 'CursorMoved',
            \ 'CursorMovedI',
            \ 'QuickFixCmdPost',
            \ ]

let g:quickfixsigns_class_qfl = {
            \ 'sign': '*s:QflSign',
            \ 'get': 'functions#getQFList(%s)',
            \ 'event': g:quickfixsigns_events,
            \ 'level': 8,
            \ 'scope': 'vim'
            \ }

let g:quickfixsigns_class_loc = {
            \ 'sign': '*s:LocSign',
            \ 'get': 'functions#getLocList(%s)',
            \ 'event': g:quickfixsigns_events,
            \ 'level': 7,
            \ }

exec 'sign define QFS_QFL text=ii texthl=InfoMarker'
exec 'sign define QFS_QFL_W text=ww texthl=WarningMarker'
exec 'sign define QFS_QFL_E text=!! texthl=ErrorMarker'

exec 'sign define QFS_LOC text=ii texthl=InfoMarker'
exec 'sign define QFS_LOC_W text=ww texthl=WarningMarker'
exec 'sign define QFS_LOC_E text=!! texthl=ErrorMarker'

exec 'sign define QFS_VCS_ADD text=+ texthl=QFS_ADD'
exec 'sign define QFS_VCS_DEL text=- texthl=QFS_DEL'
exec 'sign define QFS_VCS_CHANGE text=~ texthl=QFS_CHANGE'

"let g:quickfixsigns#marks#texthl = 'User5'
let g:quickfixsigns#marks#buffer = split('abcdefghijklmnopqrstuvwxyz', '\zs')

let g:quickfixsigns#vcsdiff#highlight = {
            \ 'ADD': 'QFS_ADD',
            \ 'DEL': 'QFS_DEL',
            \ 'CHANGE': 'QFS_CHANGE',
            \ }

let g:quickfixsigns#marks#texthl = 'QFS_MARKS'
" 2}}}


" deoplete {{{2
let g:deoplete#enable_at_startup = 1

let g:deoplete#auto_completion_start_length = 2
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#auto_complete_delay = 50

try
    call deoplete#custom#set('_', 'converters', ['converter_remove_paren'])
    call deoplete#custom#set('_', 'sorters', ['sorter_word', 'default'])
catch
endtry

let g:deoplete#delimiters = ['/', '.', '::', ':', '#', '->']

" deoplete-clang
let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'

let s:clang = substitute(
            \ system('clang --version'), 
            \ '.*version \([0-9.]\+\).*', '\1', '')

let g:deoplete#sources#clang#clang_header = 
            \ '/usr/lib/clang/' . s:clang . '/include'

let g:deoplete#sources#clang#sort_algo = 'priority'
let g:deoplete#sources#clang#std#c = 'c11'
let g:deoplete#sources#clang#std#cpp = 'c++14'

let g:deoplete#enable_debug = 0
let g:deoplete#sources#clang#debug#log_file = '~/deoplete-clang.log'

" Define keyword
if !exists('g:deoplete#keyword_patterns')
    let g:deoplete#keyword_patterns = {}
endif

" compile_commands.json directory path
" Not file path. Need build directory path
if s:compile_commands !=# ''
    let g:deoplete#sources#clang#clang_complete_database = 
                \ fnamemodify(s:compile_commands, ':h')
endif
" 2}}}

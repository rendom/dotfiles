call plug#begin('~/.vim/bundle')

"NeoBundle 'mhinz/vim-signify'
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh --clang-completer --system-libclang' }
"Plug 'szw/vim-ctrlspace'
"Plug 'vim-scripts/cSyntaxAfter'
Plug 'scrooloose/syntastic'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tomtom/quickfixsigns_vim'
Plug 'talek/obvious-resize'
Plug 'bling/vim-airline'
Plug 'c0r73x/vimdir.vim'
Plug 'dockyard/vim-easydir'
Plug 'rendom/vvt.nu-vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'rking/ag.vim'
Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'
Plug 't9md/vim-choosewin'
Plug 'editorconfig/editorconfig-vim'
Plug 'kopischke/vim-fetch'

" Javascript
Plug 'marijnh/tern_for_vim', {
            \ 'for' : ['javascript'],
            \ 'do' : 'npm install'
            \ }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }

"webdev
"NeoBundle 'skammer/vim-css-color'  " breaks html?
Plug 'hail2u/vim-css3-syntax', { 'for': ['css', 'less'] }
Plug 'groenewege/vim-less', { 'for': ['less'] }
Plug 'digitaltoad/vim-jade', { 'for': ['jade'] }
Plug 'vim-scripts/HTML-AutoCloseTag', { 'for': ['html'] }
Plug 'mattn/emmet-vim', { 'for': ['html'] }
Plug 'xsbeats/vim-blade', { 'for': ['blade', 'php']}

Plug 'markwu/vim-laravel4-snippets', { 'for': 'php' }

"Golang
Plug 'fatih/vim-go', { 'for': ['go'] }

"Unite
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }

if has("unix")
	let s:uname = system("uname")
	if s:uname != "Darwin\n"
        let g:vvt_browser_command = 'echo "%URL%" | xclip'
	endif
endif

" Required:
filetype plugin indent on

call plug#end()

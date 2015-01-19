if has('vim_starting')
	" Be iMproved
	set nocompatible

	" Required:
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

NeoBundle 'Valloric/YouCompleteMe', {
			\ 'build' : {
			\    'unix' : './install.sh --clang-completer --system-libclang',
			\    'cygwin' : './install.sh --clang-completer --system-libclang',
			\   },
			\ }

NeoBundle 'marijnh/tern_for_vim', {
			\ 'build' : {
			\     'cygwin' : 'npm install',
			\     'unix' : 'npm install'
			\    },
			\ }


NeoBundle 'pangloss/vim-javascript'
NeoBundle 'szw/vim-ctrlspace'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'honza/vim-snippets'
"NeoBundle 'mhinz/vim-signify'
NeoBundle 'tomtom/quickfixsigns_vim'
NeoBundle 'talek/obvious-resize'
NeoBundle 'bling/vim-airline'
NeoBundle 'xsbeats/vim-blade'
NeoBundle 'c0r73x/vimdir.vim'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'dockyard/vim-easydir'
NeoBundle 'rendom/vvt.nu-vim'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'rking/ag.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'vim-scripts/HTML-AutoCloseTag'
"NeoBundle 'sheerun/vim-polyglot'

"css stuff
"NeoBundle 'skammer/vim-css-color'  " breaks html?
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'groenewege/vim-less'
NeoBundle 'fatih/vim-go'

"Unite
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc.vim'

NeoBundle 'mbbill/undotree'

NeoBundle 't9md/vim-choosewin'

if has("unix")
	let s:uname = system("uname")
	if s:uname != "Darwin\n"
        let g:vvt_browser_command = 'echo "%URL%" | xclip'
	endif
endif

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck



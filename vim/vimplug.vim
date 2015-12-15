call plug#begin('~/.vim/bundle')

"Plug 'vim-scripts/cSyntaxAfter'
Plug 'xolox/vim-misc'
Plug 'Shougo/neocomplete.vim'
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
"Plug 'tpope/vim-fugitive'
Plug 'jreybert/vimagit'
Plug 'sheerun/vim-polyglot'
Plug 't9md/vim-choosewin'
Plug 'editorconfig/editorconfig-vim'
Plug 'kopischke/vim-fetch'
Plug 'tpope/vim-surround'
"Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-repeat'
Plug 'drmikehenry/vim-fixkey'
Plug 'scrooloose/nerdtree', { 'on' : 'NERDTreeToggle' }
Plug 'Chiel92/vim-autoformat', { 'on' : 'Autoformat' }
Plug 'AndrewRadev/linediff.vim'
Plug 'justmao945/vim-clang', { 'for' : ['c', 'cpp'] }
Plug 'derekwyatt/vim-fswitch', { 'for' : ['c', 'cpp'] }
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-eunuch'
Plug 'ironhouzi/vim-stim'
Plug 'rstacruz/vim-closer'
"Plug 'tpope/vim-sleuth'
Plug 'fboender/bexec'
Plug 'jaxbot/browserlink.vim', { 'for' : ['javascript'] }

" Javascript
Plug 'marijnh/tern_for_vim', {
            \ 'for' : ['javascript'],
            \ 'do' : 'npm install'
            \ }
Plug 'maksimr/vim-jsbeautify', { 'for': 'javascript' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'js' }


"webdev
Plug 'hail2u/vim-css3-syntax', { 'for': ['css', 'less'] }
Plug 'groenewege/vim-less', { 'for': ['less'] }
Plug 'digitaltoad/vim-jade', { 'for': ['jade'] }
Plug 'vim-scripts/HTML-AutoCloseTag', { 'for': ['html', 'php'] }
Plug 'mattn/emmet-vim', { 'for': ['html'] }

"PHP
Plug 'captbaritone/better-indent-support-for-php-with-html', { 'for': 'php' }
Plug 'markwu/vim-laravel4-snippets', { 'for': 'php' }
Plug 'shawncplus/phpcomplete.vim', { 'for': 'php' }
"Plug 'mattn/emmet-vim', { 'for': ['html', 'php', 'css', 'less'] }
"Plug 'mkusher/padawan.vim', { 'for': ['php'] }


"Golang
Plug 'fatih/vim-go', { 'for': ['go'] }

"Unite
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }

if has("unix")
        let s:uname = system("uname")
        if s:uname != "Darwin\n"
                Plug 'xolox/vim-easytags'
                let g:vvt_browser_command = 'echo "%URL%" | xclip'
        endif
endif

" Required:
filetype plugin indent on

call plug#end()

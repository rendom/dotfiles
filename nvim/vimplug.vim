call plug#begin('~/.config/nvim/bundle')

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

Plug 'mhinz/vim-startify'
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'zchee/deoplete-go', { 'for' : 'go', 'do': 'make'}
Plug 'zchee/deoplete-clang', { 'for' : ['c', 'cpp'] }
Plug 'flazz/vim-colorschemes'
Plug 'pbogut/deoplete-padawan'
"Plug 'vim-scripts/cSyntaxAfter'
Plug 'xolox/vim-misc'
"Plug 'Shougo/neocomplete.vim'
"Plug 'scrooloose/syntastic'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tomtom/quickfixsigns_vim'
Plug 'talek/obvious-resize'
"Plug 'bling/vim-airline'
Plug 'c0r73x/vimdir.vim'
Plug 'dockyard/vim-easydir'
Plug 'rendom/vvt.nu-vim'
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
Plug 'scrooloose/nerdtree', { 'on' : 'NERDTreeToggle' }
Plug 'Chiel92/vim-autoformat', { 'on' : 'Autoformat' }
Plug 'AndrewRadev/linediff.vim'
Plug 'derekwyatt/vim-fswitch', { 'for' : ['c', 'cpp'] }
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-eunuch'
Plug 'ironhouzi/vim-stim'
Plug 'rstacruz/vim-closer'
"Plug 'tpope/vim-sleuth'
Plug 'fboender/bexec'
Plug 'jaxbot/browserlink.vim', { 'for' : ['javascript'] }
Plug 'wellle/visual-split.vim'
"Plug 'phpfmt/vim-phpfmt', { 'for' : ['php'] }
Plug 'junegunn/vim-peekaboo'

Plug 'neomake/neomake'
"Plug 'gilligan/vim-lldb'

" Javascript
Plug 'marijnh/tern_for_vim', {
            \ 'for' : ['javascript'],
            \ 'do' : 'npm install'
            \ }
Plug 'maksimr/vim-jsbeautify', { 'for': 'javascript' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'js' }
Plug 'posva/vim-vue'

"webdev
Plug 'hail2u/vim-css3-syntax', { 'for': ['css', 'less'] }
Plug 'groenewege/vim-less', { 'for': ['less'] }
Plug 'digitaltoad/vim-jade', { 'for': ['jade'] }
Plug 'vim-scripts/HTML-AutoCloseTag', { 'for': ['html', 'php'] }
Plug 'mattn/emmet-vim', { 'for': ['html'] }

"PHP
Plug 'captbaritone/better-indent-support-for-php-with-html', { 'for': 'php' }
Plug 'markwu/vim-laravel4-snippets', { 'for': 'php' }
"Plug 'shawncplus/phpcomplete.vim', { 'for': 'php' }
"Plug 'mattn/emmet-vim', { 'for': ['html', 'php', 'css', 'less'] }
"Plug 'mkusher/padawan.vim', { 'for': ['php'] }
Plug 'konfekt/fastfold'
Plug 'johnsyweb/vim-makeshift'


"Golang
Plug 'fatih/vim-go', { 'for': ['go'] }

"Unite
"Plug 'Shougo/unite.vim'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Shougo/denite.nvim', { 'do': function('DoRemote') }


" Statusline
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'

Plug 'xolox/vim-easytags'

if has("unix")
        let s:uname = system("uname")
        if s:uname != "Darwin\n"
                let g:vvt_browser_command = 'echo "%URL%" | xclip'
        endif
endif

" Required:
filetype plugin indent on

call plug#end()

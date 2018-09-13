call plug#begin('~/.config/nvim/bundle')

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

Plug 'mhinz/vim-startify'

Plug 'DougBeney/pickachu'

" Plug 'roxma/nvim-completion-manager'
" Plug 'roxma/nvim-cm-tern',  {'do': 'npm install'}
" Plug 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': 'bash install.sh',
"     \ }
"Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
"Plug 'zchee/deoplete-go', { 'for' : 'go', 'do': 'make'}
"Plug 'zchee/deoplete-clang', { 'for' : ['c', 'cpp'] }
"Plug 'roxma/ncm-phpactor'
" Plug 'roxma/LanguageServer-php-neovim',  {'do': 'composer install && composer run-script parse-stubs'}

" Plug 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': 'bash install.sh',
"     \ }

"Plug 'phpactor/phpactor' ,  {'do': 'composer install'}
"Plug 'kristijanhusak/deoplete-phpactor'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }


" coc.nvim
" Plug 'neoclide/coc.nvim', {'do': 'yarn install'}

"NCM2
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-ultisnips'
Plug 'ncm2/ncm2-vim'
Plug 'ncm2/ncm2-vim', { 'for' : 'vim' } | Plug 'Shougo/neco-vim', { 'for' : 'vim' }
Plug 'roxma/LanguageServer-php-neovim',  {'do': 'composer install && composer run-script parse-stubs'}

"ncm2 phpactor
Plug 'phpactor/phpactor' ,  {'do': 'composer install', 'for': 'php'}
Plug 'phpactor/ncm2-phpactor'

"Languageserver
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }



Plug 'flazz/vim-colorschemes'
"Plug 'vim-scripts/cSyntaxAfter'
Plug 'xolox/vim-misc'
"Plug 'Shougo/neocomplete.vim'
"Plug 'scrooloose/syntastic'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
"Plug 'tomtom/quickfixsigns_vim'
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
" Plug 'tpope/vim-surround'
Plug 'machakann/vim-sandwich'
"Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-repeat'
Plug 'scrooloose/nerdtree', { 'on' : 'NERDTreeToggle' }
Plug 'Chiel92/vim-autoformat', { 'on' : 'Autoformat' }
Plug 'AndrewRadev/linediff.vim'
Plug 'derekwyatt/vim-fswitch', { 'for' : ['c', 'cpp'] }
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-eunuch'
Plug 'ironhouzi/vim-stim'
" Plug 'rstacruz/vim-closer'
"Plug 'tpope/vim-sleuth'
Plug 'wellle/visual-split.vim'
Plug 'junegunn/vim-peekaboo'

"Plug 'neomake/neomake'
"Plug 'benjie/neomake-local-eslint.vim'
"Plug 'gilligan/vim-lldb'
Plug 'w0rp/ale'
"Plug 'chrisbra/csv.vim', { 'for': ['csv'] }

Plug 'metakirby5/codi.vim'
Plug 'janko-m/vim-test'

"Plug 'tenfyzhong/CompleteParameter.vim'

" Javascript

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
"Plug 'StanAngeloff/php.vim'
" Plug 'joonty/vim-phpqa', { 'for' : 'php' }

Plug 'konfekt/fastfold'
Plug 'johnsyweb/vim-makeshift'

Plug 'AndrewRadev/splitjoin.vim'

Plug 'jparise/vim-graphql', { 'for' : ['graphql'] }


"Golang
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

"Unite
"Plug 'Shougo/unite.vim'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Shougo/denite.nvim', { 'do': function('DoRemote') }


" Statusline
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'

" Plug 'osyo-manga/vim-anzu'

Plug 'xolox/vim-easytags'
Plug 'hecal3/vim-leader-guide'


if has("unix")
        let s:uname = system("uname")
        if s:uname != "Darwin\n"
                let g:vvt_browser_command = 'echo "%URL%" | xclip'
        else
            " Plug 'roxma/LanguageServer-php-neovim',  {'do': 'composer install && composer run-script parse-stubs'}
            "Plug 'phpactor/phpactor' ,  {'do': 'composer install'}
            Plug 'roxma/ncm-phpactor'
            Plug 'roxma/LanguageServer-php-neovim',  {'do': 'composer install && composer run-script parse-stubs'}


        endif
endif

" Required:
filetype plugin indent on

call plug#end()

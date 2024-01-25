let $PATH = '/opt/homebrew/bin/node:'.$PATH
set shell=/bin/sh
"let $PYTHONPATH='/usr/lib64/python2.7/site-packages/lldb'
let g:python_host_skip_check=1 
let g:python3_host_skip_check=1 
let g:python_host_prog = '/usr/local/bin/python3'
let g:node_host_prog = '/opt/homebrew/bin/node'

lua <<EOF
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
require('plugins')
EOF

"let g:loaded_netrwPlugin = 1
let g:loaded_matchit = 1


if $XDG_CACHE_HOME ==# ''
    let $XDG_CACHE_HOME=$HOME.'/.cache'
    let $XDG_CONFIG_HOME=$HOME.'/.config'
endif

set viminfo+=n$XDG_CACHE_HOME/vim/nviminfo

silent !mkdir -p $XDG_CACHE_HOME/vim/backup > /dev/null 2>&1
silent !mkdir -p $XDG_CACHE_HOME/vim/undo > /dev/null 2>&1
silent !mkdir -p $XDG_CACHE_HOME/vim/tags > /dev/null 2>&1
silent !mkdir -p $XDG_CACHE_HOME/vim/java > /dev/null 2>&1

let g:polyglot_disabled = ['go', 'vue', 'typescript', 'ts']

"jumphax
set iskeyword+=_,$,@,%,#

"global
set t_Co=256

set shell=/bin/zsh
set wildmenu
source $HOME/.config/nvim/vimplug.vim
source $HOME/.config/nvim/functions.vim
source $HOME/.config/nvim/profile.vim
source $HOME/.config/nvim/denite.vim
"source $HOME/.config/nvim/ddu.vim
source $HOME/.config/nvim/mappings.vim
source $HOME/.config/nvim/autocmd.vim
"source $HOME/.config/nvim/coc.vim
source $HOME/.config/nvim/treesitter.vim
"source $HOME/.config/nvim/ncm.vim

set backupdir=$XDG_CACHE_HOME/vim/backup//
set undodir=$XDG_CACHE_HOME/vim/undo//
set directory=$XDG_CACHE_HOME/vim//

set completeopt-=preview

lua <<EOF
require('init')
EOF

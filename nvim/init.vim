set shell=/bin/sh
let $PYTHONPATH='/usr/lib64/python2.7/site-packages/lldb'

if $XDG_CACHE_HOME ==# ''
    let $XDG_CACHE_HOME=$HOME.'/.cache'
    let $XDG_CONFIG_HOME=$HOME.'/.config'
endif

set viminfo+=n$XDG_CACHE_HOME/vim/nviminfo

silent !mkdir -p $XDG_CACHE_HOME/vim/backup > /dev/null 2>&1
silent !mkdir -p $XDG_CACHE_HOME/vim/undo > /dev/null 2>&1
silent !mkdir -p $XDG_CACHE_HOME/vim/tags > /dev/null 2>&1
silent !mkdir -p $XDG_CACHE_HOME/vim/java > /dev/null 2>&1

"jumphax
set iskeyword+=_,$,@,%,#

"global
set t_Co=256

set shell=/bin/zsh
set wildmenu
source $HOME/.config/nvim/vimplug.vim
source $HOME/.config/nvim/functions.vim
source $HOME/.config/nvim/profile.vim
source $HOME/.config/nvim/mappings.vim
source $HOME/.config/nvim/autocmd.vim

set backupdir=$XDG_CACHE_HOME/vim/backup//
set undodir=$XDG_CACHE_HOME/vim/undo//
set directory=$XDG_CACHE_HOME/vim//

set completeopt-=preview

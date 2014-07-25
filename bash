export EDITOR=vim
if [ -e /usr/share/terminfo/x/xterm-256color ]; then
	export TERM='xterm-256color'
else
	export TERM='xterm-color'
fi

alias ll='ls -al'
alias l='ll'
alias !='sudo '
alias ..='cd ..'
alias c='clear'
alias diff='colordiff'
alias top='htop'

# Git stuff
alias g='git'
alias g?='git status'
alias gc='git commit'

# :)
ponysay --quote

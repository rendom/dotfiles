# test
export EDITOR=vim
if [ -e /usr/share/terminfo/x/xterm-256color ]; then
	export TERM='xterm-256color'
else
	export TERM='xterm-color'
fi

alias ls='ls -LhFX --color=always --group-directories-first'
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
alias ga='git add'



# open todo
function openTodo(){
	if [ -e ./.todo.txt ]; then
		vim ./.todo.txt
	else
		vim ~/.todo.txt
	fi
}
alias todo=openTodo



# :)
ponysay --quote

#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#PS
PS1='\[\e[32;1m\][\u \[\e[34;1m\]\w\[\e[32;1m\]\[\e[35;1m\]$(git_branch)\[\e[32;1m\]]\n\[\e[32;1m\]>\[\e[00m\] '
PS2='\[\e[32;1m\]>\[\e[00m\] '

#aliases
alias ls='ls -lh --color=auto'
alias chrome='google-chrome-stable'

#PATH
export PATH=~/bin:$PATH

#completion
[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion



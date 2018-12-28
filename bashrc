#  _               _              
# | |__   __ _ ___| |__  _ __ ___ 
# | '_ \ / _` / __| '_ \| '__/ __|
# | |_) | (_| \__ \ | | | | | (__ 
# |_.__/ \__,_|___/_| |_|_|  \___|
#


# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# PS
PS1='\[\e[32;1m\][\u \[\e[34;1m\]\w\[\e[32;1m\]\[\e[35;1m\]$($HOME/scripts/bash/git_branch)\[\e[32;1m\]]\n\[\e[32;1m\]>\[\e[00m\] '
PS2='\[\e[32;1m\]>\[\e[00m\] '

# aliases
alias ls='ls -lh --color=auto'
alias chrome='google-chrome-stable'

# PATH
export PATH=~/bin:$PATH

# completion (working better without it ?)
[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion


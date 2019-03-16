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
alias ..='cd ..'
alias cp='rsync -ah --info=progress2'

# PATH
export PATH=~/bin:$PATH

# Colors
eval "$(dircolors -b ~/.dircolors)"

# Defaults
export EDITOR=/usr/bin/vim
export PAGER=/usr/bin/less
export BROWSER=/usr/bin/google-chrome-stable
export VISUAL=/usr/bin/vim

# completion (working better without it ?)
[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion

# ssh-agent
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > ~/.ssh-agent-thing
fi
if [[ ! "$SSH_AUTH_SOCK" ]]; then
    eval "$(<~/.ssh-agent-thing)" > /dev/null
fi

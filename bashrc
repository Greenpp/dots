#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#PS
PS1='\[\e[32;1m\][\[\e[31;1m\]$(is_sudo)\[\e[32;1m\]\u \[\e[34;1m\]\w\[\e[32;1m\]\[\e[35;1m\]$(git_branch)\[\e[32;1m\]]\n\[\e[32;1m\]>\[\e[00m\] '
PS2='\[\e[32;1m\]> '

#aliases
alias ls='ls -lh --color=auto'

#PATH
export PATH=~/bin:$PATH

#completion
[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion

#autostart xserver on login
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
	exec startx
fi


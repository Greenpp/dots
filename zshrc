#          _
#  _______| |__  _ __ ___
# |_  / __| '_ \| '__/ __|
#  / /\__ \ | | | | | (__
# /___|___/_| |_|_|  \___|
#

# History
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory nomatch notify

# Beep
unsetopt autocd beep extendedglob

# Mode
bindkey -e

# PATH
export PATH=$HOME/bin:/usr/local/bin:$HOME/scripts/bin:$PATH

# Oh-my-zsh
export ZSH="/home/jakub/.oh-my-zsh"

export ZSH_DISABLE_COMPFIX='true'
DISABLE_AUTO_UPDATE=true

# Theme
# Suppress console warning
POWERLEVEL9K_IGNORE_TERM_COLORS=true

# Font
POWERLEVEL9K_MODE='nerdfont-complete'

# Segments
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(user dir virtualenv vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(ssh background_jobs)

# Colors
POWERLEVEL9K_USER_DEFAULT_BACKGROUND='002'
POWERLEVEL9K_USER_DEFAULT_FOREGROUND='000'

POWERLEVEL9K_VCS_CLEAN_BACKGROUND='005'
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='000'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='005'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='000'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='005'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='000'

POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='004'
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='000'

POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND='006'
POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND='000'

POWERLEVEL9K_SSH_BACKGROUND='000'
POWERLEVEL9K_SSH_FOREGROUND='003'

# Multiline
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="└─>"

# Path truncate
POWERLEVEL9K_SHORTEN_STRATEGY='truncate_from_right'
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3

ZSH_THEME=powerlevel10k/powerlevel10k

HIST_STAMPS="dd.mm.yyyy"

# Plugins
plugins=(git colored-man-pages fzf virtualenv taskwarrior dirpersist django tmux)

source $ZSH/oh-my-zsh.sh

export MANPATH="/usr/local/man:$MANPATH"

# Fzf
export FZF_DEFAULT_COMMAND="fd --type file --follow --hidden --exclude .git --color=always"
export FZF_CTRL_T_COMMAND="fd . -d 1 --follow --hidden --exclude .git --color=always ./"
export FZF_DEFAULT_OPTS="--ansi \
--color=\
fg:-1,\
fg+:-1,\
bg:-1,\
bg+:0,\
hl:3,\
hl+:3,\
info:3,\
border:-1,\
prompt:3,\
pointer:3,\
marker:3,\
spinner:3,\
header:-1"

# Defaults
export EDITOR=/usr/bin/nvim
export PAGER=/usr/bin/less
export BROWSER=/usr/bin/google-chrome-stable
export VISUAL=/usr/bin/nvim

# Aliases
alias ls='ls -lh --color=auto'
alias chrome='google-chrome-stable'
alias cp='rsync -ah --info=progress2'
alias ytdl='youtube-dl'
alias sudo='sudo '
alias mp='ncmpcpp'
alias clock='tty-clock -sc'
alias ranger='ranger --choosedir=$HOME/.rangerdir; cd "$(cat $HOME/.rangerdir)"'
alias r='ranger'
alias v='nvim'
alias sv='sudo -E nvim'
alias sc='systemctl'

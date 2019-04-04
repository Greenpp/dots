#          _
#  _______| |__  _ __ ___
# |_  / __| '_ \| '__/ __|
#  / /\__ \ | | | | | (__
# /___|___/_| |_|_|  \___|
#

# history
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory nomatch notify

# beep
unsetopt autocd beep extendedglob

# mode
bindkey -e

# PATH
export PATH=$HOME/bin:/usr/local/bin:/opt/cuda/bin:$PATH

# oh-my-zsh
export ZSH="/home/jakub/.oh-my-zsh"

# theme

# font
POWERLEVEL9K_MODE='nerdfont-complete'

# segments
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(user dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(ssh background_jobs)

# colors
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

# multiline
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="└─>"

# path truncate
POWERLEVEL9K_SHORTEN_STRATEGY='truncate_from_right'
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3

ZSH_THEME=powerlevel10k/powerlevel10k

# CASE_SENSITIVE="true"
# HYPHEN_INSENSITIVE="true"
# DISABLE_AUTO_UPDATE="true"
# export UPDATE_ZSH_DAYS=13
# DISABLE_LS_COLORS="true"
# DISABLE_AUTO_TITLE="true"
# ENABLE_CORRECTION="true"
# COMPLETION_WAITING_DOTS="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"
# ZSH_CUSTOM=/path/to/new-custom-folder

HIST_STAMPS="dd.mm.yyyy"

# plugins
plugins=(git web-search colored-man-pages)

source $ZSH/oh-my-zsh.sh

export MANPATH="/usr/local/man:$MANPATH"

# Defaults
export EDITOR=/usr/bin/vim
export PAGER=/usr/bin/less
export BROWSER=/usr/bin/google-chrome-stable
export VISUAL=/usr/bin/vim

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# aliases
alias ls='ls -lh --color=auto'
alias chrome='google-chrome-stable'
alias cp='rsync -ah --info=progress2'
alias ytdl='youtube-dl'
alias sudo='sudo '
alias mp='ncmpcpp'
alias clock='tty-clock -sc'

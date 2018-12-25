"        _                    
" __   _(_)_ __ ___  _ __ ___ 
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__ 
"   \_/ |_|_| |_| |_|_|  \___|
"

" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'chrisbra/Colorizer'

call vundle#end()
filetype plugin indent on
" VundleEnd

" YouCompleteMe
let g:ycm_global_ycm_extra_conf = '/home/jakub/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'

" syntax
syntax on

" lines numeration
set number relativenumber

" split position
set splitbelow
set splitright

" theme
colo desert

" tab configuration
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab


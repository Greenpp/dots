"Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'

call vundle#end()
filetype plugin indent on
"VundleEnd

let g:ycm_global_ycm_extra_conf = '/home/jakub/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'

syntax on
set number relativenumber
set splitbelow
set splitright
colo desert
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab


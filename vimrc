"        _
" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|
"

set encoding=utf-8
" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Completion
Plugin 'Valloric/YouCompleteMe'

" Colors
Plugin 'chrisbra/Colorizer'
Plugin 'KabbAmine/vCoolor.vim'

" Bar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Git
Plugin 'tpope/vim-fugitive'

" File explorer
Plugin 'scrooloose/nerdtree'

call vundle#end()
filetype plugin indent on
" VundleEnd

" YouCompleteMe
" config
let g:ycm_global_ycm_extra_conf = '/home/jakub/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
" selection with enter
let g:ycm_key_list_stop_completion = ['<C-y>', '<CR>']
" interpreter
let g:ycm_path_to_python_interpreter = '/usr/bin/python'
" preview
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
" enable for all files
let g:ycm_filetype_blacklist = {}

" Nerdtree
map <C-n> :NERDTreeToggle<CR><Bar>:echo<CR>
let g:NERDTreeQuitOnOpen = 1

" Scripts
" remove trailing whitespaces on save
:autocmd BufWrite * :%s/\s\+$//e

" filetype
filetype on
filetype plugin on
autocmd BufNewFile,BufRead * if matchstr(execute('set syntax?'), '=$') != '' | set filetype=text | endif

" syntax
syntax on

" spellcheck
autocmd FileType gitcommit setlocal spell

" lines numeration
set number relativenumber

" split position
set splitbelow
set splitright

" theme
colo gruvbox
" dark version
set background=dark
" background opacity
hi Normal guibg=NONE ctermbg=NONE

" tab configuration
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" status bar
set laststatus=2
" Airline
let g:airline_theme='murmur'
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''


" formatting
set autoindent
filetype indent on
set linebreak

" search highlight
set hlsearch
" reset
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" searchin with #
nnoremap # mp*`p<Bar>:echo<CR>

" search selected in visual mode with #
vnoremap # ymp/\V<C-r>=escape(@",'/\')<CR><CR>`p<Bar>:echo<CR>

" search while typing
set incsearch

" resize splits after terminal resize
autocmd VimResized * wincmd =

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
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Gruvbox
Plugin 'morhetz/gruvbox'

" Start Page
Plugin 'mhinz/vim-startify'

" Bar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Git
Plugin 'tpope/vim-fugitive'

" File explorer
Plugin 'scrooloose/nerdtree'

" Icons
Plugin 'ryanoasis/vim-devicons'

" Sxhdk config syntax
Plugin 'baskerville/vim-sxhkdrc'

" Comments
Plugin 'scrooloose/nerdcommenter'

call vundle#end()
filetype plugin indent on
" VundleEnd

" VANILLA

syntax on
filetype on
set linebreak
" Command history
set history=1000
" Vim files load base on filetype
filetype plugin on

" Command completion
set wildmode=longest,full
set wildmenu

" Copy to clipboard and primary
set clipboard^=unnamedplus,unnamed

" Undo between sessions
set undofile
set undodir=~/.vim/undo

" Lines numeration
set number relativenumber
" Nonrelative numbers while typing commands
nnoremap : :set number norelativenumber<CR>:
autocmd CmdlineLeave * set number relativenumber

" Splits position
set splitbelow
set splitright
" Resize splits after window resize
autocmd VimResized * wincmd =

" Indentation
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
filetype indent on

" Status bar
set laststatus=2

" Vertical movement in broken line in normal mode
nnoremap <Up> gk
nnoremap <Down> gj

" Matching search highlight
set hlsearch
" Search while typing
set incsearch
" Highlight reset
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
" Search for word under cursor with #
nnoremap # mp*`p<Bar>:echo<CR>
" Search for selection with #
vnoremap # ymp/\V<C-r>=escape(@",'/\')<CR><CR>`p<Bar>:echo<CR>

" delete without yank
nnoremap x "_x
vnoremap x "_x

" Cursor
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[2 q"
let &t_EI = "\<Esc>[4 q"

" Autoclose
inoremap "" ""
inoremap " ""<left>
inoremap "<BS> <left><right>
inoremap "<CR> "<CR>"<ESC>O
inoremap '' ''
inoremap ' ''<left>
inoremap '<BS> <left><right>
inoremap '<CR> '<CR>'<ESC>O
inoremap """ """"""<left><left><left>
inoremap """<CR> """<CR>"""<ESC>O
inoremap () ()
inoremap ( ()<left>
inoremap (<BS> <left><right>
inoremap (<CR> (<CR>)<ESC>O
inoremap [] []
inoremap [ []<left>
inoremap [<BS> <left><right>
inoremap [<CR> [<CR>]<ESC>O
inoremap {} {}
inoremap { {}<left>
inoremap {<BS> <left><right>
inoremap {<CR> {<CR>}<ESC>O

" Remove trailing whitespaces on save
:autocmd BufWrite * :%s/\s\+$//e
" Filetype text for empty files
autocmd BufNewFile,BufRead * if matchstr(execute('set syntax?'), '=$') != '' | set filetype=text | endif
" Spellcheck in git commits
autocmd FileType gitcommit setlocal spell


" PLUGINS

" Nerdtree
map <silent> <C-n> :NERDTreeToggle<CR>
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeWinSize = 60

" Comments
let g:NERDSpaceDelims=1
let g:NERDDefaultAlign='left'
nnoremap <silent> <C-_> :call NERDComment(0, "toggle")<CR>
vnoremap <silent> <C-_> :call NERDComment(0, "toggle")<CR>

" Spelling suggestions with fzf
function! FzfSpellSink(word)
    exe 'normal! "_ciw'.a:word
endfunction
nnoremap <silent> z= :call fzf#run({'source': spellsuggest(expand('<cword>')),
                                   \'sink': function('FzfSpellSink'),
                                   \'right': '25%'})<CR>

" Airline
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" Airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" Theme
colo gruvbox
set background=dark
let g:gruvbox_contrast_dark='medium'
hi Normal guibg=NONE ctermbg=NONE


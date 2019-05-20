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

" Completion
Plugin 'Valloric/YouCompleteMe'

" LaTeX
Plugin 'lervag/vimtex'

" Language Client
Plugin 'w0rp/ale'

" Start Page
Plugin 'mhinz/vim-startify'

" Colors
" Plugin 'chrisbra/Colorizer'
" Plugin 'KabbAmine/vCoolor.vim'
Plugin 'ap/vim-css-color'
Plugin 'blindFS/vim-colorpicker'

" Bar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Git
Plugin 'tpope/vim-fugitive'

" File explorer
Plugin 'scrooloose/nerdtree'

" Icons
Plugin 'ryanoasis/vim-devicons'

Plugin 'baskerville/vim-sxhkdrc'

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
" Vimtex integration
if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.tex = g:vimtex#re#youcompleteme
" Default keywords
let g:ycm_seed_identifiers_with_syntax = 1

" ALE
let g:ale_sign_column_always = 1
let g:ale_fixers = {
\   'css': ['prettier'],
\   'html': ['prettier'],
\   'javascript': ['prettier'],
\   'json': ['prettier'],
\   'markdown': ['prettier'],
\   'python': ['yapf', 'isort'],
\   'latex': ['chktex', 'lacheck']
\}

let g:ale_linters = {
\   'python': ['pyls', 'isort']
\}
let g:ale_lint_on_text_changed = 'never'
nnoremap <C-l> :ALEFix<CR>


" Nerdtree
map <C-n> :NERDTreeToggle<CR><Bar>:echo<CR>
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeWinSize = 60

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

nnoremap : :set number norelativenumber<CR>:
au InsertEnter * set number relativenumber
cnoremap <silent> <CR> <CR>:set number relativenumber<CR>
cnoremap <silent> <Esc> <Esc>:set number relativenumber<CR>
cnoremap <silent> <C-c> <C-c>:set number relativenumber<CR>

" split position
set splitbelow
set splitright

" theme
colo gruvbox
" dark version
set background=dark
let g:gruvbox_contrast_dark='hard'
" background opacity
" hi Normal guibg=NONE ctermbg=NONE

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

nnoremap <Up> gk
nnoremap <Down> gj

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

" copy to clipboard
set clipboard^=unnamedplus,unnamed

" command history
set history=1000

" delete without yank
nnoremap x "_x
vnoremap x "_x

" autoclose
inoremap " ""<left>
inoremap "<BS> <left><right>
inoremap "<CR> "<CR>"<ESC>O
inoremap "" ""
inoremap ' ''<left>
inoremap '<BS> <left><right>
inoremap '<CR> '<CR>'<ESC>O
inoremap '' ''
inoremap """ """"""<left><left><left>
inoremap ( ()<left>
inoremap (<BS> <left><right>
inoremap (<CR> (<CR>)<ESC>O
inoremap () ()
inoremap (; ();
inoremap [ []<left>
inoremap [<BS> <left><right>
inoremap [<CR> [<CR>]<ESC>O
inoremap [] []
inoremap { {}<left>
inoremap {<BS> <left><right>
inoremap {<CR> {<CR>}<ESC>O
inoremap {} {}

" Cursor
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[2 q"
let &t_EI = "\<Esc>[4 q"


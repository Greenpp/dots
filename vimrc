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

" CoC
Plugin 'neoclide/coc.nvim'

" Snippets
Plugin 'honza/vim-snippets'

" JS
Plugin 'pangloss/vim-javascript'
Plugin 'elzr/vim-json'
Plugin 'mxw/vim-jsx'

" FZF
Plugin 'junegunn/fzf.vim'

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
augroup number_restore_set
    autocmd!
    autocmd Filetype * augroup number_restore
    autocmd Filetype * autocmd!
    autocmd Filetype * autocmd CmdlineLeave * set number relativenumber
    autocmd Filetype * augroup END
augroup END

" Splits position
set splitbelow
set splitright
" Resize splits after window resize
augroup window_resize
    autocmd!
    autocmd VimResized * wincmd =
augroup END

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

" Split character
set fillchars=vert:\│

" Remove trailing whitespaces on save
augroup whitespace_clear
    autocmd!
    autocmd BufWrite * :%s/\s\+$//e
augroup END
" Filetype text for empty files
augroup new_file_type
    autocmd!
    autocmd BufNewFile,BufRead * if matchstr(execute('set syntax?'), '=$') != '' | set filetype=text | endif
augroup END
" Spellcheck in git commits
augroup git_spellcheck
    autocmd!
    autocmd FileType gitcommit setlocal spell
augroup END


" PLUGINS

" Startify
augroup startify_clear
    autocmd!
    autocmd FileType startify :set nonumber
    autocmd FileType startify :nnoremap <buffer> : :
    autocmd FileType startify :echom 'halo start'
    autocmd FileType startify :augroup number_restore
    autocmd FileType startify :autocmd!
    autocmd FileType startify :augroup END
augroup END

" Nerdtree
map <silent> <C-n> :NERDTreeToggle<CR>
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeWinSize = 60
let NERDTreeShowBookmarks = 1
" Clear window
augroup nerdtree_clear
    autocmd!
    autocmd FileType nerdtree :set signcolumn=no
    autocmd FileType nerdtree :set nonumber
    autocmd FileType nerdtree :nnoremap <buffer> : :
    autocmd FileType nerdtree :augroup number_restore
    autocmd FileType nerdtree :autocmd!
    autocmd FileType nerdtree :augroup END
augroup END
" Colors
highlight link NERDTreeDir GruvboxGreen
highlight link NERDTreeDirSlash GruvboxGreen

" Comments
let g:NERDSpaceDelims=1
let g:NERDDefaultAlign='left'
nnoremap <silent> <C-_> :call NERDComment(0, "toggle")<CR>
vnoremap <silent> <C-_> :call NERDComment(0, "toggle")<CR>

" Fzf
nnoremap ff :Files<CR>
nnoremap fl :Lines<CR>

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
let g:airline#extensions#coc#enabl = 1
let g:airline#extensions#coc#error_symbol = 'E:'
let g:airline#extensions#coc#warning_symbol = 'W:'

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

" CoC
let g:coc_global_extensions = [
    \'coc-python',
    \'coc-tsserver',
    \'coc-html',
    \'coc-css',
    \'coc-pairs',
    \'coc-emmet',
    \'coc-snippets',
    \'coc-highlight',
    \'coc-vimlsp',
    \'coc-vimtex',
    \'coc-sh',
    \'coc-ccls',
    \'coc-prettier'
\]

set hidden
set updatetime=300
set signcolumn=yes
" TAB completion and navigation
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Confirm with enter
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Snippets placeholders selection
let g:coc_snippet_next = '<tab>'
let g:coc_snippet_prev = '<s-tab>'
" Formatting
nnoremap <silent> <C-l> :call CocActionAsync('format')<CR>
" Colors
highlight link CocErrorSign GruvboxRed
highlight link CocWarningSign GruvboxYellow
highlight link CocInfoSign GruvboxBlue

" Theme
colo gruvbox
set background=dark
let g:gruvbox_contrast_dark='medium'
" hi Normal guibg=NONE ctermbg=NONE

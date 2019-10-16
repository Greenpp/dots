"        _
" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|
"

set encoding=utf-8

call plug#begin()

Plug 'junegunn/vim-plug'

" Gruvbox
Plug 'morhetz/gruvbox'

" Bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Start Page
Plug 'mhinz/vim-startify'

" File explorer
" Plug 'scrooloose/nerdtree'

" Icons
Plug 'ryanoasis/vim-devicons'

" Comments
Plug 'scrooloose/nerdcommenter'

" CoC
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Snippets
Plug 'honza/vim-snippets'

" FZF
Plug 'junegunn/fzf.vim'

" Git
Plug 'tpope/vim-fugitive'

" Syntax
Plug 'sheerun/vim-polyglot'
Plug 'baskerville/vim-sxhkdrc'
Plug 'chunkhang/vim-mbsync'

call plug#end()

" VANILLA

syntax on
filetype on
set linebreak
" Command history
set history=1000
" Vim files load base on filetype
filetype plugin on

" Command completion
set wildmode=longest:full,full
set wildmenu

" Copy to clipboard and primary
set clipboard^=unnamedplus,unnamed

" Undo between sessions
set undofile
set undodir=~/.config/nvim/undo

" Lines numeration
" Nonrelative numbers while typing commands
function SetNumSign()
    let cleanFt = ['startify', 'nerdtree', 'help']
    let noNumFt = ['vim-plug']

    if index(cleanFt, &filetype) >= 0
        set signcolumn=no
        set nonumber
        nnoremap : :
        augroup number_restore
            autocmd!
        augroup END
    elseif index(noNumFt, &filetype) >= 0
        set signcolumn=yes
        set nonumber
        nnoremap : :
        augroup number_restore
            autocmd!
        augroup END
    else
        set signcolumn=yes
        set number relativenumber
        nnoremap : :set number norelativenumber<CR>:
        augroup number_restore
            autocmd!
            autocmd CmdlineLeave * set number relativenumber
        augroup END
    endif
endfunction
augroup clear_
    autocmd!
    autocmd Filetype * :call SetNumSign()
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
" Ignore case for only lower-case searches
set smartcase
" Search while typing
set incsearch
" Highlight for substitution
set inccommand=nosplit
" Highlight reset
nnoremap <silent> <Space><Space> :nohlsearch<Bar>:echo<CR>
" Search for word under cursor with #
nnoremap # mp*`p<Bar>:echo<CR>
" Search for selection with #
vnoremap # ymp/\V<C-r>=escape(@",'/\')<CR><CR>`p<Bar>:echo<CR>

" delete without yank
nnoremap x "_x
vnoremap x "_x
" paste without yank in visual
vnoremap p "_xp

" Cursor
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[2 q"
let &t_EI = "\<Esc>[4 q"
set guicursor=n-v-c-sm:hor20,i-ci-ve:ver25,r-cr-o:block

" Split character
set fillchars=vert:\│

" Split
nnoremap <silent> <C-s> :vsplit<CR>:Startify<CR>

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

" Terminal
nnoremap <silent> <C-q> :split <Bar> resize 20 <Bar> terminal<CR>i


" PLUGINS

" Theme
colo gruvbox
set background=dark
let g:gruvbox_contrast_dark='medium'
" hi Normal guibg=NONE ctermbg=NONE

" Startify
let g:startify_fortune_use_unicode = 1
let g:startify_bookmarks = [ '~/dots/vimrc', '~/dots/zshrc' ]

"" Nerdtree
" map <silent> <C-n> :NERDTreeToggle<CR>
" let g:NERDTreeQuitOnOpen = 1
" let g:NERDTreeWinSize = 60
" let NERDTreeShowBookmarks = 1
" let g:NERDTreeDirArrowExpandable = '▶'
" let g:NERDTreeDirArrowCollapsible = '◢'
" let g:WebDevIconsNerdTreeBeforeGlyphPadding = ''
" let g:WebDevIconsUnicodeDecorateFolderNodes = v:true
"" Colors
" highlight! link NERDTreeDir GruvboxBlue
" highlight! link NERDTreeDirSlash GruvboxFg1
" highlight! link NERDTreeFlags NERDTreeDir
" highlight! link NERDTreeOpenable NERDTreeDir
" highlight! link NERDTreeHelp GruvboxBg0
" highlight! link NERDTreeBookmarksHeader GruvboxYellow
" highlight! link NERDTreeCWD GruvboxYellow
" highlight! link NERDTreeBookmark GruvboxFg4
" highlight! link NERDTreeBookmarkName GruvboxFg1
" highlight! link NERDTreeLinkTarget GruvboxFg1

" Coc-explorer
nnoremap <silent> <C-n> :CocCommand explorer<CR>

" Comments
let g:NERDSpaceDelims=1
let g:NERDDefaultAlign='left'
nnoremap <silent> <C-_> :call NERDComment(0, "toggle")<CR>
vnoremap <silent> <C-_> :call NERDComment(0, "toggle")<CR>

" Fzf
nnoremap ff :Files<CR>
nnoremap fl :Lines<CR>

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
    \'coc-json',
    \'coc-html',
    \'coc-css',
    \'coc-sql',
    \'coc-vimlsp',
    \'coc-texlab',
    \'coc-pairs',
    \'coc-git',
    \'coc-prettier',
    \'coc-tslint-plugin',
    \'coc-highlight',
    \'coc-emmet',
    \'coc-snippets',
    \'coc-syntax',
    \'coc-dictionary',
    \'coc-lists',
    \'coc-explorer',
\]

set hidden
set updatetime=300
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
highlight! link CocErrorSign GruvboxRed
highlight! link CocWarningSign GruvboxYellow
highlight! link CocInfoSign GruvboxBlue
" Lists
nnoremap <silent> <Space>t :<C-u>CocList tags<CR>
nnoremap <silent> <Space>c :<C-u>CocList commands<CR>
nnoremap <silent> <Space>f :<C-u>CocList files<CR>
nnoremap <silent> <Space>b :<C-u>CocList buffers<CR>

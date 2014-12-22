set nocompatible              " be iMproved, required
filetype off                  " required

" ==============================================================================
" Vundle Setup
" ==============================================================================
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" ------------------------------------------------------------------------------
" THEMES - COLORS 
Plugin 'tomasr/molokai'
Plugin 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Plugin 'altercation/vim-colors-solarized'
Plugin 'sjl/badwolf'

" Rainbow Parantheses
" Plugin 'kien/rainbow_parentheses.vim'

" Ctr-P Plugin - fuzzy search
Plugin 'kien/ctrlp.vim'
let g:ctrlp_max_height = 30

" NERDTree - file browser
Plugin 'scrooloose/nerdtree'

" Powerline
Plugin 'Lokaltog/vim-powerline.git'
set laststatus=2
set noshowmode

" Multiple Cursors
Plugin 'terryma/vim-multiple-cursors'

" ultiSnips - Snippets
" Plugin 'SirVer/ultisnips'

" Plain Tasks Vim
Plugin 'elentok/plaintasks.vim'

" Python Mode
Plugin 'klen/python-mode'

" KEYS
" K				Show python docs
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)

" Disable Rope
let g:pymode_rope = 0

" Python version
let g:pymode_python = 'python'

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes, pep8"

" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 2
let g:pymode_breakpoint_key = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 0
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0

Plugin 'davidhalter/jedi-vim'
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
" filetype plugin on

"  BRIEF HELP 
" :PluginList       - lists configured plugins
" :PluginInstall    - append `!` to update or just :PluginUpdate
" :PluginSearch foo - append `!` to refresh local che
" :PluginClean      - append `!` to auto-approve removal

" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" ==============================================================================
" Python IDE Setup
" ==============================================================================

" Color Scheme Settings
syntax enable
" set background=dark
color Tomorrow-Night-Eighties
" color Tomorrow-Night-Bright
" color Tomorrow-Night
" color badwolf

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Rebind <Leader> key
let mapleader = ","

" Better cursor
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Better copy & paste
set pastetoggle=<F2>
set clipboard=unnamed

" Better Folding
nnoremap <Space> za
nnoremap <S-Space> zA
vnoremap <S-Space> zA

" Better Mouse & Backspace
set mouse=a
set bs=2

" Showing line numbers and length
set relativenumber
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233

" Highlit excess line length
augroup vimrc_autocmds
    autocmd!
    " highlight characters past column 80
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%80v.*/
    autocmd FileType python set nowrap
    augroup END

" Useful settings
set history=700
set undolevels=700

" Jump to Last Position
if has("autocmd")
	  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile 

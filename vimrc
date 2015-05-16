" Sabin Purice

" Vundle Setup {{{
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

Plugin 'gmarik/Vundle.vim'

" THEMES - COLORS 
Plugin 'tomasr/molokai'
Plugin 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Plugin 'altercation/vim-colors-solarized'
Plugin 'sjl/badwolf'

" Rainbow Parantheses
" Plugin 'kien/rainbow_parentheses.vim'

Plugin 'kien/ctrlp.vim'                 " Ctr-P Plugin      - fuzzy search
Plugin 'scrooloose/nerdtree'            " NERD Tree         - file browser
Plugin 'scrooloose/nerdcommenter'       " NERD Commenter
Plugin 'Lokaltog/vim-powerline.git'     " Powerline         - status line
Plugin 'terryma/vim-multiple-cursors'   " Multiple Cursors  - sublime
" Plugin 'SirVer/ultisnips'             " ultiSnips         - Snippets
Plugin 'elentok/plaintasks.vim'         " Plain Tasks Vim
Plugin 'klen/python-mode'               " Python-mode
Plugin 'davidhalter/jedi-vim'           " Jedi Vim          - autocomplete
Plugin 'sjl/gundo.vim'                  " gUndo             - graphical undo
Plugin 'JuliaLang/julia-vim'            " Julia 4 Vim

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
" filetype plugin on

" see :h vundle for more details or wiki for FAQ
" }}}
" Colors {{{
syntax enable
" set background=dark
color Tomorrow-Night-Eighties
" color Tomorrow-Night-Bright
" color Tomorrow-Night
" color badwolf
" }}}
" Spaces & Tabs {{{
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
set shiftround

set modelines=1
" }}}
" Plugin Settings {{{

" Ctr-P Plugin - fuzzy search
let g:ctrlp_max_height = 30

" Powerline
set laststatus=2
set noshowmode

" Python Mode

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

" Jedi Vim
let g:jedi#popup_on_dot = 1
let g:jedi#popup_select_first = 1
" }}}
" UI Config {{{
set relativenumber

set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233

set wildmenu
set lazyredraw
" }}}
" Searching {{{
set hlsearch    " search as characters are entered
set incsearch   " highlight matches

set ignorecase
set smartcase

nnoremap <leader><space> :nohlsearch<CR>
" }}}
" Folding {{{
nnoremap <Space> za
nnoremap <S-Space> zA
vnoremap <S-Space> zA
" }}}
" Movement {{{
nnoremap B ^
vnoremap B ^
nnoremap E $
vnoremap E $

" nnoremap $ <nop>
" nnoremap ^ <nop>

nnoremap gV `[v`]

" Mappings to move lines
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>==gv
vnoremap <C-k> :m '<-2<CR>==gv
" }}}
" Leader Shortcuts {{{
let mapleader = ","

inoremap jk <esc>

nnoremap <leader>u :GundoToggle<CR>
" }}}
" Better cursor & stuff {{{
set ttyfast

" Cursor
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Copy & paste
set pastetoggle=<F2>
set clipboard=unnamed

" Better Mouse & Backspace
set mouse=a
set bs=2

" Useful settings
set history=700
set undolevels=700
" }}}
" MISC {{{
" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Highlight excess line length
augroup vimrc_autocmds
    autocmd!
    " highlight characters past column 80
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%80v.*/
    autocmd FileType python set nowrap
    augroup END


" Jump to Last Position
if has("autocmd")
	  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile
" }}}

" vim:foldmethod=marker:foldlevel=0

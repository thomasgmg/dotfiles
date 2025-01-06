" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" :PlugInstall
"
"
" enable mouse support
set mouse=a

" Turn syntax highlighting on.
syntax on

set relativenumber number

" Highlight cursor line underneath the cursor horizontally.
"set cursorline
":highligh Cursorline cterm=bold ctermbg=darkgray

" enable color themes "
"if !has('gui_running')
"	set t_Co=256
"endif
" enable true colors support "
"set termguicolors
" Vim colorscheme "
"colorscheme desert

" plugins
call plug#begin()

" List your plugins here
Plug 'tpope/vim-sensible'
Plug 'machakann/vim-highlightedyank'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

" -----------------------
"
" mac
"set clipboard=unnamed
set clipboard=unnamedplus

""" Map leader to space ---------------------
let mapleader=" "

nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

nnoremap <C-f> ]mzz
nnoremap <C-b> [mzz

inoremap jj <Esc>

set showmode
set showcmd
set so=5
set visualbell
set scrolloff=10
set ignorecase
set smartcase
set incsearch
set hlsearch

let g:highlightedyank_highlight_duration = 250

"search down in subfolders
set path+=**
set wildmenu
set wildmode=longest:full,full

" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Helps force plugins to load correctly when it is turned back on below.
filetype off

" TODO: Load plugins here (pathogen or vundle, I recommend vundle)

" Enable plugins and load plugin for the detected file type.
filetype plugin indent on

" Highlight cursor line underneath the cursor vertically.
"set cursorcolumn

" Set shift width to 4 spaces.
set shiftwidth=4

" Show line numbers.
"set number

" Show file stats.
set ruler

" Blink cursor on error instead of beeping.
set visualbell

" Encoding.
set encoding=utf-8

" Security.
set modelines=0

" Show color column at 80 characters width, visual reminder of keepingcode line within a popular line width.
"set colorcolumn=80

"Whitespace.
set wrap
set autoindent
set smartindent
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab

" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
" set wildmode=list:longest

" Allow hidden buffers.
set hidden

" Rendering.
set ttyfast

" Status bar.
set laststatus=2

" Last line.
set showmode
set showcmd

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

set ttimeout
set ttimeoutlen=1
set listchars=tab:>-,trail:~,extends:>,precedes:<,space:.
set ttyfast


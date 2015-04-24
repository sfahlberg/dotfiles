set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" easy file lookup
Plugin 'kien/ctrlp.vim'

" nerd tree
Plugin 'scrooloose/nerdtree'

" quick comments
Plugin 'vim-scripts/tComment'

" close pairs
Plugin 'jiangmiao/auto-pairs'

" Git for Vim
Plugin 'tpope/vim-fugitive'

" mass editing
Plugin 'terryma/vim-multiple-cursors'

" surround with something
Plugin 'tpope/vim-surround'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" automatically start syntax highlighting
syntax on

" automatically turn line numbers on
set number

" automatically set the shift width
set tabstop=2 shiftwidth=2 expandtab

" automatically close tags in various languages
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" set <leader> equal to ,
:let mapleader = ","

" NERDTree customization
autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<leader>n'
let g:multi_cursor_prev_key='<leader>p'
let g:multi_cursor_skip_key='<leader>x'
let g:multi_cursor_quit_key='<Esc>'

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

" syntax checking
Plugin 'scrooloose/syntastic'

" toggle absolute and relative line numbers on insert
Plugin 'myusuf3/numbers.vim'

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

" make control + a select everything
map <C-a> ggVG

" automatically close tags in various languages
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" set <leader> equal to ,
let mapleader = ","

vmap <leader>s <Esc><leader>sgv
imap <leader>s <Esc><leader>s

" Open NERDTree automatically when vim opens
autocmd vimenter * NERDTree

" Open NERDTree automatically if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" map NERDTreeToggle to <leader>n
map <leader>n :NERDTreeToggle<CR>

" default syntastic settings from doc
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" syntastic libraries
let g:syntastic_javascript_checkers = ['jshint']

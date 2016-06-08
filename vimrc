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

" airplane status bar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" toggle absolute and relative line numbers on insert
Plugin 'myusuf3/numbers.vim'

" ruby testing
Plugin 'skalnik/vim-vroom'

" solarized colorscheme
Plugin 'altercation/vim-colors-solarized'

" vim-vinegar for netrw
Plugin 'tpope/vim-vinegar'

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

" set colorscheme
syntax on
if has('mac')
  let g:solarized_termcolors=256
  set background=dark
  colorscheme solarized
elseif has('unix')
  " use airplane with tabs for buffers
  let g:airline#extensions#tabline#enabled = 1
endif

" automatically turn line numbers on
set number

"fix copy-paste issues
set clipboard=unnamed

" automatically set the shift width
set tabstop=2 shiftwidth=2 expandtab

" no wrapping
set nowrap

" auto sort by last updated
let g:netrw_sort_by = 'time'
let g:netrw_sort_direction = 'reverse'

" automatically close tags in various languages
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" start up airplane
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme = 'papercolor'

" save automatically when text is changed
set updatetime=200
au CursorHold * silent! update

" fugitive make vertical
set diffopt+=vertical

" set <leader> equal to ,
let mapleader = ","

" map to explorer
nmap <leader>e :Explore<CR>
vmap <leader>e <ESC>:Explore<CR>
imap <leader>e <ESC>:Explore<CR>

" switch to shell
nmap <leader>s :w<CR>:shell<CR>
vmap <leader>s <ESC>:w<CR>:shell<CR>
imap <leader>s <ESC>:w<CR>:shell<CR>

" save with <leader>w
nmap <leader>w :w<CR>
vmap <leader>w <ESC>:w<CR>v
imap <leader>w <ESC>:w<CR>

" save and close with <leader>x
nmap <leader>x :x<CR>
vmap <leader>x <ESC>:x<CR>
imap <leader>x <ESC>:x<CR>

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

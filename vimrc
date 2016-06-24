set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" editing_stuff
Plugin 'vim-scripts/tComment'
Plugin 'jiangmiao/auto-pairs'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-surround'

" searching_stuff
Plugin 'thoughtbot/pick.vim' "for searching files
Plugin 'rking/ag.vim' "for searching files for words
Plugin 'tpope/vim-vinegar' "for netrw
Plugin 'henrik/vim-indexed-search' " number for search
Plugin 'ervandew/supertab' " tab completion

" git_stuff
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" make_it_look_pretty
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'altercation/vim-colors-solarized'
Plugin 'edkolev/tmuxline.vim'
Plugin 'Yggdroot/indentLine'

" language_stuff
Plugin 'tpope/vim-rails'
Plugin 'skalnik/vim-vroom'
Plugin 'scrooloose/syntastic'

call vundle#end()            " required
filetype plugin indent on    " required

" general_stuff
set updatetime=200 " update everything every 750 milliseconds
let mapleader = "," " set <leader> equal to ,
" set clipboard=unnamed "fix copy-paste issues

" editing_stuff
set tabstop=2 shiftwidth=2 expandtab " automatically set the shift width

filetype plugin on " automatically close tags in various languages
set omnifunc=syntaxcomplete#Complete " closes tags

au CursorHold * silent! update " save automatically when text is changed

" searching_stuff
set ignorecase " ignores case for searching
set smartcase " doesn't ignore case when upper case used
set incsearch " automatically go to the word while searching
set hlsearch " highlights all search matches
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR> " turn off highlighting on space

let g:netrw_sort_by = 'time' " auto sort by last updated
let g:netrw_sort_direction = 'reverse' " most recently updated at top

nnoremap <C-p> :call PickFile()<CR> " pick shortcuts V
nnoremap <Leader>s :call PickFileSplit()<CR>
nnoremap <Leader>v :call PickFileVerticalSplit()<CR>
nnoremap <Leader>t :call PickFileTab()<CR>
nnoremap <Leader>b :call PickBuffer()<CR>
nnoremap <Leader>] :call PickTag()<CR>

" git_stuff
set diffopt+=vertical " fugitive make vertical

" make_it_look_pretty
set nowrap " no wrapping
set number " automatically turn line numbers on
set relativenumber " relative numbers

set laststatus=2 " start up airplane
let g:airline_powerline_fonts = 1 " use fonts
let g:airline_theme = 'distinguished'
let g:airline#extensions#tabline#enabled = 1 " use airplane with tabs for buffers
let g:airline#extensions#tabline#fnamemod=':t'

syntax on
if has('mac')
  let g:solarized_termcolors=256
  set background=dark
  colorscheme solarized
elseif has('unix')
endif

" language_stuff
set statusline+=%#warningmsg# " default syntastic settings from doc V
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_html_tidy_ignore_errors=["proprietary attribute", "is not recognized!", "discarding unexpected", "trimming empty <", "missing </a>", "attribute name"] " limit errors shown
let g:syntastic_loc_list_height=3 " set location-list window height to 3 lines
let g:syntastic_javascript_checkers = ['jshint'] " syntastic libraries

" shortcuts
nmap <leader>e :Explore<CR> " switch to explorer V
vmap <leader>e <ESC>:Explore<CR>
imap <leader>e <ESC>:Explore<CR>

nmap <leader>s :w<CR>:shell<CR> " exit to shell V
vmap <leader>s <ESC>:w<CR>:shell<CR>
imap <leader>s <ESC>:w<CR>:shell<CR>

nmap <leader>w :w<CR> " save V
vmap <leader>w <ESC>:w<CR>v
imap <leader>w <ESC>:w<CR>

nmap <leader>q :q<CR> " quit V
vmap <leader>q <ESC>:q<CR>
imap <leader>q <ESC>:q<CR>

nmap <leader>x :x<CR> " save & exit V
vmap <leader>x <ESC>:x<CR>
imap <leader>x <ESC>:x<CR>

nmap <leader>. :bn<CR> " buffer next
nmap <leader>m :bp<CR> " buffer prev

map <leader><leader> <ESC>
vmap <leader><leader> <ESC>
imap <leader><leader> <ESC>

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
Plugin 'chrisbra/Recover.vim' " so I get a diff when there's a swap file

" searching_stuff
Plugin 'thoughtbot/pick.vim' " for searching files
Plugin 'mileszs/ack.vim' " for searching files for words
Plugin 'henrik/vim-indexed-search' " number for / search
Plugin 'ervandew/supertab' " tab completion

" navigation
Plugin 'ton/vim-bufsurf' " recent buffer
Plugin 'tpope/vim-vinegar' " for netrw

" git_stuff
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'idanarye/vim-merginal'

" make_it_look_pretty
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'altercation/vim-colors-solarized'
Plugin 'edkolev/tmuxline.vim'
Plugin 'Yggdroot/indentLine'

" language_stuff
Plugin 'tpope/vim-rails'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-endwise'
Plugin 'vim-ruby/vim-ruby'
Plugin 'alvan/vim-closetag' " close html tags
Plugin 'elzr/vim-json' " json syntax and highlighting
Plugin 'pangloss/vim-javascript' " js syntax highlighting
Plugin 'fatih/vim-go' " go plugin

" testing
Plugin 'tpope/vim-dispatch'

call vundle#end()            " required
filetype plugin indent on    " required

" general_stuff
let mapleader = "," " set <leader> equal to ,

set clipboard=unnamed "fix copy-paste issues

set wildmode=longest,list,full " set wildmenu options
set wildmenu " see list for potential autocomplete options

set splitright " open new splits on the right
set splitbelow " open new splits below

set textwidth=72 " set wrap width
set formatoptions+=t " set format options to use textwidth

augroup vimrc_autocmds " change color if you go over this limit
  autocmd BufEnter * highlight OverLength ctermbg=darkgrey guibg=#592929
  autocmd BufEnter * match OverLength /\%74v.*/
augroup END

" editing_stuff
set tabstop=2 shiftwidth=2 expandtab " automatically set the shift width

filetype plugin on " automatically close tags in various languages
set omnifunc=syntaxcomplete#Complete " closes tags

set hidden " keep edit history on hidden buffers
set directory=~/.vimswap " define which directory to save swap files

au CursorHold * silent! update " save automatically when text is changed

set backspace=2 " make backspace work like most other apps

function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction
autocmd BufWritePre * :call TrimWhiteSpace() " Removes trailing spaces

" searching_stuff
set ignorecase " ignores case for searching
set smartcase " doesn't ignore case when upper case used
set incsearch " automatically go to the word while searching
set hlsearch " highlights all search matches
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR> " turn off highlighting on space

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

set shellpipe=> " make vim stop outputting ack search results to terminal

cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>
vnoremap <Leader>a y:Ack! '<C-r>"'<CR>

vnoremap / y/<C-r>"<CR>

nnoremap <C-p> :call PickFile()<CR> " pick shortcuts V
nnoremap <leader>v :call PickBufferCommand('vsplit')<CR>
nnoremap <leader>V :call PickFileVerticalSplit()<CR>
nnoremap <leader>c :call PickBufferCommand('split')<CR>
nnoremap <leader>C :call PickFileSplit()<CR>
nnoremap <Leader>b :call PickBuffer()<CR>
let g:pick_height = 10

" navigation
nmap <BS> :BufSurfBack<CR>
nmap \ :BufSurfForward<CR>

nmap <S-Tab> :bp<CR>
nmap <Tab> :bn<CR>

let g:netrw_sort_by = 'time' " auto sort by last updated
let g:netrw_sort_direction = 'reverse' " most recently updated at top
let g:netrw_bufsettings = 'numbers' " settings for netrw, add numbers
let g:netrw_liststyle=3     " tree view
autocmd FileType netrw setl bufhidden=wipe " remove unwanted netrw buffers

" git_stuff
set diffopt+=vertical " fugitive make vertical

cnoreabbrev Gpull execute ':Gpull --rebase origin ' . fugitive#head(7)

autocmd BufFilePost Merginal:* setlocal relativenumber " numbers on merginal buffers V
autocmd BufFilePost Merginal:* setlocal number

map <leader>gm :Merginal<CR>

map <leader>gp :Gpush<CR>
map <leader>gpf :Gpush --force<CR>
map <leader>gfr :Gpull<CR>
map <leader>gri :Git rebase -i HEAD~

map <leader>gws :Gstatus<CR>

map <leader>gs :! git stash<CR>
map <leader>gsp :! git stash pop<CR>

" make_it_look_pretty
set nowrap " no wrapping
set number " automatically turn line numbers on
set relativenumber " relative numbers

set laststatus=2 " start up airplane
let g:airline_powerline_fonts = 1 " use fonts
let g:airline#extensions#tabline#enabled = 1 " use airplane with tabs for buffers
let g:airline#extensions#tabline#fnamemod=':t'

syntax on

let g:solarized_termcolors=256
colorscheme solarized

let hour = strftime("%H")
if 6 <= hour && hour < 18 " set light during the day
  set background=light
  let g:airline_theme = 'zenburn'
  let g:tmuxline_theme = 'zenburn'
else
  set background=dark
  let g:airline_theme = 'distinguished'
  let g:tmuxline_theme = 'distinguished'
endif

" language_stuff
set statusline+=%#warningmsg# " default syntastic settings from doc V
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:syntastic_html_tidy_ignore_errors=["proprietary attribute", "is not recognized!", "discarding unexpected", "trimming empty <", "missing </a>", "attribute name"] " limit errors shown
let g:syntastic_loc_list_height=3 " set location-list window height to 3 lines
let g:syntastic_javascript_checkers = ['eslint', 'jshint']
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_ruby_exec = '/Users/sam/.rbenv/shims/ruby'
let g:syntastic_ruby_rubocop_exec = '/Users/sam/.rbenv/shims/rubocop'

runtime macros/matchit.vim " setup extended matching with %, especially for html

let g:closetag_filenames = "*.html,*.erb" " closetags for html and erb files

let g:vim_json_syntax_conceal = 0 " stop auto concealing for json in vim

let g:javascript_plugin_jsdoc = 1 " js syntax highlighting for plugin: pangloss/vim-javascript

" testing
autocmd FileType ruby let b:dispatch = 'bundle exec rspec %'
nmap <leader>t :execute ':Dispatch bundle exec rspec %:' . line('.')<CR>
nmap <leader>T :Dispatch<CR>

nmap <leader>ts :execute ':Dispatch JS_DRIVER=selenium bundle exec rspec %:' . line('.')<CR>
nmap <leader>Ts :Dispatch JS_DRIVER=selenium bundle exec rspec %<CR>

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

map <leader>so :so ~/.vimrc<CR>


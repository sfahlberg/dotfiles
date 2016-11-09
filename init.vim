call plug#begin()

" editing_stuff
Plug 'vim-scripts/tComment'
Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'chrisbra/Recover.vim' " so I get a diff when there's a swap file
Plug 'sickill/vim-pasta' " context aware pasting
Plug 'matze/vim-move'
Plug 'tpope/vim-repeat'

" searching_stuff
Plug 'thoughtbot/pick.vim' " for searching files
Plug 'mileszs/ack.vim' " for searching files for words
Plug 'henrik/vim-indexed-search' " number for / search
Plug 'ervandew/supertab' " tab completion
Plug 'dyng/ctrlsf.vim' " find and replace in multiple files
Plug 'craigemery/vim-autotag' " automatically update ctags
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" navigation
Plug 'ton/vim-bufsurf' " recent buffer
Plug 'tpope/vim-vinegar' " for netrw
Plug 'tpope/vim-unimpaired'

" git_stuff
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'idanarye/vim-merginal'

" make_it_look_pretty
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'edkolev/tmuxline.vim'
Plug 'Yggdroot/indentLine'

" language_stuff
Plug 'scrooloose/syntastic'
Plug 'neomake/neomake'
Plug 'tpope/vim-endwise'
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'tpope/vim-bundler', { 'for': 'ruby' }
Plug 'tpope/gem-browse', { 'for': 'ruby' }
Plug 'tpope/vim-rake', { 'for': 'ruby' }
Plug 'alvan/vim-closetag' " close html tags
Plug 'elzr/vim-json' " json syntax and highlighting
Plug 'pangloss/vim-javascript' " js syntax highlighting
Plug 'mxw/vim-jsx' " javascript
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'rizzatti/dash.vim'

" testing
Plug 'tpope/vim-dispatch'
Plug 'thoughtbot/vim-rspec'

call plug#end()

" general_stuff
let mapleader = "," " set <leader> equal to ,

set clipboard=unnamed "fix copy-paste issues

set wildmode=longest,list,full " set wildmenu options
set wildmenu " see list for potential autocomplete options

set splitright " open new splits on the right
set splitbelow " open new splits below

set textwidth=72 " set wrap width
set formatoptions+=t " set format options to use textwidth

set mouse=nicr " make it easier for other people to scroll on my machine

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

nnoremap <Leader>/ :%s/
vnoremap <Leader>/ y:%s/'<C-r>"'/

                          " the below abbreviation helps me remember
                          " the syntax is for copying the current file
                          " into the current directory
cnoreabbrev sav sav %:h/

au BufEnter *.rb syn match error contained "\<binding.pry\>" " show binding.pry
au BufEnter *.js *.jsx syn match error contained "\<debugger\>" " highlight debugger

let g:move_key_modifier = 'C'


" searching_stuff
set ignorecase " ignores case for searching
set smartcase " doesn't ignore case when upper case used
set incsearch " automatically go to the word while searching
set hlsearch " highlights all search matches
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR> " turn off highlight

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

set shellpipe=> " stop outputting ack search results to terminal

cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>
vnoremap <Leader>a y:Ack! '<C-r>"'<CR>

" map <C-F> :w<CR>:CtrlSF '<C-r>
vnoremap <C-F> y:w<CR>:CtrlSF '<C-r>"'<CR>:%s/<C-r>"/
" vnoremap <C-f> :%s/<C-r>"/
let g:ctrlsf_confirm_save = 0

vnoremap / y:/'<C-r>"'<CR>

if has('nvim')
  nnoremap <C-p> :FZF<CR>
else
  nnoremap <C-p> :call PickFile()<CR> " pick shortcuts V
  nnoremap <leader>v :call PickBufferCommand('vsplit')<CR>
  nnoremap <leader>V :call PickFileVerticalSplit()<CR>
  nnoremap <leader>c :call PickBufferCommand('split')<CR>
  nnoremap <leader>C :call PickFileSplit()<CR>
  nnoremap <Leader>b :call PickBuffer()<CR>
  let g:pick_height = 10
endif

" navigation
nmap <BS> :BufSurfBack<CR>
nmap \ :BufSurfForward<CR>

nmap <S-Tab> :bp<CR>
nmap <Tab> :bn<CR>

let g:netrw_sort_by = 'time' " auto sort by last updated
let g:netrw_sort_direction = 'reverse' " most recently updated at top
let g:netrw_bufsettings = 'numbers' " settings for netrw, add numbers
" let g:netrw_liststyle=3     " tree view
autocmd FileType netrw setl bufhidden=wipe " remove netrw buffers

" git_stuff
set diffopt+=vertical " fugitive make vertical

cnoreabbrev Gpull execute ':Gpull --rebase origin ' . fugitive#head(7)

autocmd BufFilePost Merginal:* setlocal relativenumber " buffers #s V
autocmd BufFilePost Merginal:* setlocal number

map <leader>gm :Merginal<CR>

map <leader>gp :Gpush<CR>
map <leader>gpf :Gpush --force<CR>
map <leader>gfr :Gpull<CR>
map <leader>gri :Git rebase -i HEAD~

map <leader>g :Gstatus<CR>

map <leader>gs :Start git stash<CR>
map <leader>gsp :Start git stash pop<CR>

map <leader>gcp :Start git cherry-pick -n

map <Leader>ga <Plug>GitGutterStageHunk
map <Leader>gco <Plug>GitGutterUndoHunk

map [g <Plug>GitGutterPrevHunk
map ]g <Plug>GitGutterNextHunk

" make_it_look_pretty
set nowrap " no wrapping
set number " automatically turn line numbers on
set relativenumber " relative numbers

set laststatus=2 " start up airplane
let g:airline_powerline_fonts = 1 " use fonts
let g:airline#extensions#tabline#enabled = 1 " airplane buffer tabs
let g:airline#extensions#tabline#fnamemod=':t'

syntax on

let g:solarized_termcolors=256
colorscheme solarized

let hour = strftime("%H")
" if 6 <= hour && hour < 18 " set light during the day
"   set background=light
"   let g:airline_theme = 'zenburn'
"   let g:tmuxline_theme = 'zenburn'
" else
  set background=dark
  let g:airline_theme = 'distinguished'
  let g:tmuxline_theme = 'distinguished'
" endif

augroup quickfix
  autocmd!
  autocmd FileType qf setlocal wrap
augroup END

" language_stuff
set statusline+=%#warningmsg# " default syntastic settings from doc V
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

autocmd! BufWritePost * Neomake

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 0
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 1
" let g:syntastic_loc_list_height= 3 " set  window height to 3 lines
"
" let g:syntastic_html_tidy_ignore_errors=["proprietary attribute", "is not recognized!", "discarding unexpected", "trimming empty <", "missing </a>", "attribute name"] " limit errors shown
"
" let g:syntastic_javascript_checkers = ['eslint']
"
" let g:syntastic_ruby_checkers = ['rubocop']
" let g:syntastic_ruby_exec = '/Users/sam/.rbenv/shims/ruby'
" let g:syntastic_ruby_rubocop_exec = '/Users/sam/.rbenv/shims/rubocop'

set statusline+=\ %#ErrorMsg#%{neomake#statusline#QflistStatus('qf:\ ')}
au BufWritePost *.rb Neomake rubocop
let g:neomake_javascript_jshint_maker = {
    \ 'args': ['--verbose'],
    \ 'errorformat': '%A%f: line %l\, col %v\, %m \(%t%*\d\)',
    \ }
let g:neomake_javascript_enabled_makers = ['eslint']

let g:neomake_ruby_rubocop_maker = {
    \ 'errorformat': '%A%f: line %l\, col %v\, %m \(%t%*\d\)',
    \ }
let g:neomake_ruby_enabled_makers = ['rubocop']

runtime macros/matchit.vim " setup extended matching with %, eg html

let g:closetag_filenames = "*.html,*.erb,*.jsx" " closetags for html, jsx and erb

let g:vim_json_syntax_conceal = 0 " stop auto concealing for json in vim

let g:javascript_plugin_jsdoc = 1 " js syntax highlighting for plugin

map ]s :lnext<CR>
map [s :lprevious<CR>
map ]S :lfirst<CR>
map [S :llast<CR>

" testing

nmap <leader>z :w<CR>:call RunNearestSpec()<CR>
nmap <leader>zz :w<CR>:execute("Start zeus rspec " . expand("%p") . ":" . line(".")) <CR>
nmap <leader>zs :w<CR>:execute ':Dispatch JS_DRIVER=selenium bundle exec rspec %:' . line('.')<CR>
nmap <leader>zl :w<CR>:call RunLastSpec()<CR>

nmap <leader>Z :w<CR>:call RunCurrentSpecFile()<CR>
nmap <leader>ZZ :w<CR>:Start zeus rspec %<CR>
nmap <leader>Zs :w<CR>:Dispatch JS_DRIVER=selenium bundle exec rspec %<CR>

nmap <leader>t :w<CR>:execute("Dispatch bundle exec rspec " . expand("%p") . ":" . line(".")) <CR>
nmap <leader>tt :w<CR>:execute("!clear && zeus rspec " . expand("%p") . ":" . line(".")) <CR>
nmap <leader>ts :w<CR>:execute ':Dispatch JS_DRIVER=selenium bundle exec rspec %:' . line('.')<CR>

nmap <leader>T :w<CR>:Dispatch date; bundle exec rspec %<CR>
nmap <leader>TT :w<CR>:Start bundle exec rspec %<CR>
nmap <leader>Ts :w<CR>:Dispatch JS_DRIVER=selenium bundle exec rspec %<CR>

nmap <leader>tm :w<CR>:Dispatch npm run mocha<CR>

" let g:rspec_command = "Dispatch bundle exec rspec {spec}"
let g:rspec_command = "compiler rspec | set makeprg=zeus | Make rspec {spec}"
let g:rspec_runner = "os_x_iterm2"

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

map <leader>db :Dispatch bundle
map <leader>dror :Dispatch bundle exec rake one_ring
map <leader>drm :Dispatch bundle exec rake db:migrate
map <leader>drtp :Dispatch bundle exec rake db:test:prepare

map <leader>bi ibinding.pry<esc>:w<CR>
map <leader>bo obinding.pry<esc>:w<CR>

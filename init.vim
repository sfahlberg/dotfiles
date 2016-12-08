call plug#begin()

" editing_stuff
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'chrisbra/Recover.vim' " so I get a diff when there's a swap file
Plug 'sickill/vim-pasta' " context aware pasting
Plug 'matze/vim-move'
Plug 'tpope/vim-repeat'

" searching_stuff
Plug 'henrik/vim-indexed-search' " number for / search
Plug 'ervandew/supertab' " tab completion
Plug 'dyng/ctrlsf.vim' " find and replace in multiple files
Plug 'soramugi/auto-ctags.vim' " automatically update ctags
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" navigation
Plug 'ton/vim-bufsurf' " recent buffer
Plug 'tpope/vim-vinegar' " for netrw
Plug 'tpope/vim-unimpaired'
Plug 'majutsushi/tagbar'

" git_stuff
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'idanarye/vim-merginal'

" make_it_look_pretty
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'

" language_stuff
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
Plug 'radenling/vim-dispatch-neovim'

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

nnoremap <Leader>a :Ag<Space>
vnoremap <Leader>a y:Ag <C-r>"<CR>

" map <C-F> :w<CR>:CtrlSF '<C-r>
vnoremap <C-F> y:w<CR>:CtrlSF '<C-r>"'<CR>:%s/<C-r>"/
" vnoremap <C-f> :%s/<C-r>"/
let g:ctrlsf_confirm_save = 0

vnoremap / y:/'<C-r>"'<CR>

nnoremap <C-p> :FZF<CR>

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

let g:auto_ctags = 1

" git_stuff
set diffopt+=vertical " fugitive make vertical

cnoreabbrev Gpull execute ':Gpull --rebase origin ' . fugitive#head(7)

autocmd BufFilePost Merginal:* setlocal relativenumber " buffers #s V
autocmd BufFilePost Merginal:* setlocal number

map <leader>gm :MerginalToggle<CR>

map <leader>gp :Gpush<CR>
map <leader>gpf :Gpush --force<CR>
map <leader>gfr :Gpull<CR>
map <leader>gri :Git rebase -i HEAD~

map <leader>gg :Gstatus<CR>

map <leader>gs :Git stash<CR>
map <leader>gsp :Git stash pop<CR>

map <leader>gcp :Start git cherry-pick -n

map <leader>gc :Start git commit<CR>
map <leader>gcnv :Start git commit --no-verify<CR>
map <leader>gca :Start git commit --amend

map <Leader>ga <Plug>GitGutterStageHunk
map <Leader>gco <Plug>GitGutterUndoHunk

map [g :w<CR><Plug>GitGutterPrevHunk
map ]g :w<CR><Plug>GitGutterNextHunk
map [G :w<CR>G<Plug>GitGutterPrevHunk
map ]G :w<CR>gg<Plug>GitGutterNextHunk

" make_it_look_pretty
set nowrap " no wrapping
set number " automatically turn line numbers on
set relativenumber " relative numbers

set laststatus=2 " start up airplane
let g:airline_powerline_fonts = 1 " use fonts
let g:airline#extensions#tabline#enabled = 1 " airplane buffer tabs
let g:airline#extensions#tabline#fnamemod=':t'
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_section_c = ''
let g:airline_section_x = airline#section#create_right(['tagbar'])
let g:airline_section_y = airline#section#create_right(['filetype'])

colorscheme gruvbox
set termguicolors

augroup quickfix
  autocmd!
  autocmd FileType qf setlocal wrap
augroup END

" language_stuff
autocmd! BufWritePost * Neomake
au BufWritePost,BufEnter Neomake
let g:neomake_javascript_enabled_makers = ['eslint']
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

nmap <leader>f :echo @%<CR>

nmap <leader>ss :w<CR>:terminal<CR>
vmap <leader>ss <ESC>:w<CR>:terminal<CR>
imap <leader>ss <ESC>:w<CR>:terminal<CR>

nmap <leader>w :w<CR> " save V
vmap <leader>w <ESC>:w<CR>v
imap <leader>w <ESC>:w<CR>

nmap <leader>q :q<CR> " quit V
vmap <leader>q <ESC>:q<CR>
imap <leader>q <ESC>:q<CR>

nmap <leader>x :x<CR> " save & exit V
vmap <leader>x <ESC>:x<CR>
imap <leader>x <ESC>:x<CR>

map <silent><leader>so :silent so ~/.config/nvim/init.vim<CR>:echo 'init.vim resourced'<CR>

map <leader>db :Dispatch! bundle
map <leader>dror :Dispatch bundle exec rake one_ring
map <leader>drm :Dispatch bundle exec rake db:migrate
map <leader>drtp :Dispatch bundle exec rake db:test:prepare

map <leader>bi ibinding.pry<esc>:w<CR>
map <leader>bo obinding.pry<esc>:w<CR>

              " the following prevents the cursor from moving
inoremap <ESC> <ESC>`^
vnoremap <C-[> <ESC>:w<CR>
inoremap <C-[> <ESC>:w<CR>
nnoremap <C-[> :w<CR>

noremap <C-h> :Helptags<CR>

noremap = =:w<CR>

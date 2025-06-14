call plug#begin()

" ============================================================================
" editing_stuff
" ============================================================================

Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'chrisbra/Recover.vim' " so I get a diff when there's a swap file
Plug 'matze/vim-move'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-capslock'
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'chrisbra/NrrwRgn'
Plug 'sbdchd/neoformat'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-sleuth'
Plug 'vim-scripts/vim-auto-save'

" ============================================================================
" searching_stuff
" ============================================================================

Plug 'henrik/vim-indexed-search' " number for / search
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'dyng/ctrlsf.vim' " find and replace in multiple files
Plug 'ludovicchabant/vim-gutentags' " automatically update ctags
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" ============================================================================
" navigation
" ============================================================================

Plug 'ton/vim-bufsurf' " recent buffer
Plug 'tpope/vim-unimpaired'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/BufOnly.vim'

" ============================================================================
" git_stuff
" ============================================================================

Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'idanarye/vim-merginal'
Plug 'jreybert/vimagit'

" ============================================================================
" make_it_look_pretty
" ============================================================================
"
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'mhinz/vim-startify'
Plug 'junegunn/goyo.vim'
Plug 'Yggdroot/indentLine'

" ============================================================================
" language_stuff
" ============================================================================

Plug 'neomake/neomake'
Plug 'tpope/vim-endwise'
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler', { 'for': 'ruby' }
Plug 'tpope/gem-browse', { 'for': 'ruby' }
Plug 'tpope/vim-rake', { 'for': 'ruby' }
Plug 'alvan/vim-closetag' " close html tags
Plug 'elzr/vim-json' " json syntax and highlighting
Plug 'pangloss/vim-javascript' " js syntax highlighting
Plug 'leafgarland/typescript-vim' " typescript highlighting
Plug 'mxw/vim-jsx' " javascript
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'rizzatti/dash.vim'
Plug 'elixir-lang/vim-elixir'
Plug 'kchmck/vim-coffee-script'

" ============================================================================
" testing
" ============================================================================

Plug 'tpope/vim-dispatch'
Plug 'thoughtbot/vim-rspec'
Plug 'radenling/vim-dispatch-neovim'

call plug#end()

" ============================================================================
" general_stuff
" ============================================================================

let mapleader = "," " set <leader> equal to ,

set clipboard=unnamed "fix copy-paste issues

set wildmode=longest,list,full " set wildmenu options
set wildmenu " see list for potential autocomplete options

set splitright " open new splits on the right
set splitbelow " open new splits below

set formatoptions+=t " set format options to use textwidth

set mouse=nicr " make it easier for other people to scroll on my machine

nmap <leader>h :Helptags<CR>
nmap <leader>f :let @+ = 'https://github.com/onemedical/onelife/blob/master/' . @% <bar> echo @%<CR>

nmap <leader>ss :w<CR>:terminal<CR>
vmap <leader>ss <ESC>:w<CR>:terminal<CR>
imap <leader>ss <ESC>:w<CR>:terminal<CR>

map <silent><leader>so :silent so ~/.config/nvim/init.vim<CR>:echo 'init.vim resourced'<CR>

cnoreabbrev ! Dispatch

" saving

inoremap <ESC> <ESC>`^<ESC>

nmap <leader>q :close<CR> " quit V
vmap <leader>q <ESC>:close<CR>
imap <leader>q <ESC>:close<CR>

nmap <leader>x :x<CR> " save & exit V
vmap <leader>x <ESC>:x<CR>
imap <leader>x <ESC>:x<CR>

" ============================================================================
" editing_stuff
" ============================================================================

set tabstop=2 shiftwidth=2 expandtab " automatically set the shift width
filetype plugin on " automatically close tags in various languages
set omnifunc=syntaxcomplete#Complete " closes tags

set hidden " keep edit history on hidden buffers
set directory=~/.vimswap " define which directory to save swap files

let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_silent = 1  " do not display the auto-save notification
let g:auto_save_in_insert_mode = 0  " do not save while in insert mode

set backspace=2 " make backspace work like most other apps

" function! TrimWhiteSpace()
"   %s/\s\+$//e
" endfunction
" autocmd BufWritePre * :call TrimWhiteSpace() " Removes trailing spaces
fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

nnoremap <Leader>ss :%s/
vnoremap <Leader>ss y:%s/<C-r>"/

                          " the below abbreviation helps me remember
                          " the syntax is for copying the current file
                          " into the current directory
cnoreabbrev sav sav %:h/

au BufEnter *.rb syn match error contained "\<binding.pry\>" " show binding.pry
" au BufEnter *.js *.jsx syn match error contained "\<debugger\>" " highlight debugger

let g:move_key_modifier = 'C'

noremap <leader>bo :BufOnly<CR>
noremap <leader>bb :only<CR>

" paste with indentation
nnoremap p p=`]

"copy just the text on the line
nnoremap yil ^yg_

" snippets

noremap <leader>s :Snippets<CR>
let g:UltiSnipsJumpForwardTrigger="<leader><tab>q"
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><tab>Q"
let g:UltiSnipsEditSplit="vertical"
set runtimepath+=~/dotfiles " makes sure that I look for snippets in dotfiles
let g:UltiSnipsSnippetsDir="~/dotfiles/UltiSnips"

" ============================================================================
" searching_stuff
" ============================================================================

set ignorecase " ignores case for searching
set smartcase " doesn't ignore case when upper case used
set incsearch " automatically go to the word while searching
set hlsearch " highlights all search matches
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR> " turn off highlight

" deoplete
let g:deoplete#enable_at_startup = 1

" use tab to forward cycle
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" use tab to backward cycle
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" ctrlsf

nnoremap <C-F> :CtrlSF
vnoremap <C-F> y:w<CR>:CtrlSF '<C-r>"'<CR>:%s/<C-r>"/
vnoremap <C-f> y:CtrlSF <C-r>"<CR>/<C-r>"<CR>

" fzf

noremap <silent><C-p> :silent GFiles<CR>
noremap <silent><C-a> :silent FZF<CR>
nnoremap <silent><C-b> :silent Buffers<CR>
noremap <LEADER>/ :silent BLines<CR>

let g:fzf_history_dir = '~/.local/share/fzf-history' " sets up command history

nnoremap <Leader>a yiw:Ag<Space><C-r>"<CR>
vnoremap <Leader>a y:Ag <C-r>"<CR>
cnoreabbrev AG Ag
cnoreabbrev ag Ag
cnoreabbrev a Ag

" ============================================================================
" navigation
" ============================================================================

nmap <silent><S-Tab> :silent bp<CR>
nmap <silent><Tab> :silent bn<CR>

" bufsurf

nmap <silent><BS> :silent BufSurfBack<CR>
nmap <silent>\ :silent BufSurfForward<CR>

" NERD

map <leader>ee :NERDTreeToggle<CR>
map <leader>ef :NERDTreeFind<CR>
let g:NERDShutUp = 1
let g:NERDDefaultNesting = 1
let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=2
let NERDTreeQuitOnOpen=0
let NERDTreeKeepTreeInNewTab=0
let NERDTreeMinimalUI=1
let NERDTreeShowLineNumbers=1
autocmd FileType nerdtree setlocal relativenumber

" ============================================================================
" git_stuff
" ============================================================================

" Assuming your remote is origin and you don't have unpushed commits on your copy of master:
" git fetch
" git rebase origin/master
" Edit: if you want to update your local copy of master as well, also assuming no unpushed commits on it, you can do a git fetch origin master:master instead of just a git fetch.

set diffopt+=vertical " fugitive make vertical

map <leader>gg :Git<CR>

map <leader>gs :Git stash<CR>
map <leader>gsp :Git stash pop<CR>

map <leader>gw :Gwrite<CR>
map <leader>gr :Gread<CR>

let g:magit_discard_untracked_do_delete=1

map <leader>gd<SPACE> :Gdiff<SPACE>
map <leader>gdm :Gdiff master<CR>

map <leader>gb :Git blame<CR>

" rewriting_history

map <leader>gri :Git rebase -i HEAD~
map <leader>gcp :Git cherry-pick -n

" commits

map <leader>gc :Gcommit --verbose<CR>
map <leader>gca :Gcommit --verbose --all<CR>
map <leader>gcnv :Gcommit --no-verify<CR>
map <leader>gcF :Gcommit --amend<CR>

" github

function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

map <leader>gp :Git push<CR>
map <leader>gpf :Git push --force<CR>
map <leader>gfr :Start git pull --rebase origin $(git branch --show-current)<CR>
map <leader>gfm :Git fetch origin master:master<CR>
map <leader>grom :Git rebase origin/master<CR>

" signify

let g:signify_vcs_list = ['git']

" merginal

autocmd BufFilePost Merginal:* setlocal relativenumber " buffers #s V
autocmd BufFilePost Merginal:* setlocal number

map <leader>gm :MerginalToggle<CR>

" ============================================================================
" make_it_look_pretty
" ============================================================================

set nowrap " no wrapping
set number " automatically turn line numbers on
set relativenumber " relative numbers

if has('mac')
  colorscheme gruvbox
  set background=light
  set termguicolors
endif

augroup quickfix
  autocmd!
  autocmd FileType qf setlocal wrap
augroup END

let g:startify_change_to_dir = 0

" airplane

set laststatus=2 " start up airplane
let g:airline_powerline_fonts = 1 " use fonts
let g:airline#extensions#tabline#enabled = 1 " airplane buffer tabs
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#fnamemod=':t'
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_section_c = ''
let g:airline_section_x = airline#section#create_right(['tagbar'])
let g:airline_section_y = airline#section#create_right(['filetype'])

" ============================================================================
" language_stuff
" ============================================================================

" linting

autocmd! BufWritePost * Neomake
au BufWritePost,BufEnter Neomake

map ]s :lnext<CR>
map [s :lprevious<CR>
map ]S :lfirst<CR>
map [S :llast<CR>

let g:neomake_ruby_enabled_makers = ['rubocop']
let g:neomake_javascript_enabled_makers = ['eslint']

nmap <leader>la :w<CR>:Dispatch yarn run lint<CR>
nmap <leader>ljs :w<CR>:Dispatch yarn run lint:fix %<CR>
nmap <leader>lr :w<CR>:Dispatch rubocop --auto-correct %<CR>

" html

runtime macros/matchit.vim " setup extended matching with %, eg html
let g:closetag_filenames = "*.html,*.erb,*.jsx" " closetags for html, jsx and erb
" format htMl
nmap <leader>m :%s/<[^>]*>/\r&\r/g<CR>:w<CR>:g/^$/d<CR>gg=G

" javascript

let g:vim_json_syntax_conceal = 0 " stop auto concealing for json in vim
let g:javascript_plugin_jsdoc = 1 " js syntax highlighting for plugin
augroup javascript_folding
  au!
  au FileType javascript setlocal foldmethod=syntax
augroup END

" rails

map <leader>db :Dispatch! bundle<CR>
map <leader>rmt :Rake db:migrate RAILS_ENV=test<CR>
map <leader>rm :Rake db:migrate<CR>
map <leader>rb :Rake db:rollback<CR>
map <leader>rmr :Rake db:migrate:reset<CR>
map <leader>rr :Rake routes<CR>
map <leader>rtp :Rake db:test:prepare<CR>
" map <leader>da :Dispatch bundle exec annotate -rp after<CR>
" map <leader>dgm :Rgenerate migration<space>
" map <leader>bi ibinding.pry<esc>:w<CR>
" map <leader>bo obinding.pry<esc>:w<CR>

" ============================================================================
" testing
" ============================================================================

" ruby testing with zeus

nmap <leader>z :w<CR>:call RunNearestSpec()<CR>
nmap <leader>zz :w<CR>:execute("Start zeus rspec --format documentation" . expand("%p") . ":" . line(".")) <CR>
nmap <leader>zs :w<CR>:execute ':Dispatch JS_DRIVER=selenium bundle exec rspec --format documentation %:' . line('.')<CR>
nmap <leader>zl :w<CR>:call RunLastSpec()<CR>

nmap <leader>Z :w<CR>:call RunCurrentSpecFile()<CR>
nmap <leader>ZZ :w<CR>:Start zeus rspec %<CR>
nmap <leader>Zs :w<CR>:Dispatch JS_DRIVER=selenium bundle exec rspec %<CR>

let g:rspec_command = "compiler rspec | set makeprg=zeus | Make rspec {spec}"
let g:rspec_runner = "os_x_iterm2"

" ruby testing sans zeus

nmap <leader>t :w<CR>:execute("Dispatch bundle exec rspec --format documentation --fail-fast " . expand("%p") . ":" . line(".")) <CR>
nmap <leader>tt :w<CR>:execute("Start bundle exec rspec --format documentation --fail-fast " . expand("%p") . ":" . line(".")) <CR>

nmap <leader>T :w<CR>:Dispatch bundle exec rspec --format documentation %<CR>
nmap <leader>TT :w<CR>:Start bundle exec rspec --format documentation --fail-fast %<CR>
nmap <leader>TA :w<CR>:Dispatch git diff --name-only master <bar> grep *spec* <bar> xargs rspec<CR>

" circle ci should probably have `gem install circle-cli`

map <leader>tci :!circle open<CR>

let g:circle_update_frequencey_in_seconds = 3
let g:circle_last_update = 0
let g:circle_last_status = ""

" function! SetCircleStatus(job_id, data, event) abort
"   if a:event == 'stdout'
"     let g:circle_last_status = join(a:data)
"   elseif a:event == 'stderr'
"     let g:circle_last_status = 'No internet'
"   else
"     let g:circle_last_status = 'ERROR'
"   endif
"   let g:circle_last_update = localtime()
" endfunction

" function! UpdateCircleStatus() abort
"   let current_time = localtime()
"   if current_time - g:circle_last_update > g:circle_update_frequencey_in_seconds
"     let g:circle_last_update = current_time
"     call jobstart('hub ci-status', {"on_stdout": function('SetCircleStatus'), "on_stderr": function('SetCircleStatus')})
"   endif
"   return g:circle_last_status
" endfunction

" let g:airline_section_c = "%{UpdateCircleStatus()}"

function! DoPrettyXML()
  " save the filetype so we can restore it later
  let l:origft = &ft
  set ft=
  " delete the xml header if it exists. This will
  " permit us to surround the document with fake tags
  " without creating invalid xml.
  1s/<?xml .*?>//e
  " insert fake tags around the entire document.
  " This will permit us to pretty-format excerpts of
  " XML that may contain multiple top-level elements.
  0put ='<PrettyXML>'
  $put ='</PrettyXML>'
  silent %!xmllint --format -
  " xmllint will insert an <?xml?> header. it's easy enough to delete
  " if you don't want it.
  " delete the fake tags
  2d
  $d
  " restore the 'normal' indentation, which is one extra level
  " too deep due to the extra tags we wrapped around the document.
  silent %<
  " back to home
  1
  " restore the filetype
  " exe "set ft=" . l:origft
endfunction
command! PrettyXML call DoPrettyXML()


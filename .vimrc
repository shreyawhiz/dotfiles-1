""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Make Vim more useful
set nocompatible

" Enable filetype plugins
filetype plugin on
filetype indent on

" Uses bash as shell and prevents PATH variable from being prefixed
set shell=bash\ --norc

" Allow backspace in insert mode
set backspace=indent,eol,start

" Hide buffers instead of closing them
set hidden

" Ignore case when searching
set ignorecase

" Show search matches while typing
set incsearch

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:plug_home = '~/.vim/plugged'

call plug#begin()

Plug 'airblade/vim-gitgutter'
Plug 'ap/vim-css-color'
Plug 'bling/vim-airline'
Plug 'bkad/CamelCaseMotion'
Plug 'cakebaker/scss-syntax.vim'
Plug 'chase/vim-ansible-yaml'
Plug 'chriskempson/base16-vim'
Plug 'corntrace/bufexplorer'
Plug 'dag/vim-fish', { 'for': 'fish' }
Plug 'digitaltoad/vim-jade', { 'for': 'jade' }
Plug 'docunext/closetag.vim'
Plug 'edkolev/promptline.vim'
Plug 'ekalinin/Dockerfile.vim', { 'for': 'Dockerfile' }
Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
Plug 'heavenshell/vim-jsdoc'
Plug 'jimmyhchan/dustjs.vim'
Plug 'jtratner/vim-flavored-markdown'
Plug 'justinmk/vim-gtfo'
Plug 'juvenn/mustache.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'kien/ctrlp.vim'
Plug 'leshill/vim-json', { 'for': 'json' }
Plug 'majutsushi/tagbar'
Plug 'moll/vim-node'
Plug 'myhere/vim-nodejs-complete'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'Shougo/neocomplete.vim'
Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'vim-scripts/Align'
Plug 'vim-scripts/Crunch'
Plug 'vim-scripts/directionalWindowResizer'
Plug 'vim-scripts/gitignore.vim'
Plug 'vim-scripts/tComment'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'

call plug#end()

" Install plugins if this is the first run
if !isdirectory(expand(g:plug_home))
  PlugInstall
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" User Interface
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set background color to dark
set background=dark

" Draw a vertical ruler at column 80
" execute "set colorcolumn=" . join(range(81,335), ',')

" Highlight current line
set cursorline

" Adds - as a word separator
set iskeyword-=-

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Highlight unwanted whitespace
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_

" Show whitespace
set list

" For regular expressions turn magic on
set magic

" Disables annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Set line numbers
set number

" Show ruler
set ruler

" Minimum of 5 lines above and below cursor must be visible
set scrolloff=5

" Don't show short message when starting Vim
set shortmess=atI

" Show the (partial) command as it’s being typed
set showcmd

" Show matching brackets
set showmatch

" Override 'ignorecase' if search pattern containers uppercase characters
set smartcase

" Lowers timeout length between commands
set timeoutlen=250

" Optimize for fast terminals
set ttyfast

" Enables autocomplete menu
set wildmode=longest:full
set wildmenu

" Wrap long lines
set wrap

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and Fonts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable syntax highlighting
syntax on
colorscheme base16-default

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Highlight trailing whitespace
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd BufRead,InsertLeave * match ExtraWhitespace /\s\+$/

" Highlight too-long lines
autocmd BufRead,InsertEnter,InsertLeave * 2match OverLength /\%126v.*/
highlight OverLength ctermbg=black guibg=black
autocmd ColorScheme * highlight OverLength ctermbg=black guibg=black

" Set up highlight group & retain through colorscheme changes
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files, Backups, and Undo
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
  set undodir=~/.vim/undo
endif

" Use UTF-8 encoding without BOM
set encoding=utf-8 nobomb

" Don't add empty newlines at the end of files
set noeol

" Ignore certain files
set wildignore+=*.pyc,*.o,*.class,*.lo,.git,*/coverage/*,*/node_modules/*,*/vendor/*

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File-specific
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

compiler ruby

autocmd FileType php setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4

autocmd FileType tex setlocal textwidth=78
autocmd BufNewFile,BufRead *.txt setlocal textwidth=78

autocmd FileType ruby runtime ruby_mappings.vim

if version >= 700
  autocmd BufNewFile,BufRead *.txt setlocal spell spelllang=en_us
  autocmd FileType tex setlocal spell spelllang=en_us
endif

augroup markdown
  au!
  au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

" Autoremove trailing spaces when saving the buffer
autocmd FileType ruby,c,cpp,java,php,html autocmd BufWritePre <buffer> :%s/\s\+$//e

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indentation
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use spaces
set expandtab

" Use 2 characters per indent
set shiftwidth=2
set softtabstop=2
set tabstop=2

" Disable maximum text width
set textwidth=0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Navigation
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Miscellaneous
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" Fast saving
nmap <leader>w :w!<cr>

" Fast quitting
nmap <leader>q :q<cr>

" Fast save + quit
nmap <leader>wq :wqa!<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Airline
let g:airline_theme = 'bubblegum'
let g:airline#extensions#promptline#snapshot_file = "~/dotfiles/.promptline.sh"
let g:airline_powerline_fonts = 1

" ESLint
let g:syntastic_javascript_checkers = ['eslint']

" JSDOC
nmap <silent> <C-m> <Plug>(jsdoc)

" neocomplete
let g:neocomplete#enable_at_startup = 1
inoremap <expr> <TAB>   pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : ""

" NERDTree
let NERDTreeIgnore=['\.pyc', '\.o', '\.class', '\.lo', 'coverage', 'node_modules']
let NERDTreeHijackNetrw = 0
map <silent> <LocalLeader>nt :NERDTreeToggle<CR>
map <silent> <LocalLeader>nr :NERDTree<CR>
map <silent> <LocalLeader>nf :NERDTreeFind<CR>

" Promptline
let g:promptline_theme = 'airline'
let g:promptline_preset = {
  \ 'a'    : [ promptline#slices#host() ],
  \ 'b'    : [ promptline#slices#user() ],
  \ 'c'    : [ promptline#slices#cwd() ],
  \ 'y'    : [ promptline#slices#vcs_branch() ],
  \ 'z'    : [ promptline#slices#git_status() ],
  \ 'warn' : [ promptline#slices#last_exit_code() ]}

" Tagbar
map <silent> <LocalLeader>s :Tagbar<CR>

" TComment
map <silent> <LocalLeader>cc :TComment<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Trim trailing whitespace
function! Trim()
  %s/\s*$//
endfunction
command! -nargs=0 Trim :call Trim()
nnoremap <silent> <Leader>cw :Trim<CR>

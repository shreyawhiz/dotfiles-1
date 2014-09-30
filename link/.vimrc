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
" NeoBundle
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle'))

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'

NeoBundle 'MarcWeber/vim-addon-mw-utils'
NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'ap/vim-css-color'
NeoBundle 'benmills/vim-commadown'
NeoBundle 'benmills/vimux'
NeoBundle 'bentruyman/vimux-ruby-test'
NeoBundle 'bkad/CamelCaseMotion'
NeoBundle 'cakebaker/scss-syntax.vim'
NeoBundle 'corntrace/bufexplorer'
NeoBundle 'dag/vim-fish'
NeoBundle 'danheberden/vim-slantstatus'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'docunext/closetag.vim'
NeoBundle 'ekalinin/Dockerfile.vim'
NeoBundle 'garbas/vim-snipmate'
NeoBundle 'groenewege/vim-less'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'heavenshell/vim-jsdoc'
NeoBundle 'jgdavey/vim-turbux'
NeoBundle 'jimmyhchan/dustjs.vim'
NeoBundle 'jtratner/vim-flavored-markdown'
NeoBundle 'justinmk/vim-gtfo'
NeoBundle 'juvenn/mustache.vim'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'leshill/vim-json'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'moll/vim-node'
NeoBundle 'othree/html5.vim'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'rodjek/vim-puppet'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'terryma/vim-expand-region'
NeoBundle 'tomtom/tlib_vim'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-ragtag'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-surround'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'vim-scripts/Align'
NeoBundle 'vim-scripts/Crunch'
NeoBundle 'vim-scripts/gitignore.vim'
NeoBundle 'vim-scripts/tComment'
NeoBundle 'walm/jshint.vim'
NeoBundle 'xolox/vim-misc'
NeoBundle 'xolox/vim-notes'

NeoBundleCheck

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" User Interface
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set background color to dark
set background=dark

" Draw a vertical ruler at column 80
execute "set colorcolumn=" . join(range(81,335), ',')

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
colorscheme hybrid

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
set wildignore+=*.pyc,*.o,*.class,*.lo,.git,*/node_modules/*,*/vendor/*

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

" ESLint
let g:syntastic_javascript_checkers = ['eslint']

" NERDTree
let NERDTreeIgnore=['\.pyc', '\.o', '\.class', '\.lo', 'node_modules']
let NERDTreeHijackNetrw = 0
map <silent> <LocalLeader>nt :NERDTreeToggle<CR>
map <silent> <LocalLeader>nr :NERDTree<CR>
map <silent> <LocalLeader>nf :NERDTreeFind<CR>

" slantstatus
call slantstatus#Segment('\ %{mode()}\ ', 26, 253)      " mode
call slantstatus#Segment('%-3.3n', 244, 255)            " buffer number
call slantstatus#Segment('', 241, 18)
call slantstatus#Segment('\ %f', 237, 253)              " filename
call slantstatus#Segment('switch', 0, 0)                " right-side
call slantstatus#Segment('', 239, 232)
call slantstatus#Segment('', 243, 232)
call slantstatus#Segment('', 246, 232)
call slantstatus#Segment('%16.(%l/%L,%c%V%)', 249, 232) " Line #, Total Line, Column
call slantstatus#Segment('%3p%%', 166, 229)              " % of file

" TComment
map <silent> <LocalLeader>cc :TComment<CR>

" Vimux
let g:VimuxUseNearestPane = 1
map <silent> <LocalLeader>rl :wa<CR> :VimuxRunLastCommand<CR>
map <silent> <LocalLeader>vi :wa<CR> :VimuxInspectRunner<CR>
map <silent> <LocalLeader>vk :wa<CR> :VimuxInterruptRunner<CR>
map <silent> <LocalLeader>vx :wa<CR> :VimuxClosePanes<CR>
map <silent> <LocalLeader>vp :VimuxPromptCommand<CR>
vmap <silent> <LocalLeader>vs "vy :call VimuxRunCommand(@v)<CR>
nmap <silent> <LocalLeader>vs vip<LocalLeader>vs<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Trim trailing whitespace
function! Trim()
  %s/\s*$//
endfunction
command! -nargs=0 Trim :call Trim()
nnoremap <silent> <Leader>cw :Trim<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Make Vim more useful
set nocompatible

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if !has("nvim")
  call plug#begin('~/.vim/plugged')
else
  call plug#begin('~/.config/nvim/plugged')
endif

Plug 'airblade/vim-gitgutter'
Plug 'albfan/nerdtree-git-plugin'
Plug 'ap/vim-css-color'
Plug 'bkad/CamelCaseMotion'
Plug 'cakebaker/scss-syntax.vim'
Plug 'chase/vim-ansible-yaml'
Plug 'corntrace/bufexplorer'
Plug 'digitaltoad/vim-jade', { 'for': 'jade' }
Plug 'docunext/closetag.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'ekalinin/Dockerfile.vim', { 'for': 'Dockerfile' }
Plug 'elixir-lang/vim-elixir'
Plug 'geekjuice/vim-mocha', { 'for': 'javascript' }
Plug 'gilsondev/searchtasks.vim'
Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
Plug 'heavenshell/vim-jsdoc'
Plug 'janko-m/vim-test'
Plug 'jimmyhchan/dustjs.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'justinmk/vim-gtfo'
Plug 'juvenn/mustache.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'leshill/vim-json', { 'for': 'json' }
Plug 'majutsushi/tagbar'
Plug 'mhinz/vim-startify'
Plug 'moll/vim-node'
Plug 'othree/html5.vim'
Plug 'othree/yajs.vim'
Plug 'scrooloose/nerdtree'
Plug 'shime/vim-livedown'
Plug 'svermeulen/vim-easyclip'
Plug 'terryma/vim-expand-region'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'vim-scripts/Align'
Plug 'vim-scripts/Crunch'
Plug 'vim-scripts/bash-support.vim'
Plug 'vim-scripts/gitignore.vim'
Plug 'vim-scripts/nginx.vim'
Plug 'vim-scripts/tComment'
Plug 'w0ng/vim-hybrid'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'

" vim plugins
if !has('nvim')
  Plug 'scrooloose/syntastic'
endif

" neovim plugins
if has('nvim')
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  Plug 'benekastah/neomake', { 'commit': 'cfd24b0' }
  Plug 'kassio/neoterm'
  Plug 'Shougo/deoplete.nvim'
endif

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

" Disables annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Show line numbers
set number

" Minimum of 5 lines above and below cursor must be visible
set scrolloff=5

" Don't show short message when starting Vim
set shortmess=atI

" Show matching brackets
set showmatch

" Allow for both case sensitive and insensitive searching based on the pattern
set ignorecase
set smartcase

" Optimize for fast terminals
set ttyfast

" Enables autocomplete menu
set wildmode=longest:full

" Wrap long lines
set wrap

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and Fonts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set colorscheme
colorscheme hybrid

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Highlight trailing whitespace
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd BufRead,InsertLeave * match ExtraWhitespace /\s\+$/

" Highlight lines longer than 120 characters
autocmd BufRead,InsertEnter,InsertLeave * 2match OverLength /\%120v.*/
highlight OverLength ctermbg=red guibg=#5f0000 guifg=#cc6666

" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=#5f0000 guifg=#cc6666

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files, Backups, and Undo
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
  set undodir=~/.vim/undo
endif

" Don't add empty newlines at the end of files
set noeol

" Ignore certain files
set wildignore+=
      \.git,
      \*/coverage/*,
      \*/dist/*,
      \*/jspm_packages/*,
      \*/node_modules/*,
      \*/tmp/*
      \*/vendor/*

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File-specific
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd FileType markdown setlocal spell spelllang=en_us

" Autoremove trailing spaces when saving the buffer
autocmd FileType css,html,javascript,markdown autocmd BufWritePre <buffer> :%s/\s\+$//e

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
let g:airline_theme = 'hybridline'
let g:airline_powerline_fonts = 1

" deoplete
let g:deoplete#enable_at_startup = 1

" EasyClip
let g:EasyClipShareYanks = 1

" ESLint
let g:syntastic_javascript_checkers = ['eslint']

" FZF
if !has('nvim')
  let g:fzf_height = 20
  map <C-p> :FZF<CR>
else
  map <C-p> :call fzf#run({
  \ 'sink': 'e',
  \ 'window': 'topleft 20new'})<CR>
endif

" JSDOC
nmap <silent> <C-m> <Plug>(jsdoc)

" vim-markdown
let g:markdown_fenced_languages = ['html', 'css', 'javascript', 'bash=sh']

" neocomplete
let g:neocomplete#enable_at_startup = 1
inoremap <expr> <TAB>   pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : ""

" neomake
if has('nvim')
  autocmd! BufWritePost * Neomake
endif

" neoterm
let g:neoterm_size = 30

" NERDTree
let NERDTreeIgnore=[
      \'coverage',
      \'dist',
      \'jspm_packages',
      \'node_modules',
      \'tmp',
      \'vendor'
      \]
let NERDTreeHijackNetrw = 0
map <silent> <LocalLeader>nt :NERDTreeToggle<CR>
map <silent> <LocalLeader>nr :NERDTree<CR>
map <silent> <LocalLeader>nf :NERDTreeFind<CR>

" Startify
let g:startify_list_order = ['dir', 'files', 'bookmarks']

" TComment
map <silent> <LocalLeader>cc :TComment<CR>

" vim-test
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

let test#javascript#mocha#options = '--recursive -R spec -b'

function! TestStrategy(cmd)
  execute 'T '.a:cmd
endfunction

let g:test#custom_strategies = {'test_strategy': function('TestStrategy')}
let g:test#strategy = 'test_strategy'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Trim trailing whitespace
function! Trim()
  %s/\s*$//
endfunction
command! -nargs=0 Trim :call Trim()
nnoremap <silent> <Leader>cw :Trim<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Development
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Reload vimrc when changed
augroup myvimrc
  au!
  au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc,init.vim so $MYVIMRC
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Map leader to <Space>
let mapleader = "\<Space>"
let maplocalleader = "\<Space>"

" Make Vim more useful
set nocompatible

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.config/nvim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'ap/vim-css-color'
Plug 'benekastah/neomake'
Plug 'bkad/CamelCaseMotion'
Plug 'cakebaker/scss-syntax.vim'
Plug 'carlitux/deoplete-ternjs'
Plug 'cespare/vim-toml'
Plug 'chase/vim-ansible-yaml'
Plug 'corntrace/bufexplorer'
Plug 'digitaltoad/vim-jade', { 'for': 'jade' }
Plug 'docunext/closetag.vim'
Plug 'dracula/vim'
Plug 'easymotion/vim-easymotion'
Plug 'edkolev/tmuxline.vim'
Plug 'ekalinin/Dockerfile.vim', { 'for': 'Dockerfile' }
Plug 'elixir-lang/vim-elixir'
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'fatih/vim-go'
Plug 'gilsondev/searchtasks.vim'
Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
Plug 'heavenshell/vim-jsdoc'
Plug 'janko-m/vim-test'
Plug 'jiangmiao/auto-pairs'
Plug 'jimmyhchan/dustjs.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install --no-update-rc' }
Plug 'justinmk/vim-gtfo'
Plug 'juvenn/mustache.vim'
Plug 'kassio/neoterm'
Plug 'kchmck/vim-coffee-script'
Plug 'leafgarland/typescript-vim' | Plug 'ianks/vim-tsx'
Plug 'majutsushi/tagbar'
Plug 'markcornick/vim-bats'
Plug 'mhartington/deoplete-typescript'
Plug 'mhinz/vim-startify'
Plug 'moll/vim-node'
Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
Plug 'osyo-manga/vim-over'
Plug 'othree/html5.vim'
Plug 'othree/yajs.vim'
Plug 'pangloss/vim-javascript'
Plug 'ryanoasis/vim-devicons' " Must load last
Plug 'scrooloose/nerdtree'
Plug 'shime/vim-livedown'
Plug 'Shougo/deoplete.nvim'
Plug 'SirVer/ultisnips'
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
Plug 'triglav/vim-visual-increment',
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'vim-scripts/Align'
Plug 'vim-scripts/Crunch'
Plug 'vim-scripts/gitignore.vim'
Plug 'vim-scripts/nginx.vim'
Plug 'vim-scripts/tComment'
Plug 'w0ng/vim-hybrid'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'zchee/deoplete-go', { 'do': 'make' }

let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

call plug#end()

" Install plugins if this is the first run
if !isdirectory(expand(g:plug_home))
  PlugInstall
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" User Interface
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Draw a vertical ruler at column 80
set colorcolumn=81

" Set clipboard to system
set clipboard=unnamed

" Highlight current line
set cursorline

" Hide buffers instead of closing them
set hidden

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

" Open split below and to the right
set splitbelow
set splitright

" Optimize for fast terminals
set ttyfast

" Enables autocomplete menu
set wildmode=longest:full

" Wrap long lines
set wrap

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and Fonts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set background color to dark
set background=dark

" Set colorscheme
colorscheme dracula

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Highlight trailing whitespace
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd BufRead,InsertLeave * match ExtraWhitespace /\s\+$/

" Highlight lines longer than 100 characters
autocmd BufRead,InsertEnter,InsertLeave * 2match OverLength /\%100v.*/
highlight OverLength ctermbg=red guibg=#5f0000 guifg=#cc6666

" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=#5f0000 guifg=#cc6666

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files, Backups, and Undo
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Centralize backups, swapfiles and undo history
set backupdir=~/.config/nvim/backups
set directory=~/.config/nvim/swaps
if exists("&undodir")
  set undodir=~/.config/nvim/undo
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
      \*/typings/*,
      \*/vendor/*

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File-specific
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Highlight Jenkinsfile as groovy
au BufRead,BufNewFile Jenkinsfile set filetype=groovy

" Spellcheck markdown
autocmd FileType markdown setlocal spell spelllang=en_us

" Autoremove trailing spaces when saving the buffer
autocmd FileType css,html,javascript,markdown
      \ autocmd BufWritePre <buffer> :%s/\s\+$//e

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

" Temporary workaround for: https://github.com/neovim/neovim/issues/2048
nmap <BS> <C-W>h

" Treat long lines as break lines (useful when moving around in them)
noremap j gj
noremap k gk

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif

" Easier split navigation
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Miscellaneous
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enter command-line mode easier
nmap ; :

" Exit out of neovim terminals easier
tnoremap <Leader><ESC> <C-\><C-n>

" Toggle paste mode on and off
noremap <leader>pp :setlocal paste!<cr>

" Fast saving
nnoremap <leader>w :w!<cr>

" Fast quitting
nnoremap <leader>q :q<cr>

" Fast save + quit
nnoremap <leader>wq :wqa!<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" deoplete
let g:deoplete#enable_at_startup = 1
inoremap <expr> <TAB>   pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : ""

" deoplete-ternjs
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = 0

" vim-devicons
let g:DevIconsEnableFoldersOpenClose = 1
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1

" EasyClip
let g:EasyClipShareYanks = 1

" ESLint
let g:syntastic_javascript_checkers = ['eslint']

" FZF
noremap <C-p> :call fzf#run({
      \ 'sink': 'e',
      \ 'window': 'topleft 20new'})<CR>

" vim-go
let g:go_fmt_command = "goimports"
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <leader>rt <Plug>(go-run-tab)
au FileType go nmap <Leader>rs <Plug>(go-run-split)
au FileType go nmap <Leader>rv <Plug>(go-run-vertical)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>e <Plug>(go-rename)
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" JSDOC
nmap <silent> <C-m> <Plug>(jsdoc)

" vim-markdown
let g:markdown_fenced_languages = [
      \ 'bash=sh',
      \ 'css',
      \ 'dockerfile',
      \ 'html',
      \ 'javascript',
      \ 'json',
      \ 'yaml']

" neomake
autocmd! BufWritePost * Neomake

" neoterm
let g:neoterm_size = 30

" NERDTree
let NERDTreeIgnore=[
      \'^coverage$',
      \'^dist$',
      \'^jspm_packages$',
      \'^node_modules$',
      \'^tmp$',
      \'^typings$',
      \'^vendor$'
      \]
let NERDTreeHijackNetrw = 0
noremap <silent> <LocalLeader>nt :NERDTreeToggle<CR>
noremap <silent> <LocalLeader>nr :NERDTree<CR>
noremap <silent> <LocalLeader>nf :NERDTreeFind<CR>

function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  exec 'autocmd FileType nerdtree highlight ' . a:extension .
        \' ctermbg='. a:bg .' ctermfg='. a:fg .
        \' guibg='. a:guibg .' guifg='. a:guifg
  exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', '#8C9440', 'none')
call NERDTreeHighlightFile('ini', 'yellow', 'none', '#DE935F', 'none')
call NERDTreeHighlightFile('md', 'blue', 'none', '#5F819D', 'none')
call NERDTreeHighlightFile('yml', 'yellow', 'none', '#DE935F', 'none')
call NERDTreeHighlightFile('config', 'yellow', 'none', '#DE935F', 'none')
call NERDTreeHighlightFile('conf', 'yellow', 'none', '#DE935F', 'none')
call NERDTreeHighlightFile('json', 'yellow', 'none', '#DE935F', 'none')
call NERDTreeHighlightFile('html', 'yellow', 'none', '#DE935F', 'none')
call NERDTreeHighlightFile('styl', 'cyan', 'none', '#5E8D87', 'none')
call NERDTreeHighlightFile('css', 'cyan', 'none', '#5E8D87', 'none')
call NERDTreeHighlightFile('coffee', 'Red', 'none', '#A54242', 'none')
call NERDTreeHighlightFile('js', 'Red', 'none', '#A54242', 'none')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#85678F', 'none')
call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#373B41', 'none')
call NERDTreeHighlightFile('gitconfig', 'Gray', 'none', '#373B41', 'none')
call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#373B41', 'none')
call NERDTreeHighlightFile('bashrc', 'Gray', 'none', '#373B41', 'none')
call NERDTreeHighlightFile('bashprofile', 'Gray', 'none', '#373B41', 'none')

" Startify
let g:startify_change_to_dir = 0
let g:startify_change_to_vcs_root = 1
let g:startify_list_order = ['dir', 'files', 'bookmarks']

" Tagbar
nnoremap <leader>tb :TagbarToggle<CR>

" TComment
noremap <silent> <LocalLeader>cc :TComment<CR>

" vim-test
nnoremap <silent> <leader>t :TestNearest<CR>
nnoremap <silent> <leader>T :TestFile<CR>
nnoremap <silent> <leader>a :TestSuite<CR>
nnoremap <silent> <leader>l :TestLast<CR>
nnoremap <silent> <leader>g :TestVisit<CR>

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
  ''
endfunction
command! -nargs=0 Trim :call Trim()
nnoremap <silent> <Leader>cw :Trim<CR>

" Search & Replace functions (uses vim-over):
function! VisualFindAndReplace()
  :OverCommandLine%s/
endfunction
function! VisualFindAndReplaceWithSelection() range
  :'<,'>OverCommandLine s/
endfunction
nnoremap <Leader>fr :call VisualFindAndReplace()<CR>
xnoremap <Leader>fr :call VisualFindAndReplaceWithSelection()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Development
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Reload vimrc when changed
augroup myvimrc
  au!
  au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc,init.vim so $MYVIMRC
augroup END

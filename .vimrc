set nocompatible
syntax on
filetype off

set colorcolumn=80
set ignorecase
set laststatus=2
set noshowmode
set hlsearch
set cul
set autoindent smartindent
set lazyredraw
set ttyfast
set incsearch
set encoding=utf-8
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set ignorecase
set ruler
set scrolloff=3
set smartcase
set mouse=a
set guifont=Source\ Code\ Pro\ for\ Powerline:h18

autocmd CompleteDone * pclose
autocmd BufWinLeave * call clearmatches()
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.json set filetype=json
autocmd VimResized * :wincmd =
autocmd BufWritePre *.go GoImports
autocmd BufWritePre * :FixWhitespace
autocmd VimEnter * RainbowParenthesesToggle
autocmd Syntax * RainbowParenthesesLoadRound
autocmd Syntax * RainbowParenthesesLoadSquare
autocmd Syntax * RainbowParenthesesLoadBraces
autocmd! BufEnter  *.jsx  let b:syntastic_checkers=['']

set rtp+=$GOROOT/misc/vim
set rtp+=~/.vim/bundle/Vundle.vim/

let mapleader="\<Space>"

let g:airline_powerline_fonts = 1
let g:multi_cursor_exit_from_insert_mode=0
let g:syntastic_html_checkers=[]
let g:ctrlp_working_path_mode = 'e'
let g:ctrlp_custom_ignore = '\v[\/]\.(node_modules)$'
let g:notes_directories = ['~/Documents/notes']
let g:UltiSnipsExpandTrigger='<tab>'

map <leader>n :NERDTreeToggle<CR>
map <silent> <leader><cr> :noh<cr>
nmap <leader>w :w!<cr>
nmap <leader>a :Ack!<space>
nmap <up> gk
nmap <down> gj
noremap <leader>y "*y
noremap <leader>yy "*Y
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>

if exists('$TMUX')
  set ttymouse=xterm2
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  let g:ackprg = 'ag --nogroup --column --smart-case --ignore-dir=node_modules'

  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor\ --smart-case

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'fatih/vim-go'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'digitaltoad/vim-jade'
Plugin 'groenewege/vim-less'
Plugin 'guns/vim-sexp'
Plugin 'honza/dockerfile.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'rizzatti/dash.vim'

Plugin 'Valloric/YouCompleteMe'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'nanotech/jellybeans.vim'
Plugin 'ChrisKempson/Vim-Tomorrow-Theme'
Plugin 'suan/vim-instant-markdown'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-notes'
Plugin 'SirVer/ultisnips'
Plugin 'tpope/vim-repeat'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'ag.vim'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/syntastic'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'mattn/emmet-vim'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'L9'
Plugin 'FuzzyFinder'

call vundle#end()

colorscheme Tomorrow-Night
filetype plugin indent on

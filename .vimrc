"To update run :source % then :PlugInstall
"Install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"Make sure to run :PlugInstall when you first run
"vim-plug plugins
call plug#begin('~/.vim/plugs')
Plug 'junegunn/vim-plug'

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'sheerun/vim-polyglot'

Plug 'w0rp/ale'

Plug 'Valloric/YouCompleteMe', { 'do': 'npm install -g typescript'}

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

call plug#end()

"Settings

"Numbering
set number
set ruler

"Spacing
filetype indent on
set expandtab
set softtabstop=4
set tabstop=4

"Workspacing
set hidden

"Cursor
set cursorline
set showmatch

"Search
set incsearch
set hlsearch

"Menu
set wildmenu

"Mappings
let mapleader=","

"Theme
let g:airline_theme='dark'

"NerdTree Open when no commands specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"Aliases
command Ygt YcmCompleter GoTo
command Ygd YcmCompleter GetDoc
command Ygr YcmCompleter GoToReferences

nnoremap <leader>f :Files<CR>

nnoremap <leader>g :Ygt<CR>
nnoremap <leader>gd :Ygd<CR>
nnoremap <leader>gr :Ygr<CR>

nnoremap <leader>t :NERDTreeFocus<CR>
nnoremap <leader>tf :NERDTreeFind<CR>
nnoremap <leader>tc :NERDTreeClose<CR>
nnoremap <leader>td :NERDTreeCWD<CR>

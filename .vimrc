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

    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'

    Plug 'sheerun/vim-polyglot'

    Plug 'w0rp/ale'

    if !exists('g:gui_oni')
        Plug 'scrooloose/nerdtree'
        Plug 'Xuyuanp/nerdtree-git-plugin'

        Plug 'Valloric/YouCompleteMe', { 'do': 'npm install -g typescript'}
    endif

    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'

    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'
    Plug 'wellle/targets.vim'
    Plug 'tpope/vim-sleuth'
call plug#end()

"Settings

set noswapfile

"Numbering
set number
set ruler

"Spacing
filetype indent on

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
color elflord
let g:airline_theme='dark'

"NerdTree Open when no commands specified
if !exists('g:gui_oni')
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
endif

"Aliases
command! Ygt YcmCompleter GoTo
command! Ygd YcmCompleter GetDoc
command! Ygr YcmCompleter GoToReferences

nnoremap <leader>f :Files<CR>
nnoremap <leader>fg :GFiles<CR>
nnoremap <leader>b :Buffers<CR>

nnoremap <leader>g :Ygt<CR>
nnoremap <leader>gd :Ygd<CR>
nnoremap <leader>gr :Ygr<CR>

nnoremap <leader>t :NERDTreeFocus<CR>
nnoremap <leader>tf :NERDTreeFind<CR>
nnoremap <leader>tc :NERDTreeClose<CR>
nnoremap <leader>td :NERDTreeCWD<CR>

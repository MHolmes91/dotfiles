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

    if !exists('g:gui_oni')
        Plug 'scrooloose/nerdtree'
        Plug 'Xuyuanp/nerdtree-git-plugin'

        Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
    endif

    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'

    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'
    Plug 'wellle/targets.vim'
    Plug 'tpope/vim-sleuth'

    Plug 'bkad/CamelCaseMotion'
    Plug 'vim-scripts/argtextobj.vim'
    Plug 'michaeljsmith/vim-indent-object'
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

"CoC
"https://github.com/neoclide/coc.nvim/blob/master/Readme.md#example-vim-configuration
let g:coc_global_extensions='coc-css coc-html coc-json coc-pairs coc-tsserver coc-eslint coc-prettier'
" Tab for completion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"


" Use K to show documentation in preview window

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

"Aliases
nnoremap <leader>f :Files<CR>
nnoremap <leader>fg :GFiles<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>c :Commits<CR>
nnoremap <leader>cb :BCommits<CR>

nmap <leader>g <Plug>(coc-definition)
nnoremap <leader> gd :call <SID>show_documentation()<CR>
nmap <leader>gt <Plug>(coc-type-definition)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>gi <Plug>(coc-coc-implementation)
nmap <leader> E <Plug>(coc-diagnostic-prev)
nmap <leader> e <Plug>(coc-diagnostic-next)

nnoremap <leader>t :NERDTreeFocus<CR>
nnoremap <leader>tf :NERDTreeFind<CR>
nnoremap <leader>tc :NERDTreeClose<CR>
nnoremap <leader>td :NERDTreeCWD<CR>
nnoremap <leader>tr :NERDTreeRefreshRoot<CR>

nnoremap <leader>h :GitGutterNextHunk<CR>
nnoremap <leader>H :GitGutterPrevHunk<CR>

command Sterm sp | wincmd w | resize 15 | term

"To update run :source % then :PlugInstall
"Install vim-plug
if !has("win32") && empty(glob('~/.vim/autoload/plug.vim'))
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

        Plug 'neoclide/coc.nvim', {'branch': 'release'}
    endif

    Plug 'janko/vim-test'

    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'

    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    Plug 'arithran/vim-delete-hidden-buffers'

    Plug 'myusuf3/numbers.vim'

    Plug 'tpope/vim-dadbod'

    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'
    Plug 'wellle/targets.vim'
    Plug 'tpope/vim-sleuth'

    Plug 'bkad/CamelCaseMotion'
    Plug 'vim-scripts/argtextobj.vim'
    Plug 'michaeljsmith/vim-indent-object'
    Plug 'tpope/vim-repeat'
    Plug 'justinmk/vim-sneak'
call plug#end()

" Settings

set noswapfile
set smartcase

"Numbering
set number
set ruler

"Titling
set title
set titleold=

"Update more often so COC runs smoother
set updatetime=300

"Adds gutter
set signcolumn=yes

"Splitting
set noea

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

" numbers.vim
let g:numbers_exclude = ['nerdtree', 'fugitive']

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

" vim-test
if has('nvim')
  let test#strategy = "neovim"
  let test#neovim#term_position = "vertical rightbelow"
else
  let test#strategy = "vimterminal"
  let test#vim#term_position = "vertical rightbelow"
endif

"CoC
"Make sure to run CocInstall when you first run
"https://github.com/neoclide/coc.nvim/blob/master/Readme.md#example-vim-configuration
let g:coc_global_extensions=['coc-vetur','coc-svg','coc-angular','coc-css','coc-html','coc-json','coc-pairs','coc-tsserver','coc-eslint','coc-prettier','coc-python','coc-markdownlint']

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
nnoremap <leader>rg :Rg<CR>

command! -nargs=0 CocFormat :call CocAction('format')
command! -nargs=0 CocOrganize :call CocAction('runCommand', 'editor.action.organizeImport')

nmap <leader>g <Plug>(coc-definition)
nnoremap <leader>gd :call <SID>show_documentation()<CR>
nmap <leader>gt <Plug>(coc-type-definition)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>E <Plug>(coc-diagnostic-prev)
nmap <leader>e <Plug>(coc-diagnostic-next)
nmap <leader>p :CocFormat<CR>
nmap <leader>o :CocOrganize<CR>

nnoremap <leader>T :TestLast<CR>
nnoremap <leader>Tn :TestNearest<CR>
nnoremap <leader>Tf :TestFile<CR>
nnoremap <leader>Ts :TestSuite<CR>
nnoremap <leader>Tl :TestLast<CR>
nnoremap <leader>Tv :TestVisit<CR>

nnoremap <leader>t :NERDTreeFocus<CR>
nnoremap <leader>tf :NERDTreeFind<CR>
nnoremap <leader>tc :NERDTreeClose<CR>
nnoremap <leader>td :NERDTreeCWD<CR>
nnoremap <leader>tr :NERDTreeRefreshRoot<CR>

nnoremap <leader>h :GitGutterNextHunk<CR>
nnoremap <leader>H :GitGutterPrevHunk<CR>

" Splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Easy windows
nnoremap <leader>wc <C-W>c
nnoremap <leader>wo <C-W>o

nnoremap <leader>w+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <leader>w- :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <leader>w< :exe "vertical resize " . (winwidth(0) * 2/3)<CR>
nnoremap <leader>w> :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <leader>w= :wincmd =<CR>

" Terminal exit
if has('nvim')
  tnoremap <leader><Esc> <C-\><C-n>
endif

" Custom Commands
command Sterm sp | wincmd w | resize 15 | term

" Styling

highlight Pmenu ctermbg=234 ctermfg=7 guibg=234 guifg=7 cterm=italic gui=italic
" Better split styling
highlight VertSplit cterm=none ctermbg=none
" No tildes at end of buffer
highlight EndOfBuffer ctermfg=black ctermbg=black

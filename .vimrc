syntax on

let mapleader = " "

filetype plugin indent on

set incsearch
set number
set relativenumber
set tabstop=4
set showmatch
set foldenable
set foldlevelstart=10
set foldmethod=indent

nnoremap Q @q
nnoremap u uzz
nnoremap <C-r> <C-r>zz

nnoremap H ^zz
nnoremap L $zz
nnoremap % %zz
nnoremap { {zz
nnoremap } }zz
nnoremap n nzz
nnoremap N Nzz
nnoremap j gjzz
nnoremap k gkzz
nnoremap o o<ESC>zz
nnoremap O O<ESC>zz
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" <leader> functions
nnoremap <leader>w :w<CR>
nnoremap <leader>e :Ex<CR>
nnoremap \ :Ex<CR>
nnoremap <leader>/ :noh<CR>
nnoremap <leader>d :bd<CR>

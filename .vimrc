let mapleader = " "


" Vim Plug
" https://github.com/junegunn/vim-plug
call plug#begin()

" List your plugins here
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mbbill/undotree'
Plug 'christoomey/vim-tmux-navigator'

call plug#end()

let g:undotree_WindowLayout = 3

colorscheme catppuccin_mocha

hi Normal guibg=NONE ctermbg=NONE

set clipboard=unnamedplus
set foldenable
set foldlevelstart=10
set foldmethod=indent
set incsearch
set number
set relativenumber
set scrolloff=99999
set showmatch
set tabstop=4
set termguicolors

function ClearBackground()
	hi Normal guibg=NONE ctermbg=NONE
endfunction

function SwitchToLightMode()
	colorscheme catppuccin_latte
	call ClearBackground()
endfunction

nnoremap Q @q
nnoremap u uzz
nnoremap <C-r> <C-r>zz
nnoremap <leader><leader><leader><leader> :q!<CR>

nnoremap H ^zz
nnoremap L $zz
nnoremap % %zz
nnoremap { {zz
nnoremap } }zz
nnoremap gg ggzz
nnoremap G Gzz
nnoremap N Nzz
nnoremap n nzz
nnoremap j gjzz
nnoremap k gkzz
nnoremap o o<ESC>zz
nnoremap O O<ESC>zz
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" <leader> functions
nnoremap <leader>w :w<CR>
nnoremap <leader>u :UndotreeToggle<CR>
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fo :History<CR>
nnoremap <leader>gs :GFiles<CR>
nnoremap <leader><TAB> :Buffers<CR>
nnoremap <leader>th :Colors<CR>
nnoremap <leader>lm :call SwitchToLightMode()<CR>
nnoremap \ :Ex<CR>
nnoremap <leader>/ :noh<CR>
nnoremap <leader>d :bd<CR>

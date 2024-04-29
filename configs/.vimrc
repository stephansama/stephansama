syntax on

let mapleader = " "

let g:rustfmt_autosave = 1
let g:airline_theme='onedark'

if executable('pylsp')
    " pip install python-lsp-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pylsp',
        \ 'cmd': {server_info->['pylsp']},
        \ 'allowlist': ['python'],
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
    
    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" Vim-Plug
call plug#begin()
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
" AI
Plug 'TabbyML/vim-tabby'
" Languages
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'wuelnerdotexe/vim-astro' 						"astro
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } 	"go
Plug 'rust-lang/rust.vim' 							"rust
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
call plug#end()

filetype plugin indent on
set incsearch
set number
set relativenumber
set tabstop=4
set showmatch
set foldenable
set foldlevelstart=10
set foldmethod=indent

colorscheme onedark
hi Normal guibg=NONE ctermbg=NONE

" remaps

" macro
nnoremap Q @q
" undo / redo
nnoremap u uzz
nnoremap <C-r> <C-r>zz
" movement
" begin / end
nnoremap Y y$
nnoremap H ^zz
nnoremap L $zz
nnoremap % %zz
nnoremap { {zz
nnoremap } }zz
nnoremap n nzz
nnoremap N Nzz
nnoremap G Gzz
nnoremap gg ggzz
nnoremap j gjzz
nnoremap k gkzz
nnoremap o o<ESC>zz
nnoremap O O<ESC>zz
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
" selection "
nnoremap cw ciw
nnoremap c' ci'
nnoremap c" ci"
nnoremap dw diw
nnoremap d' di'
nnoremap d" di"
nnoremap vw viw
nnoremap v' vi'
nnoremap v" vi"
nnoremap yw yiw
nnoremap y' yi'
nnoremap y" yi"
" use system register
nnoremap y "*y
xnoremap y "*y
" leader functions
nnoremap <leader>w :w<CR>
nnoremap <leader>e :Ex<CR>
nnoremap \ :vsp<CR>:Ex<CR>
nnoremap <leader>/ :noh<CR>
nnoremap <leader>t :term<CR>
nnoremap <leader>% :source %<CR>
nnoremap <leader>lsp :LspInstall<CR>
nnoremap gh :LspHover<CR>
nnoremap <C-x> :x<CR>

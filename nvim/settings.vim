syntax on
set background=light
" set relativenumber
" set number
set mouse=a
set cursorline
set splitbelow splitright
filetype plugin on
filetype plugin indent on

set suffixes^=/

autocmd BufEnter * silent! :lcd%:p:h

let g:netrw_banner=0

" tab length
set noexpandtab

" Remove trailing white spaces
" autocmd BufWritePre * %s/\s\+$//e

" At least 7 lines padding in scrolling
" set so=3

" Always show current position
set ruler

set laststatus=2

set statusline=\ %F%m%r%h\ %w

" Sync system clipboard
set clipboard+=unnamedplus

" Make sure capital W will work when saving a file
command! -nargs=0 Wq wq
command! -nargs=0 W write
command! -nargs=0 WQ wq
command! -nargs=0 Q q

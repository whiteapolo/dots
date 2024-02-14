syntax on
set background=light
set relativenumber
set number
set mouse=a
set cursorline
set splitbelow splitright
filetype plugin on
filetype plugin indent on

autocmd BufEnter * silent! :lcd%:p:h

let g:netrw_banner=0
" let g:netrw_liststyle=

" tab length
set tabstop=8
set shiftwidth=8
set softtabstop=8
set noexpandtab

" Remove trailing white spaces
autocmd BufWritePre * %s/\s\+$//e

" At least 7 lines padding in scrolling
set so=7

" Always show current position
set ruler

set laststatus=2

set statusline=\ %F%m%r%h\ %w\

" Sync system clipboard
set clipboard+=unnamedplus

" Make sure capital W will work when saving a file
command! -nargs=0 Wq wq
command! -nargs=0 W write
command! -nargs=0 WQ wq
command! -nargs=0 Q q

" Make string highlight in c file
au BufNewFile,BufRead * syntax keyword cType bin_tr_t
au BufNewFile,BufRead * syntax keyword cType info_t
au BufNewFile,BufRead * syntax keyword cType queue_t
au BufNewFile,BufRead * syntax keyword cType lll_t
au BufNewFile,BufRead * syntax keyword cType vrtx_t
au BufNewFile,BufRead * syntax keyword cType stk_t
au BufNewFile,BufRead * syntax keyword cType trenary_tr_t
au BufNewFile,BufRead * syntax keyword cType grp_t
au BufNewFile,BufRead * syntax keyword cType avl_tr_t
au BufNewFile,BufRead * syntax keyword cType general_tr_t
au BufNewFile,BufRead * syntax keyword cType clll_t
au BufNewFile,BufRead * syntax keyword cType dc_list_t
au BufNewFile,BufRead * syntax keyword cType dlist_t


" comments in itallic
highlight Comment cterm=italic gui=italic

" highlight Normal ctermbg=234

highlight CocFloating ctermbg=235
highlight CocFloatThumb ctermbg=230
highlight CocFloatActive ctermbg=230

" highlight LineNr cterm=NONE ctermbg=235 ctermfg=166
highlight LineNr cterm=NONE ctermfg=239
highlight CursorLine cterm=NONE ctermbg=235
highlight CursorLineNr cterm=NONE ctermbg=235

highlight Search ctermbg=238
highlight Visual ctermbg=238



let g:line_number_mode = 2
function! ToggleRelativeNumbers()
	if g:line_number_mode == 0
		set number
		set rnu
		let g:line_number_mode = 1
	elseif g:line_number_mode == 1
		set number
		set nornu
		let g:line_number_mode = 2
	else
		set nornu
		set nonumber
		let g:line_number_mode = 0
    endif
endfunction

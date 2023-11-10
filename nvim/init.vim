"        _                    
"       (_)                   
" __   ___ _ __ ___  _ __ ___ 
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__ 
"   \_/ |_|_| |_| |_|_|  \___|
"                             
                             
"""""""""""""""""""""""""""""""
"						PLUGINS					  "
"""""""""""""""""""""""""""""""

call plug#begin('~/.local/share/nvim/Plugged')

Plug 'ap/vim-css-color'
Plug 'tpope/vim-commentary'

call plug#end()



"""""""""""""""""""""""""""""""
"						COLORS					  "
"""""""""""""""""""""""""""""""

"highlight LineNr cterm=NONE ctermbg=235 ctermfg=166
highlight CursorLine cterm=NONE ctermbg=235
highlight CursorLineNr cterm=NONE ctermbg=235 ctermfg=166




"""""""""""""""""""""""""""""""
"						FUNCTIONS					"
"""""""""""""""""""""""""""""""

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

let g:line_number_mode = 1
function! ToggleRelativeNumbers()
    if g:line_number_mode
        set nornu
        let g:line_number_mode = 0
    else
        set rnu
        let g:line_number_mode = 1
    endif
endfunction

" Auto completion
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction

"""""""""""""""""""""""""""""""
"						MAPPING						"
"""""""""""""""""""""""""""""""

" Scroll 3 lines and zz
nnoremap <A-j> 2<C-d>zz
nnoremap <A-k> 2<C-u>zz
nnoremap <A-h> :tabp<CR>
nnoremap <A-l> :tabn<CR>

" Replace all aliases to S.
nnoremap S :%s//g<Left><Left>

" Clear all highlights after search 
nnoremap <space>c :noh<CR>

" Toggle relative number 
nnoremap <space>r :call ToggleRelativeNumbers()<CR>

" resizing tabs
nnoremap <A-Left> :vertical resize +3<CR>
nnoremap <A-Right> :vertical resize -3<CR>
nnoremap <A-Up> :resize +3<CR>
nnoremap <A-Down> :resize -3<CR>

nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

set wildmode=list:longest,list:full

" Auto completion on tab
inoremap <expr> <tab> InsertTabWrapper()
inoremap <s-tab> <c-n>



"""""""""""""""""""""""""""""""
"						BORING						"
"""""""""""""""""""""""""""""""
syntax on
set background=light
set relativenumber
set number
set mouse=a
set cursorline
set splitbelow splitright

" Tabstop is 2
set tabstop=2 
set expandtab
"set noexpandtab
set shiftwidth=2
set softtabstop=2


" Sync system clipboard
set clipboard+=unnamedplus

" Make sure capital W will work when saving a file
command! -nargs=0 Wq wq
command! -nargs=0 W write
command! -nargs=0 WQ wq

" Make string highlight in c file
autocmd VimEnter * :syntax keyword cType string

" comments in itallic
highlight Comment cterm=italic gui=italic

" At least 7 lines padding in scrolling
set so=7

" Always show current position
set ruler

set laststatus=2

set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c


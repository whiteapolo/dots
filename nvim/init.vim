"       _                    
"       (_)                   
" __   ___ _ __ ___  _ __ ___ 
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__ 
"   \_/ |_|_| |_| |_|_|  \___|
"                             
                             
""""""""""""""""""""""""""""""""
"          PLUGINS             "
""""""""""""""""""""""""""""""""

call plug#begin('~/.local/share/nvim/Plugged')

Plug 'ap/vim-css-color'
Plug 'tpope/vim-commentary'
Plug 'bfrg/vim-cpp-modern'
Plug 'neovim/nvim-lspconfig'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vimlab/split-term.vim'
Plug 'ellisonleao/gruvbox.nvim'
Plug 'Mofiqul/vscode.nvim'

call plug#end()




nnoremap <space><space> :call CocAction('diagnosticToggle')<CR>
" nnoremap bd :set background=dark<CR>
" nnoremap bl :set background=light<CR>


""""""""""""""""""""""""""""""""
"             COC              "
""""""""""""""""""""""""""""""""
let g:coc_node_path = '/usr/local/bin/node'

filetype plugin on

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm(): "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <c-@> coc#refresh()

filetype plugin indent on

let b:coc_diagnostic_disable=1

""""""""""""""""""""""""""""""""
"         LOOK AND FEEL        "
""""""""""""""""""""""""""""""""

highlight CocFloating ctermbg=235
highlight CocFloatThumb ctermbg=230
highlight CocFloatActive ctermbg=230

highlight LineNr cterm=NONE ctermbg=235 ctermfg=166
highlight CursorLine cterm=NONE ctermbg=235
highlight CursorLineNr cterm=NONE ctermbg=235 ctermfg=166

if exists("g:neovide")
  set guifont=Cascadia\ Code:h15
endif


""""""""""""""""""""""""""""""""
"          FUNCTIONS           "
""""""""""""""""""""""""""""""""
let g:line_number_mode = 0
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

" Auto completion
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction

" Coc Auto completion check 
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

""""""""""""""""""""""""""""""""
"          MAPPING             "
""""""""""""""""""""""""""""""""

" Scroll 3 lines and zz
nnoremap <A-j> 2<C-d>zz
nnoremap <A-k> 2<C-u>zz
nnoremap <c-j> 5<C-d>zz
nnoremap <c-k> 5<C-u>zz

" nnoremap L :tabn<CR>
" nnoremap H :tabp<CR>
nnoremap <TAB> :tabn<CR>
nnoremap <S-TAB> :tabp<CR>


" nnoremap <A-h> <C-w>h
" nnoremap <A-l> <C-w>l
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" tnoremap <C-k> <C-w>k


" Replace all aliases to S.
nnoremap S :%s//g<Left><Left>

" Add a syntax highlight rule
" nnoremap <S-c> <Nop>
nnoremap <space>t :syntax keyword cType 


" Clear all highlights after search 
nnoremap <space>c :noh<CR>

" Toggle relative number 
nnoremap <space>r :call ToggleRelativeNumbers()<CR>

" resizing tabs
nnoremap <A-Left> :vertical resize +3<CR>
nnoremap <A-Right> :vertical resize -3<CR>
nnoremap <A-Up> :resize +3<CR>
nnoremap <A-Down> :resize -3<CR>

" nnoremap <A-Enter> <C-\><C-n>:term<CR>

set wildmode=list:longest,list:full

" Auto completion on tab
" inoremap <expr> <tab> InsertTabWrapper()
" inoremap <s-tab> <c-n>

" Change the mapping of the command window
nnoremap <Space>: q:
nnoremap q: :

nnoremap gg gg0
nnoremap G G0

nnoremap <A-Enter> :Term<CR>




""""""""""""""""""""""""""""""""
"          BORING              "
""""""""""""""""""""""""""""""""
syntax on
set background=light
" set relativenumber
" set number
set mouse=a
set cursorline
set splitbelow splitright

" tab length
set tabstop=8
" set expandtab
set noexpandtab
set shiftwidth=8
set softtabstop=8


" Sync system clipboard
set clipboard+=unnamedplus

" Make sure capital W will work when saving a file
command! -nargs=0 Wq wq
command! -nargs=0 W write
command! -nargs=0 WQ wq
command! -nargs=0 Q q

" Make string highlight in c file
autocmd VimEnter * :syntax keyword cType string
autocmd VimEnter * :syntax keyword cType STK_TYPE
autocmd VimEnter * :syntax keyword cType Stack
autocmd VimEnter * :syntax keyword cType List
autocmd VimEnter * :syntax keyword cType Box

" comments in itallic
highlight Comment cterm=italic gui=italic

" At least 7 lines padding in scrolling
set so=7

" Always show current position
set ruler

set laststatus=2

set statusline=\ %F%m%r%h\ %w\ 

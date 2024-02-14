" Scroll 3 lines and zz
nnoremap <A-j> 2<C-d>zz
nnoremap <A-k> 2<C-u>zz
nnoremap <c-j> 5<C-d>zz
nnoremap <c-k> 5<C-u>zz


" Replace all aliases to S.
nnoremap S :%s//g<Left><Left>

" Add a syntax highlight rule
" nnoremap <S-c> <Nop>
nnoremap <space>t :syntax keyword cType


" Clear all highlights after search
nnoremap <space>c :noh<CR>
nnoremap <ESC> :noh<CR>:<CR>
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

nnoremap <space><space> :call CocAction('diagnosticToggle')<CR>

nnoremap <TAB>  <C-w>
nnoremap <C-a> <C-w>
inoremap <C-a> <ESC><C-w>
tnoremap <C-a> <C-\><C-n><C-w>

" switching between tabs
nnoremap <S-TAB> :tabn<CR>
" nnoremap <S-TAB> :tabp<CR>
" nnoremap <S-TAB> :tabp<CR>

nnoremap <space>fb :Telescope buffers<CR>
nnoremap <space>ff :Telescope file_browser path=%:p:h select_buffer=true <CR>
nnoremap <space>fm :Telescope man_pages<CR>

" nnoremap <space>fb :Buffers<CR>
" nnoremap <space>ff :Files<CR>
" nnoremap <space>fm :Telescope man_pages<CR>

nnoremap <enter> :!
nnoremap <S-enter> <ESC>

nnoremap <C-A-right> :bn<CR>
nnoremap <C-A-left> :bp<CR>

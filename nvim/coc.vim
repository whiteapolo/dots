let g:coc_node_path = '/usr/local/bin/node'

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm(): "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <c-@> coc#refresh()

" Look and feel
hi! Pmenu ctermfg=0 ctermbg=4
hi! PmenuSel ctermfg=4 ctermbg=0
hi! CocPumMenu ctermfg=0 ctermbg=4
hi! CocMenuSel ctermfg=0 ctermbg=12
hi! CocPumSearch ctermfg=NONE ctermbg=NONE cterm=bold


let b:coc_diagnostic_disable=1
au BufNewFile,BufRead * let b:coc_diagnostic_disable=1

" Coc Auto completion check
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Auto completion
" function! InsertTabWrapper()
"     let col = col('.') - 1
"     if !col || getline('.')[col - 1] !~ '\k'
"         return "\<tab>"
"     else
"         return "\<c-p>"
"     endif
" endfunction


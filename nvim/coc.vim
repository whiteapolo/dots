let g:coc_node_path = '/usr/local/bin/node'

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm(): "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <c-@> coc#refresh()

au BufNewFile,BufRead * let b:coc_diagnostic_disable=1

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" vim native autocompletion

	" set wildmenu

	" set omnifunc=syntaxcomplete#Complete
	" set complete+=k
	" " set completeopt=menu,menuone,noinsert
	" set completeopt=longest,menu,menu,noinsert
	" let g:completion_trigger_keyword_length=1


	" inoremap <expr> <Tab> TabComplete()
	" fun! TabComplete()
	"     if getline('.')[col('.') - 2] =~ '\K' || pumvisible()
	"         return "\<C-N>"
	"     else
	"         return "\<Tab>"
	"     endif
	" endfun
	

	" inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"
	" autocmd InsertCharPre * call AutoComplete()
	" fun! AutoComplete()
	"     if v:char =~ '\K'
	"         \ && getline('.')[col('.') - 4] !~ '\K'
	"         \ && getline('.')[col('.') - 3] =~ '\K'
	"         \ && getline('.')[col('.') - 2] =~ '\K' " last char
	"         \ && getline('.')[col('.') - 1] !~ '\K'
	
	"         call feedkeys("\<C-N>", 'n')
	"     end
	" endfun


" " Closing compaction in insert mode
	inoremap [ []<left>
	inoremap ( ()<left>
	inoremap { {}<left>
	inoremap " ""<left>
	inoremap /* /**/<left><left>
	

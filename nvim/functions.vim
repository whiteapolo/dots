fun Highlight_keywords()
	syntax keyword cType bin_tr_t info_t queue_t lll_t vrtx_t stk_t trenary_tr_t
	syntax keyword cType grp_t Graph avl_tr_t general_tr_t clll_t dc_list_t dlist_t
	syntax keyword cType uchar ushort uint u64 u32 u16 u8 i64 i32 i16 i8
	syntax keyword cType Bitboard Player BoardType Vector2 Tile Board StringBuffer
	syntax keyword cType StringBuilder FenBuilder Move Color Trie Line Dict Glypn
	syntax keyword cType Cmd Sbuilder Sbuffer HistoryEntry DynamicArray Vertex
	syntax keyword cType dict_t token_t sbuffer_t sbuilder_t graph_t vertex_t array_t dict_entry_t
	syntax keyword cType Stack Array List CList DList Queue DictEntry Dict Token TokenType 
	syntax keyword cType Node NodeType stack map mapEntry list string Map String
	syntax keyword cType avlNode
	syntax keyword cStatement FOR_RANGE FOR
endfun

fun Init_coc()
	let g:coc_node_path = '/usr/local/bin/node'
	inoremap <silent><expr> <TAB>
				\ coc#pum#visible() ? coc#pum#next(1) :
				\ CheckBackspace() ? "\<Tab>" :
				\ coc#refresh()
	inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
	inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm(): "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
	inoremap <silent><expr> <c-@> coc#refresh()
	inoremap [ []<left>
	inoremap ( ()<left>
	inoremap { {}<left>
	inoremap " ""<left>

	fun CheckBackspace() abort
		let col = col('.') - 1
		return !col || getline('.')[col - 1]  =~ '\s'
	endfun
endfun

fun Disable_coc_diagnostics()
	au BufNewFile,BufRead * let b:coc_diagnostic_disable=1
endfun

fun Disable_coc()
	let g:coc_start_at_startup=0
endfun

let g:line_number_mode = 0
fun ToggleRelativeNumbers()
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
endfun

fun SetTab(amt)
	execute 'set tabstop=' . a:amt
    execute 'set shiftwidth=' . a:amt
    execute 'set softtabstop=' . a:amt
endfun

let g:tab_state = 0
fun ToggleTab()
	if g:tab_state == 1
		call SetTab(8)
		let g:tab_state = 0
	else
		call SetTab(4)
		let g:tab_state = 1
	endif
endfun

fun Init_settings()
	set ignorecase
	syntax on
	set splitbelow splitright
	filetype plugin on
	filetype plugin indent on
	set wildmode=list:longest,list:full
	set noshowmode
	set suffixes^=/
	set mouse=a
	set noexpandtab
	set so=4
	set ruler
	set laststatus=2
	set statusline=\ %F%m%r%h\ %w
	set clipboard+=unnamedplus
	command! -nargs=0 Wq wq
	command! -nargs=0 W write
	command! -nargs=0 WQ wq
	command! -nargs=0 Q q

	" mouse scrolling multiplayer
	" set mousescroll=ver:2

	" init current dir
	autocmd BufEnter * silent! :lcd%:p:h

	" Highlight keywords
	au BufNewFile,BufRead * call Highlight_keywords()

	" syntax highliting to st.conf
	autocmd BufEnter st.conf silent! :set filetype=kitty.conf

	" syntax highliting to mysh files
	au BufRead,BufNewFile *.mysh set filetype=mysh
endfun

fun Init_keymap()
	" Scrolling...
	nnoremap <A-j> 2<C-d>zz
	nnoremap <A-k> 2<C-u>zz
	nnoremap <c-j> 5<C-d>zz
	nnoremap <c-k> 5<C-u>zz

	" switching between buffers tabs
	nnoremap <S-TAB> :bn<CR>
	nnoremap <C-TAB> :bp<CR>
	nnoremap <C-w> :bd<CR>

	" Replace all aliases to S.
	nnoremap S :%s//g<Left><Left>
	vnoremap S :s//g<Left><Left>

	" Clear all highlights after search
	nnoremap <ESC> :noh<CR><C-l><CR>

	" Toggle relative number
	nnoremap <space>r :call ToggleRelativeNumbers()<CR>

	" resizing tabs
	nnoremap <A-Left> :vertical resize +3<CR>
	nnoremap <A-Right> :vertical resize -3<CR>
	nnoremap <A-Up> :resize +3<CR>
	nnoremap <A-Down> :resize -3<CR>

	"  Disable mappings
	nnoremap <enter> <Nop>
	nnoremap <S-l> <Nop>
	nnoremap <S-h> <Nop>
	nnoremap <S-k> <Nop>

	" Center g movments
	nnoremap gg gg0
	nnoremap G G0

	" window operation
	nnoremap <TAB>  <C-w>
endfun

fun Init_folds()
	augroup remember_folds
		autocmd!
		autocmd BufWinLeave * mkview
		autocmd BufWinEnter * silent! loadview
	augroup END

	set foldmethod=syntax
	set foldcolumn=1
endfun

fun Luke_colors()
	colorscheme vim
	set background=light
	set notermguicolors
	hi Folded ctermbg=236 ctermfg=7
	hi Comment ctermfg=7
	hi FoldColumn ctermfg=7
	hi foldcolumn ctermbg=0
endfun

fun Dracula_colors()
	set termguicolors
	colorscheme dracula
endfun

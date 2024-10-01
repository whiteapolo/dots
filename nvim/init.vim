"       (_)
" __   ___ _ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|

fun HighlightKeywords()
	syntax keyword cType bin_tr_t info_t queue_t lll_t vrtx_t
	syntax keyword cType stk_t trenary_tr_t grp_t Graph avl_tr_t
	syntax keyword cType general_tr_t clll_t dc_list_t dlist_t
	syntax keyword cType uchar ushort uint u64 u32 u16 u8 i64 i32 i16 i8
	syntax keyword cType Bitboard Player BoardType Vector2 Tile Board
	syntax keyword cType StringBuffer StringBuilder FenBuilder Move
	syntax keyword cType Color Trie Line Dict Glypn Cmd Sbuilder Sbuffer
	syntax keyword cType HistoryEntry DynamicArray Vertex dict_t token_t
	syntax keyword cType sbuffer_t sbuilder_t graph_t vertex_t array_t
	syntax keyword cType dict_entry_t Stack Array List CList DList Queue
	syntax keyword cType DictEntry Dict Token TokenType Node NodeType
	syntax keyword cType stack map mapEntry list string Map String
	syntax keyword cType avlNode strStack strView Regex queue Logo
	syntax keyword cStatement FOR_RANGE FOR FOR2
endfun

fun InitCoc()
	let g:coc_node_path = '/usr/local/bin/node'

	inoremap <silent><expr> <TAB>
				\ coc#pum#visible() ? coc#pum#next(1) :
				\ CheckBackspace() ? "\<Tab>" :
				\ coc#refresh()

	inoremap <expr><S-TAB>
				\ coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

	inoremap <silent><expr> <CR>
				\ coc#pum#visible() ? coc#pum#confirm() :
				\ "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

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

fun SetTab(amt)
	let &tabstop = a:amt
	let &shiftwidth = a:amt
	let &softtabstop = a:amt
endfun

fun InitSettings()
	set ignorecase
	syntax on
	set splitbelow splitright
	filetype plugin on
	filetype plugin indent on
	set wildmode=list:longest,list:full
	" set noshowmode
	set suffixes^=/
	set mouse=a
	set so=4
	set ruler
	set laststatus=2
	set nowrap
	set statusline=\ %F%m%r%h\ %w
	set clipboard+=unnamedplus
	let g:netrw_banner=0
	command! -nargs=0 Wq wq
	command! -nargs=0 W write
	command! -nargs=0 WQ wq
	command! -nargs=0 Q q

	" mouse scrolling multiplayer
	" set mousescroll=ver:2

	" init current dir
	autocmd BufEnter ?* silent! :lcd%:p:h

	" remove trailing spaces
	autocmd BufWritePre * :%s/\s\+$//e

	" Highlight keywords
	au BufNewFile,BufRead ?* call HighlightKeywords()

	" syntax highliting to st.conf
	autocmd BufEnter st.conf silent! :set filetype=kitty.conf

	" syntax highliting to mysh files
	au BufRead,BufNewFile ?*.mysh set filetype=mysh
endfun

fun InitKeymap()
	" Scrolling...
	" nnoremap <A-j> 2<C-d>zz
	" nnoremap <A-k> 2<C-u>zz
	nnoremap <c-j> 5<C-d>zz
	nnoremap <c-k> 5<C-u>zz
	nnoremap <PageDown> <C-d>zz
	nnoremap <PageUp> <C-u>zz

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

	" Disable mappings
	nnoremap <enter> <Nop>
	nnoremap <S-l> <Nop>
	nnoremap <S-h> <Nop>
	nnoremap <S-k> <Nop>

	" Center g movments
	nnoremap gg gg0
	nnoremap G G0

	" window operation
	nnoremap <TAB>  <C-w>

	nnoremap <space>f :Ex<CR>
	nnoremap <space><space> :bd<CR>
endfun

fun AutoSaveFolds()
	augroup remember_folds
		autocmd!
		autocmd BufWinLeave ?* mkview
		autocmd BufWinEnter ?* silent! loadview
	augroup END
endfun

fun InitFolds()
	call AutoSaveFolds()
	set foldmethod=syntax
	set foldcolumn=1
	set foldnestmax=1
endfun

fun ShowNumbers()
	set norelativenumber
	set number
endfun

fun ShowRelativeNumbers()
	set relativenumber
	set number
endfun

fun HideNumbers()
	set nonumber
	set norelativenumber
endfun

fun LukeColors()
	colorscheme vim
	set background=light
	set notermguicolors
	set laststatus=0
	" hi CocMenuSel ctermbg=12 ctermfg=235
	hi CocMenuSel ctermbg=7 ctermfg=235
	hi CocSearch ctermfg=7
	hi CocFloating ctermbg=235
	hi Folded ctermbg=236 ctermfg=7
	hi Comment ctermfg=7
	hi FoldColumn ctermfg=238
	hi foldcolumn ctermbg=0
	hi Visual ctermbg=7
	hi StatusLine ctermfg=7
	hi TabLine cterm=NONE ctermbg=237 ctermfg=15
endfun

fun DraculaColors()
	set termguicolors
	colorscheme dracula
endfun

fun EnableTreeSitter()
	" call AutoSaveFolds()
	autocmd VimEnter ?* TSEnable highlight
	set foldlevel=20
	set foldmethod=expr
	set foldexpr=nvim_treesitter#foldexpr()
	set foldnestmax=1
	lua vim.opt.foldtext = ""
endfun

fun DisableCocDiagnostics()
	au BufNewFile,BufRead ?* let b:coc_diagnostic_disable=1
	"""
endfun

fun DisableCoc()
	let g:coc_start_at_startup=0
	"""
endfun

fun InitPlugins()
	call plug#begin('~/.local/share/nvim/plugged')
	Plug 'ap/vim-css-color'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'pacha/vem-tabline'
	Plug 'tpope/vim-commentary'
	Plug 'bfrg/vim-cpp-modern'
	Plug 'whiteapolo/mygruvbox'
	Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
	Plug 'rose-pine/neovim'
	Plug 'jnurmine/Zenburn'
	Plug 'dracula/vim'
	call plug#end()
endfun

fun Init()
	call InitPlugins()
	call InitCoc()
	call InitSettings()
	call InitKeymap()
	call HighlightKeywords()
	call DisableCocDiagnostics()
	call InitFolds()
	call SetTab(4)
	call LukeColors()
	" call DraculaColors()
	call ShowRelativeNumbers()
endfun

" START
call Init()
set guicursor=n-v-c:block

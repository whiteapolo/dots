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
	syntax keyword cType avlNode strStack strView Regex queue Logo Result PipeMode
	syntax keyword cType heap graph priorityQueue Scanner strSlice sizedPriorityQueue
	syntax keyword cStatement FOR_RANGE FOR FOR2
	syntax keyword cConstant Err Ok Read Write
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
	syntax on
	set ignorecase
	filetype plugin on
	filetype plugin indent on
	set wildmode=list:longest,list:full
	set suffixes^=/
	set mouse=a
	set so=5
	set ruler
	set nowrap
	set clipboard+=unnamedplus
	set laststatus=0
	command! -nargs=0 Wq wq
	command! -nargs=0 W write
	command! -nargs=0 WQ wq
	command! -nargs=0 Q q

	" cursor to block
	" set guicursor=n-v-c:block

	" disable highlight of matching paren
	let g:loaded_matchparen=1

	" init current dir
	" autocmd BufEnter ?* silent! :lcd%:p:h

	" remove trailing spaces
	autocmd BufWritePre * :%s/\s\+$//e
	" autocmd BufEnter ?* set noautochdir

	" Highlight keywords
	au BufNewFile,BufRead ?* call HighlightKeywords()

	" syntax highliting to st.conf
	autocmd BufEnter st.conf silent! :set filetype=kitty.conf

	" syntax highliting to mysh files
	au BufRead,BufNewFile ?*.mysh set filetype=mysh
endfun

fun InitKeymap()
	" scrolling
	nnoremap <PageDown> 5jzz
	nnoremap <PageUp> 5kzz

	" switching between buffers tabs
	nnoremap <S-TAB> :bn<CR>
	nnoremap <C-TAB> :bp<CR>
	nnoremap <C-w> :bd<CR>

	" Replace all aliases to S.
	nnoremap S :%s//g<Left><Left>
	vnoremap S :s//g<Left><Left>

	" Clear all highlights after search
	nnoremap <ESC> :noh<CR><C-l>

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

	" file explorer
	" nnoremap <space>f :Ex<CR>
	nnoremap <space>f :Telescope find_files<CR>
	" nnoremap <space>f :Telescope file_browser<CR>
	" move text in visual
	vnoremap J :m '>+1<CR>gv=gv
	vnoremap K :m '<-2<CR>gv=gv
	" cursor stayed with J
	nnoremap J mzJ`z

	nnoremap n nzzzv
	nnoremap N Nzzzv
endfun

fun AutoSaveFolds()
	augroup remember_folds
		autocmd!
		autocmd BufWinLeave ?* mkview
		autocmd BufWinEnter ?* silent! loadview
	augroup END
endfun

fun InitFolds()
	" call AutoSaveFolds()
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

fun DisableCocDiagnostics()
	" disable coc diagnostics
	au BufNewFile,BufRead ?* let b:coc_diagnostic_disable=1
endfun

fun DisableCocOnStartup()
	"" disable coc
	let g:coc_start_at_startup=0
endfun

fun InitColorScheme()
	set background=dark
	colorscheme gruvbox
	hi Normal guibg=#232323
endfun

fun InitPlugins()
	call plug#begin('~/.local/share/nvim/plugged')
	Plug 'ap/vim-css-color'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'pacha/vem-tabline'
	Plug 'tpope/vim-commentary'
	Plug 'bfrg/vim-cpp-modern'
	Plug 'whiteapolo/mygruvbox'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
	Plug 'nvim-telescope/telescope-file-browser.nvim'
	Plug 'desdic/telescope-rooter.nvim'
	call plug#end()
endfun

fun Neovide()
	set guifont=IosevkaTerm\ Nerd\ Font\ Mono:h18
endfun


fun Init()
	call InitPlugins()
	call InitCoc()
	call InitSettings()
	call InitKeymap()
	call DisableCocDiagnostics()
	call InitFolds()
	call SetTab(4)
	call ShowRelativeNumbers()
	call InitColorScheme()
	call Neovide()
endfun

call Init()

let g:netrw_banner = 0
let g:netrw_winsize = 30

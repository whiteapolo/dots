fun InitCoc()
	" let g:coc_node_path = '/usr/local/bin/node'

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

	autocmd User CocIdle autocmd BufEnter *.rs silent! CocCommand rust-analyzer.clearFlycheck
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
	set guicursor=n-v-c:block

	" disable highlight of matching paren
	let g:loaded_matchparen=1

	" init current dir
	autocmd BufEnter ?* silent! :lcd%:p:h

	" remove trailing spaces
	autocmd BufWritePre * :%s/\s\+$//e
	" autocmd BufEnter ?* set noautochdir

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
	" nnoremap <C-TAB> :bp<CR>
	" nnoremap <C-w> :bd<CR>
	nnoremap <space>k :bd<CR>

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
	" nnoremap <TAB>  <C-w>

	" file explorer
	" nnoremap <space>f :Ex<CR>
	" nnoremap <space>f :Telescope find_files<CR>
	nnoremap <space>f :Ex<CR>
	nnoremap <space>r :Rexplore<CR>
	" nnoremap <space>f :Telescope file_browser<CR>

	" move text in visual
	vnoremap J :m '>+1<CR>gv=gv
	vnoremap K :m '<-2<CR>gv=gv

	" cursor stayed with J
	nnoremap J mzJ`z

	nnoremap n nzzzv
	nnoremap N Nzzzv

	let g:compile_command = "./build.sh"
	let g:run_command = "./exe &"

	nnoremap <space><enter> :!
	nnoremap <space>c :let g:compile_command=""<left>
	nnoremap <space>r :let g:run_command=""<left>
	nnoremap <A-r> :execute '!' . g:run_command<CR>
	nnoremap <A-c> :cexpr system(g:compile_command)<CR>:copen<CR>
	nnoremap <A-m> :execute '!' . g:compile_command . " && " . g:run_command<CR>

	nnoremap <C-]> :cnext<CR>
	nnoremap <C-[> :cprev<CR>

endfun

fun AutoSaveFolds()
	let saved_cwd = getcwd()
	augroup remember_folds
		autocmd!
		autocmd BufWinLeave ?* mkview
		autocmd BufWinEnter ?* silent! loadview
	augroup END
    execute 'cd' saved_cwd
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
	" set background=dark
	" colorscheme gruvbox
	" hi Normal guibg=#212121
	colorscheme gruber-darker
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
	Plug 'blazkowolf/gruber-darker.nvim'
	Plug 'jnurmine/Zenburn'
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
	" call InitFolds()
	call SetTab(4)
	call ShowRelativeNumbers()
	call InitColorScheme()
	call Neovide()
endfun

call Init()

" let g:netrw_banner = 0
" let g:netrw_winsize = 30

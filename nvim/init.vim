"       _
"       (_)
" __   ___ _ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|
"
call plug#begin('~/.local/share/nvim/Plugged')

Plug 'ap/vim-css-color'
Plug 'tpope/vim-commentary'
Plug 'bfrg/vim-cpp-modern'
Plug 'neovim/nvim-lspconfig'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ellisonleao/gruvbox.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

source ~/.config/nvim/mapping.vim
source ~/.config/nvim/settings.vim
source ~/.config/nvim/coc.vim
source ~/.config/nvim/functions.vim
source ~/.config/nvim/theme.vim

let g:fzf_vim = {}
let g:fzf_vim.preview_window = []

if exists("g:neovide")
	let g:neovide_transparency = 0.85
	let g:neovide_scroll_animation_length = 0.10
  	set guifont=JetBrains\ Mono\ NL:h10 "17
  	set background=dark
	let g:neovide_padding_top = 20
	let g:neovide_padding_bottom = 20
	let g:neovide_padding_right = 20
	let g:neovide_padding_left = 20
	colorscheme gruvbox
endif

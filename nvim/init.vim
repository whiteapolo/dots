"       _
"       (_)
" __   ___ _ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|
"
call plug#begin('~/.local/share/nvim/plugged')

Plug 'ap/vim-css-color'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

call plug#end()

" let g:coc_start_at_startup=0

source ~/.config/nvim/mapping.vim
source ~/.config/nvim/settings.vim
source ~/.config/nvim/coc.vim
source ~/.config/nvim/functions.vim
source ~/.config/nvim/theme.vim

if exists("g:neovide")
	let s:guifontsize=15
	let s:guifont="IosevkaTerm\\ Nerd\\ Font\\ Mono"
	" let g:neovide_transparency = 0.85
	let g:neovide_scroll_animation_length = 0.10
	set guifont=IosevkaTerm\ Nerd\ Font\ Mono:h10
  	set background=dark
	let g:neovide_padding_top = 10
	let g:neovide_padding_bottom = 10
	let g:neovide_padding_right = 10
	let g:neovide_padding_left = 10
	colorscheme gruvbox

	function! AdjustFontSize(amount)
		let s:guifontsize = s:guifontsize + a:amount
		execute "set guifont=" .. s:guifont .. ":h" .. s:guifontsize
	endfunction

	nnoremap <C-S-+> <cmd>call AdjustFontSize(+1)<cr>
	nnoremap <C-S--> <cmd>call AdjustFontSize(-1)<cr>
endif

call ToggleRelativeNumbers()

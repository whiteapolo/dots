"       (_)
" __   ___ _ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|
"

call plug#begin('~/.local/share/nvim/plugged')
Plug 'ap/vim-css-color'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pacha/vem-tabline'
Plug 'tpope/vim-commentary'
Plug 'bfrg/vim-cpp-modern'
Plug 'whiteapolo/mygruvbox'
Plug 'dracula/vim'
call plug#end()

source ~/.config/nvim/functions.vim

call Init_coc()
call Init_settings()
call Init_folds()
call Init_keymap()
call Highlight_keywords()
call Disable_coc_diagnostics()
call SetTab(4)
" call Luke_colors()
call Dracula_colors()

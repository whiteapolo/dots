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
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
call plug#end()

source ~/.config/nvim/functions.vim

call InitCoc()
call InitSettings()
call InitKeymap()
call HighlightKeywords()
call DisableCocDiagnostics()
call InitFolds()
call SetTab(4)
call LukeColors()
" call DraculaColors()

set nowrap

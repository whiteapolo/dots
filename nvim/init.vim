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
Plug 'vimlab/split-term.vim'
Plug 'ellisonleao/gruvbox.nvim'
Plug 'Mofiqul/vscode.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tomasiser/vim-code-dark'
" Plug 'unblevable/quick-scope'       " Plug
Plug 'xero/miasma.nvim'

call plug#end()


source ~/.config/nvim/mapping.vim
source ~/.config/nvim/settings.vim
source ~/.config/nvim/coc.vim

if exists("g:neovide")
  " set guifont=Cascadia\ Code:h14
  set guifont=JetBrains\ Mono\ NL:h16
  set background=dark
  colorscheme gruvbox
endif


highlight QuickScopePrimary cterm=underline
highlight QuickScopeSecondary cterm=underline

" hi TelescopeSelectionCaret ctermbg=5 ctermfg=5
" hi TelescopeMatching ctermbg=5 ctermfg=5
" hi TelescopePromptNormal ctermbg=5
" hi TelescopeResultsTitle ctermbg=5
"Background color
hi TelescopeNormal ctermfg=5
hi TelescopeMultiNormal ctermfg=5 ctermbg=5
hi TelescopeSelection ctermbg=235
hi TelescopePromptDirectory ctermfg=0 ctermbg=0


hi TelescopePreviewMatch ctermbg=5
hi TelescopeResultsBorder ctermfg=8
hi TelescopeBorder ctermfg=8


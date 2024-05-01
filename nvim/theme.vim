hi Comment ctermfg=7 cterm=italic gui=italic
hi nontext ctermfg=239
hi StatusLine ctermbg=236 ctermfg=15 cterm=NONE
hi StatusLineNC ctermbg=235 ctermfg=240 cterm=NONE
hi VertSplit ctermfg=238


highlight QuickScopePrimary cterm=underline
highlight QuickScopeSecondary cterm=underline

hi TelescopeNormal ctermfg=5
hi TelescopeMultiNormal ctermfg=5 ctermbg=5
hi TelescopeSelection ctermbg=235
hi TelescopePromptDirectory ctermfg=0 ctermbg=0

hi TelescopePreviewMatch ctermbg=5
hi TelescopeResultsBorder ctermfg=8
hi TelescopeBorder ctermfg=8

hi Directory ctermfg=12

" hi Normal ctermbg=234

hi CocFloating ctermbg=235
hi CocFloatThumb ctermbg=230
hi CocFloatActive ctermbg=230

" hi LineNr cterm=NONE ctermfg=16
hi CursorLine cterm=NONE ctermbg=235
hi CursorLineNr cterm=NONE ctermbg=235

hi Search ctermbg=238
hi Visual ctermbg=238

" Coc
hi! Pmenu ctermfg=235 ctermbg=4
hi! PmenuSel ctermfg=4 ctermbg=0 cterm=bold
hi! CocPumMenu ctermfg=235 ctermbg=4
hi! CocMenuSel ctermfg=235 ctermbg=12 cterm=bold
hi! CocPumSearch ctermfg=NONE ctermbg=NONE cterm=bold

" Highlight key words
au BufNewFile,BufRead * syntax keyword cType bin_tr_t
au BufNewFile,BufRead * syntax keyword cType info_t
au BufNewFile,BufRead * syntax keyword cType queue_t
au BufNewFile,BufRead * syntax keyword cType lll_t
au BufNewFile,BufRead * syntax keyword cType vrtx_t
au BufNewFile,BufRead * syntax keyword cType stk_t
au BufNewFile,BufRead * syntax keyword cType trenary_tr_t
au BufNewFile,BufRead * syntax keyword cType grp_t
au BufNewFile,BufRead * syntax keyword cType Graph
au BufNewFile,BufRead * syntax keyword cType avl_tr_t
au BufNewFile,BufRead * syntax keyword cType general_tr_t
au BufNewFile,BufRead * syntax keyword cType clll_t
au BufNewFile,BufRead * syntax keyword cType dc_list_t
au BufNewFile,BufRead * syntax keyword cType dlist_t
au BufNewFile,BufRead * syntax keyword cType uchar
au BufNewFile,BufRead * syntax keyword cType ushort
au BufNewFile,BufRead * syntax keyword cType uint
au BufNewFile,BufRead * syntax keyword cType u64
au BufNewFile,BufRead * syntax keyword cType u32
au BufNewFile,BufRead * syntax keyword cType u16
au BufNewFile,BufRead * syntax keyword cType u8
au BufNewFile,BufRead * syntax keyword cType i64
au BufNewFile,BufRead * syntax keyword cType i32
au BufNewFile,BufRead * syntax keyword cType i16
au BufNewFile,BufRead * syntax keyword cType i8
au BufNewFile,BufRead * syntax keyword cType Bitboard
au BufNewFile,BufRead * syntax keyword cType Player
au BufNewFile,BufRead * syntax keyword cType BoardType
au BufNewFile,BufRead * syntax keyword cType Vector2
au BufNewFile,BufRead * syntax keyword cType Tile
au BufNewFile,BufRead * syntax keyword cType Board
au BufNewFile,BufRead * syntax keyword cType Move
au BufNewFile,BufRead * syntax keyword cStatement FOR_RANGE
au BufNewFile,BufRead * syntax keyword cStatement FOR

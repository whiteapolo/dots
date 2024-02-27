let g:line_number_mode = 0
fun! ToggleRelativeNumbers()
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

let g:tab_state = 0
fun! ToggleTab()
	if g:tab_state == 1
		set tabstop=8
		set shiftwidth=8
		set softtabstop=8
		g:tab_state = 0
	else
		set tabstop=4
		set shiftwidth=4
		set softtabstop=4
		g:tab_state = 1
	endif
endfun

fun! s:openTerm()
	exe 'new'
	exe 'terminal'
	exe 'startinsert'
	tnoremap <buffer> <Esc> <C-\><C-n>
endf

command! -count -nargs=* Term call  s:openTerm()

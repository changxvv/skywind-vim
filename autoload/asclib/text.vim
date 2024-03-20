"======================================================================
"
" text.vim - 
"
" Created by skywind on 2024/03/19
" Last Modified: 2024/03/19 18:01
"
"======================================================================


"----------------------------------------------------------------------
" https://github.com/lilydjwg/dotvim 
"----------------------------------------------------------------------
function! asclib#text#match_at_cursor(pattern) abort
	return asclib#string#matchat(getline('.'), a:pattern, col('.') - 1)
endfunc


"----------------------------------------------------------------------
" get select text
"----------------------------------------------------------------------
function! asclib#text#get_selected(...) abort
	let mode = get(a:, 1, mode(1))
	let lines = asclib#compat#getregion("'<", "'>", mode)
	return join(lines, "\n")
endfunc


"----------------------------------------------------------------------
" filter current buffer
"----------------------------------------------------------------------
function! asclib#text#filter(line1, line2, command) abort
	let line1 = (type(a:line1) != v:t_number)? line(a:line1) : (a:line1)
	let line2 = (type(a:line2) != v:t_number)? line(a:line2) : (a:line2)
	let size = line2 - line1 + 1
	if line1 < line2
		let bid = bufnr('')
		call asclib#core#text_replace(bid, line1, size, command)
	endif
endfunc


"----------------------------------------------------------------------
" format the whole buffer
"----------------------------------------------------------------------
function! asclib#text#format(command) abort
	call asclib#text#filter(1, line('$'), a:command)
endfunc




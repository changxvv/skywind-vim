"======================================================================
"
" ui.vim - 
"
" Created by skywind on 2021/12/22
" Last Modified: 2022/09/04 22:45
"
"======================================================================

" vim: set ts=4 sw=4 tw=78 noet :

"----------------------------------------------------------------------
" internal
"----------------------------------------------------------------------
let g:asclib = get(g:, 'asclib', {})
let g:asclib.ui = get(g:asclib, 'ui', {})


"----------------------------------------------------------------------
" input
"----------------------------------------------------------------------
function! asclib#ui#input(prompt, text, name)
	if has_key(g:asclib.ui, 'input')
		return g:asclib.ui.input(a:prompt, a:text, a:name)
	endif
	call inputsave()
	try
		let t = input(a:prompt, a:text)
	catch /^Vim:Interrupt$/
		let t = ""
	endtry
	call inputrestore()
	return t
endfunc


"----------------------------------------------------------------------
" confirm
"----------------------------------------------------------------------
function! asclib#ui#confirm(msg, choices, default)
	if has_key(g:asclib.ui, 'confirm')
		return g:asclib.ui.confirm(a:msg, a:choices, a:default)
	endif
	call inputsave()
	try
		let hr = confirm(a:msg, a:choices, a:default)
	catch /^Vim:Interrupt$/
		let hr = 0
	endtry
	call inputrestore()
	return hr
endfunc


"----------------------------------------------------------------------
" inputlist
"----------------------------------------------------------------------
function! asclib#ui#inputlist(textlist)
	if has_key(g:asclib.ui, 'inputlist')
		return g:asclib.ui.inputlist(a:textlist)
	endif
	call inputsave()
	try
		let hr = inputlist(a:textlist)
	catch /^Vim:Interrupt$/
		let hr = -1
	endtry
	call inputrestore()
	return hr
endfunc


"----------------------------------------------------------------------
" select items
"----------------------------------------------------------------------
function! asclib#ui#select(title, textlist)
	if len(a:textlist) == 0
		return -1
	endif
	if has_key(g:asclib.ui, 'select')
		return g:asclib.ui.select(a:title, a:textlist)
	endif
	let textlist = [a:title]
	let index = 0
	for item in a:textlist
		let textlist += [printf('%d - %s', index + 1, item)]
		let index += 1
	endfor
	call inputsave()
	try
		let hr = inputlist(textlist)
	catch
		return -1
	endtry
	if hr < 0
		return -1
	endif
	return hr - 1
endfunc




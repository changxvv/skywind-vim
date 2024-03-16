"======================================================================
"
" gdb_mode.vim - 
"
" Created by skywind on 2024/03/14
" Last Modified: 2024/03/14 23:50:14
"
"======================================================================


"----------------------------------------------------------------------
" 
"----------------------------------------------------------------------
function! module#mode#gdb_mode#help()
	return 'F1: Info Locals, F2: Until, F3: Step, F4: Next'
endfunc


"----------------------------------------------------------------------
" 
"----------------------------------------------------------------------
function! module#mode#gdb_mode#init()
	noremap <F1> :call TermDebugSendCommand('info locals')<cr>
	noremap <F2> :Until<cr>
	noremap <F3> :Step<cr>
	noremap <F4> :Over<cr>
endfunc


"----------------------------------------------------------------------
" 
"----------------------------------------------------------------------
function! module#mode#gdb_mode#quit()
endfunc


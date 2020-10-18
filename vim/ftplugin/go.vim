" Delete/rename events get fired which confuses fswatch, let's use the autoformat plugin instead for this
let g:go_fmt_autosave = 0
let g:go_fmt_command = "goimports"
" let g:go_highlight_types = 1
" let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
" let g:go_highlight_variable_assignments = 1
let g:go_highlight_variable_declarations = 1

setlocal listchars=tab:\ \ ,trail:·,nbsp:·
setlocal noexpandtab

compiler go

command! -bang A call go#alternate#Switch(<bang>0, 'edit')
command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
command! -bang AS call go#alternate#Switch(<bang>0, 'split')

nmap <silent> gd <Plug>(coc-definition)
nnoremap gm :GoDecls<CR>


" Delete/rename events get fired which confuses fswatch, let's use the autoformat plugin instead for this
let g:go_fmt_autosave = 0
" TODO: do we need these? Is gopls doing this?
let g:go_imports_autosave = 0
let g:go_mod_fmt_autosave = 0
" These are handled by coc
let g:go_doc_keywordprg_enabled = 0
let g:go_def_mapping_enabled = 0
let g:go_gopls_enabled = 0

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

autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')

nmap <silent> gd <Plug>(coc-definition)
" BTags! output is better as is now, fzf/preview would need more tweaking
" nnoremap gm :GoDecls<CR>


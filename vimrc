" Based on https://github.com/thoughtbot/dotfiles
set encoding=utf-8

" Leader
let mapleader = " "

set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
" Replaced by incsearch plugin
" set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set modelines=0   " Disable modelines as a security precaution
set nomodeline

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

" Add  custom mappings to ReplaceWithRegister
nmap <Leader>r  <Plug>ReplaceWithRegisterOperator
nmap <Leader>rr <Plug>ReplaceWithRegisterLine

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

filetype plugin indent on

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile .{jscs,jshint,eslint}rc set filetype=json
  autocmd BufRead,BufNewFile aliases.local,zshrc.local,*/zsh/configs/* set filetype=sh
  autocmd BufRead,BufNewFile gitconfig.local set filetype=gitconfig
  autocmd BufRead,BufNewFile tmux.conf.local set filetype=tmux
  autocmd BufRead,BufNewFile vimrc.local set filetype=vim
augroup END

" ALE linting events
"augroup ale
  "autocmd!

  "if g:has_async
    "autocmd VimEnter *
      "\ set updatetime=1000 |
      "\ let g:ale_lint_on_text_changed = 0
    "autocmd CursorHold * call ale#Queue(0)
    "autocmd CursorHoldI * call ale#Queue(0)
    "autocmd InsertEnter * call ale#Queue(0)
    "autocmd InsertLeave * call ale#Queue(0)
  "else
    "echoerr "The thoughtbot dotfiles require NeoVim or Vim 8"
  "endif
"augroup END

" When the type of shell script is /bin/sh, assume a POSIX-compatible
" shell for syntax highlighting purposes.
let g:is_posix = 1

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·
" When tab is OK
" set list listchars=tab:\ \ ,trail:·,nbsp:·

" Use one space, not two, after punctuation.
set nojoinspaces

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in fzf for listing files. Lightning fast and respects .gitignore
  let $FZF_DEFAULT_COMMAND = 'ag --literal --files-with-matches --nocolor --hidden --ignore .git -g ""'

  " if !exists(":Ag")
  "   command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
    nnoremap \ :Ag!<SPACE>
  " endif
endif

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Numbers
set number
set numberwidth=5

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
" set wildmode=list:longest,list:full
" function! InsertTabWrapper()
"     let col = col('.') - 1
"     if !col || getline('.')[col - 1] !~ '\k'
"         return "\<Tab>"
"     else
"         return "\<C-p>"
"     endif
" endfunction
" inoremap <Tab> <C-r>=InsertTabWrapper()<CR>
" inoremap <S-Tab> <C-n>

" Switch between the last two files
nnoremap <Leader><Leader> <C-^>

" Get off my lawn
"nnoremap <Left> :echoe "Use h"<CR>
"nnoremap <Right> :echoe "Use l"<CR>
"nnoremap <Up> :echoe "Use k"<CR>
"nnoremap <Down> :echoe "Use j"<CR>

" vim-test mappings
"nnoremap <silent> <Leader>t :TestFile<CR>
"nnoremap <silent> <Leader>s :TestNearest<CR>
"nnoremap <silent> <Leader>l :TestLast<CR>
"nnoremap <silent> <Leader>a :TestSuite<CR>
"nnoremap <silent> <Leader>gt :TestVisit<CR>

" Run commands that require an interactive shell
" nnoremap <Leader>r :RunInInteractiveShell<Space>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Set tags for vim-fugitive
set tags^=.git/tags

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Move between linting errors
"nnoremap ]r :ALENextWrap<CR>
"nnoremap [r :ALEPreviousWrap<CR>

" Map Ctrl + p to open fuzzy find (FZF)
nnoremap <c-p> :Files!<cr>
let g:fzf_preview_window = 'up:60%'

" Set spellfile to location that is guaranteed to exist, can be symlinked to
" Dropbox or kept in Git and managed outside of thoughtbot/dotfiles using rcm.
set spellfile=$HOME/.vim-spell-en.utf-8.add

" Autocomplete with dictionary words when spell check is on
set complete+=kspell

" Always use vertical diffs
set diffopt+=vertical

" Local config - it is pasted instead
" if filereadable($HOME . "/.vimrc.local")
" source ~/.vimrc.local
" endif


" Custom
set nocompatible
set cursorline
set updatetime=100
set clipboard=unnamed
set relativenumber
set ignorecase
set smartcase
set mouse=a
" Don't do auto line-breaks at 80 char
set formatoptions-=t
" Large files would lose syntax otherwise
set redrawtime=10000
" Change cursor shape in different modes
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

" Mappings
inoremap jk <esc>
nnoremap <Leader>s :w<CR>
nnoremap <Leader>\| :vsplit<CR>
nnoremap 0 ^
nnoremap Y y$
" delete without yanking
nnoremap <leader>d "_d
" close buffer without closing split
nnoremap <Leader>c :bp\|bd #<CR>
nnoremap gb :Buffers!<CR>
" search for word under the cursor in all files
nnoremap <Leader>* :Ag! <C-R><C-W><cr>:cw<cr>
nmap <Leader>sv :source ~/.vimrc<CR>
nnoremap <leader>n :call ToggleNumber()<CR>
" load spec file in vertical split (close if split already exists)
nnoremap ga :only<CR>:AV<CR>
nmap gd <C-]>
" go to method in current buffer
nnoremap gm :BTags!<CR>
nnoremap <Leader>fit ?\<it\> ['"]<CR>If<Esc><C-o>
nnoremap <Leader>it ?\<fit\> ['"]<CR>x<C-o>
nnoremap <Leader>ap :VtrAttachToPane<CR>
nnoremap <Leader>sl :VtrSendLinesToRunner<CR>
vnoremap <Leader>sl :VtrSendLinesToRunner<CR>

" incsearch plugin
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
highlight Search ctermfg=0 ctermbg=9

" Autocommands
" show only relative path of buffer (vim-rails loads by absolute path)
autocmd BufReadPost * silent! lcd .
" Triger `autoread` when files changes on disk
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" Ag makes a search using preview window to display results with proper colors
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, '--color-path "0;37" --color-line-number "0;37"', fzf#vim#with_preview('up:60%'), <bang>0)
" redefine function from fzf.vim to remove --column flag (don't show columns in result set)
" unfortunately it gives an empty result set, needs debugging
" command! -bang -nargs=* Ag
"   \ call fzf#vim#grep(
"   \   'ag --nogroup --color --color-path "0;37" --color-line-number "0;37"'.shellescape(<q-args>), 1,
"   \   fzf#vim#with_preview('up:60%'), <bang>0)

" Theme
set statusline=%f%m%r%h%w%=\ %y\ %l,%v\ [%L] " Last character gets truncated 'd'
colorscheme base16-ocean
highlight clear LineNr
highlight clear CursorLineNr
highlight LineNr ctermfg=8 ctermbg=black
let g:gitgutter_override_sign_column_highlight = 0
highlight SignColumn ctermbg=black
highlight GitGutterAdd ctermbg=black
highlight GitGutterChange ctermbg=black
highlight GitGutterDelete ctermbg=black
highlight GitGutterChangeDelete ctermbg=black

" Autoformat
" debug with
" let g:autoformat_verbosemode=1
au BufWritePre * :Autoformat
" Use rubocop-daemon for faster checks https://github.com/fohte/rubocop-daemon#more-speed
let g:formatdef_rubocop = "'rubocop-daemon-wrapper --auto-correct -o /dev/null -s '.bufname('%').' \| sed -n 2,\\$p'"
let g:formatters_ruby = ['rubocop']
" This is not handled by vim-go anymore as it fires multiple file change events
if !exists('g:formatdef_gofumports')
    let g:formatdef_gofumports = '"gofumports"'
endif
let g:formatters_go = ['gofumports']
" These are handled by prettier
let g:formatters_javascript = []
let g:formatters_typescript = []
let g:formatters_css = []
let g:formatters_scss = []
" Don't want XML formatting
let g:formatters_xml = []
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
au BufRead,BufNewFile *.js.erb set filetype=eruby.javascript.ruby

" vim-test
nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ts :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tg :TestVisit<CR>
let g:test#strategy = 'vtr'

" COC
" It is handle by coc, disable in vim-go
let g:go_def_mapping_enabled = 0
" Endwise
" disable mapping to not break coc.nvim
let g:endwise_no_mappings = 1

set hidden
set cmdheight=2
set shortmess+=c
set signcolumn=yes
" Use tab for trigger completion
" It would jump snippet positions too, but use C-j instead - more reliable
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
" nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
" nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
" nmap <silent> <C-d> <Plug>(coc-range-select)
" xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')


" Using CocList
" Show all diagnostics
" nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
" nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
" nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
" nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
" nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
" nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
" nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
" nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" COC END

" toggle between number and relativenumber
function! ToggleNumber()
   if(&relativenumber == 1)
       set norelativenumber
       set number
   else
       set relativenumber
   endif
endfunc


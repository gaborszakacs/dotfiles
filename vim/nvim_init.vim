set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

au TextYankPost * silent! lua vim.highlight.on_yank()
lua require('leap').add_default_mappings()

" ------------ general settings ------------

set nocompatible

" source .vimrc file after it is saved
" TODO: remove when done configuring
autocmd BufWritePost .vimrc source %

" enable syntax highlighting, but preserve user colorsettings
syntax enable

" show command as it is being entered
set showcmd

" show line and column of cursor
set ruler

" turn hybrid line numbers on
set number relativenumber

" yanking text also copies it system clipboard
" might need to install vim-gtk3
set clipboard=unnamedplus


" ------------ keybindings ------------

" run current in line in bash
noremap ,l :.w !bash<CR>

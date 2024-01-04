set number
set termbidi
set relativenumber
set tabstop=4
set shiftwidth=4
:set autoindent
:set smarttab
set softtabstop=4
set mouse=a
set encoding=utf-8  " The encoding displayed.
set fileencoding=en_US.UTF-8  " The encoding written to file.  "
set updatetime=25

" Cursorline highlight
:set      cursorline
:set      cursorcolumn

" Spaces
set shiftwidth=4
set tabstop=4
set expandtab
set autoindent

" Clipboard

" Theme
:set completeopt-=preview " For No Previews
syntax enable
colorscheme afterglow

" mapping in Normal mode.
nmap <C-s> :w<CR>
nmap <C-d> :source $HOME/.config/nvim/init.vim <CR>
nmap <C-q> :q<CR>
nmap <C-o> :e .<CR>
" mapping in Insert mode.
imap <C-s> <ESC>:w<CR>
imap <C-o> :e .<CR>

" NERDTree map
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>



set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin indent on

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim

call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'townk/vim-autoclose'
    Plugin 'scrooloose/nerdtree'
    Plugin 'ryanoasis/vim-devicons'
    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'
    Plugin 'danilo-augusto/vim-afterglow'
 
call vundle#end()

" Airline configurations
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_theme='afterglow'
"

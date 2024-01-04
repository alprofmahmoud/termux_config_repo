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
highlight Cursorline guibg=#2b2b2b
highlight Cursorlolumn guibg=#2b2b2b
set       hlsearch



" Spaces
set shiftwidth=4
set tabstop=4
set expandtab
set autoindent

" Clipboard

" Theme
:set completeopt-=preview " For No Previews
syntax enable
:set background=dark
:colorscheme nord

" mapping in Normal mode.
nmap <C-s> :w<CR>
nmap <C-q> :q<CR>
nmap <C-o> :e .<CR>
" mapping in Insert mode.
imap <C-s> <ESC>:w<CR>
imap <C-o> :e .<CR>



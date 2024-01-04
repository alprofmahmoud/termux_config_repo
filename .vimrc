set relativenumber 
" Cursorline highlight
:set      cursorline
:set      cursorcolumn


" mapping in Normal mode.
nmap <C-s> :w <CR>
nmap <C-d> :source $HOME/.vimrc <CR>
nmap <C-q> :q<CR>
nmap <C-o> :e .<CR>
nmap <C-4> :source %<CR>
" mapping in Insert mode.
imap <C-s> <ESC>:w<CR>
imap <C-o> :e .<CR>



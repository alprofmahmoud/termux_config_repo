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
"set fileencoding=en_US.UTF-8  " The encoding written to file.  "
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
set clipboard^=unnamed,unnamedplus
au TextYankPost * call system('termux-clipboard-set &', @")
function Paste(p)
        let sysclip=system('termux-clipboard-get')
            if sysclip != @"
        let @"=sysclip
            endif
        return a:p
        endfunction
"noremap <expr> p Paste('p')
"noremap <expr> P Paste('P')

vnoremap <C-x> :!termux-clipboard-set<CR>
"vnoremap <C-c> :w !termux-clipboard-set<CR><CR>
inoremap <C-v> <ESC>:read !termux-clipboard-get<CR>i

" Theme
:set completeopt-=preview " For No Previews
syntax enable
set background=dark
"colorscheme solarized
"colorscheme afterglow

" mapping in Normal mode.
nmap <C-s> :w<CR>
nmap <C-d> :source $HOME/.config/nvim/init.vim <CR>
nmap <C-q> :q<CR>
nmap <C-o> :e .<CR>
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <C-j> :tabprevious<CR>
nnoremap <C-k> :tabnext<CR>


" mapping in Insert mode.
imap <C-s> <ESC>:w<CR>
imap <C-o> :e .<CR>

" NERDTree map
"nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>

" Syntastic map
nmap <F8> :SyntasticCheck<CR>
nmap <F7> :SyntasticReset<CR>



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
    Plugin 'junegunn/fzf'
    Plugin 'tpope/vim-fugitive'
    Plugin 'scrooloose/syntastic'
    Plugin 'altercation/vim-colors-solarized'
 
call vundle#end()

call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'ryanoasis/vim-devicons'
call plug#end()

" Airline configurations
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#hunks#enabled=1
let g:airline#extensions#branch#enabled=1
let g:airline_section_y = 'BN:%{bufnr("%")}'
" Defult seectin z
"let g:airline_section_z = '%p%%%#__accent_bold#%{g:airline_symbols.linenr}%l%#__restore__#%#__accent_bold#/%L%{g:airline_symbols.maxlinenr}%#__restore__#%#__accent_bold#%{g:airline_symbols.colnr}%v%#__restore__#'
"let g:airline_section_z = '%p
"                           %%
"                           %#__accent_bold#
"                           %{g:airline_symbols.linenr}
"                           %l
"                           %#__restore__#
"                           %#__accent_bold#
"                           /%L
"                           %{g:airline_symbols.maxlinenr}
"                           %#__restore__#
"                           %#__accent_bold#
"                           %{g:airline_symbols.colnr}
"                           %v
"                           %#__restore__#'
let g:airline_section_z='%p%%%#__accent_bold#%{g:airline_symbols.linenr}%l%#__restore__#%#__accent_bold#/%v%{g:airline_symbols.maxlinenr}%L%#__restore__#'


let g:airline_theme='base16_solarized'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.space = "\ua0"
let g:airline_symbols.branch = ''
let g:airline_symbols.colnr = ' ℅:'
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ' :'
let g:airline_symbols.maxlinenr = ' ☰ '
let g:airline_symbols.dirty='⚡'

" Syntastic confifure  
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let syntastic_mode_map = {"mode": "passive"}


"NerdTree
""autocmd VimEnter * NERDTree
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

 let g:NERDTreeDirArrowExpandable="+"
 let g:NERDTreeDirArrowCollapsible="~"

" FZF configurations
nnoremap <C-f> :FZF<CR>

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" An action can be a reference to a function that processes selected lines
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val, "lnum": 1 }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - Popup window (center of the screen)
let g:fzf_layout = { 'window': { 'width': 0.7, 'height': 0.5 } }

" - Popup window (center of the current window)
"let g:fzf_layout = { 'window': { 'width': 0.6, 'height': 0.3, 'relative': v:true } }

" - Popup window (anchored to the bottom of the current window)
"let g:fzf_layout = { 'window': { 'width': 0.6, 'height': 0.3, 'relative': v:true, 'yoffset': 1.0 } }

" - down / up / left / right
"let g:fzf_layout = { 'down': '40%' }

" - Window using a Vim command
"let g:fzf_layout = { 'window': 'enew' }
"let g:fzf_layout = { 'window': '-tabnew' }
"let g:fzf_layout = { 'window': '10new' }

" Customize fzf colors to match your color scheme
" - fzf#wrap translates this to a set of `--color` options
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history
" - History files will be stored in the specified directory
" - When set, CTRL-N and CTRL-P will be bound to 'next-history' and
"   'previous-history' instead of 'down' and 'up'.
let g:fzf_history_dir = '~/.local/share/fzf-history'



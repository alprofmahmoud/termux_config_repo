set nocompatible              " be iMproved, required
filetype off                  " required

" ============================
" Plugin Manager Setup
" ============================
" Vundle Setup
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

" Plug Setup (for modern plugins)
call plug#begin('~/.config/nvim/plugged')
    Plug 'tpope/vim-sensible'
    Plug 'ryanoasis/vim-devicons'
    Plug 'morhetz/gruvbox'
    Plug 'lifepillar/vim-solarized8'
call plug#end()

filetype plugin indent on    " required

" ============================
" Basic Settings
" ============================
set number
set relativenumber
set termbidi
set encoding=utf-8
set updatetime=25
set mouse=a

" Indentation and Tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set smarttab

" Visual Settings
set cursorline
set cursorcolumn
syntax enable

" ============================
" Theme Configuration
" ============================
set completeopt-=preview " For No Previews

" Try to load theme with fallback
try
    colorscheme solarized8_flat
catch /^Vim\%((\a\+)\)\=:E185/
    try
        colorscheme gruvbox
    catch /^Vim\%((\a\+)\)\=:E185/
        colorscheme default
        echo "Using default colorscheme - install themes for better experience"
    endtry
endtry

" ============================
" Clipboard Configuration (Termux)
" ============================
set clipboard^=unnamed,unnamedplus

" Termux clipboard integration
au TextYankPost * call system('termux-clipboard-set &', @")

function! Paste(p)
    let sysclip=system('termux-clipboard-get')
    if sysclip != @"
        let @"=sysclip
    endif
    return a:p
endfunction

" Clipboard mappings
vnoremap <C-x> :!termux-clipboard-set<CR>
inoremap <C-v> <ESC>:read !termux-clipboard-get<CR>i

" ============================
" Key Mappings
" ============================
" Normal mode mappings
nmap <C-s> :w<CR>
nmap <C-d> :source $HOME/.config/nvim/init.vim<CR>
nmap <C-q> :q<CR>
nmap <C-o> :e .<CR>

" Tab navigation
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <C-j> :tabprevious<CR>
nnoremap <C-k> :tabnext<CR>

" Insert mode mappings
imap <C-s> <ESC>:w<CR>
imap <C-o> :e .<CR>

" Python execution
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

" ============================
" NERDTree Configuration
" ============================
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

" NERDTree settings
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

" Auto-close if NERDTree is the only window left
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" ============================
" Syntastic Configuration
" ============================
nmap <F8> :SyntasticCheck<CR>
nmap <F7> :SyntasticReset<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = {"mode": "passive"}

" ============================
" Airline Configuration
" ============================
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline_section_y = 'BN:%{bufnr("%")}'
let g:airline_section_z = '%p%%%#__accent_bold#%{g:airline_symbols.linenr}%l%#__restore__#%#__accent_bold#/%v%{g:airline_symbols.maxlinenr}%L%#__restore__#'

let g:airline_theme = 'base16_solarized'

" Airline symbols
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.space = "\ua0"
let g:airline_symbols.branch = ''
let g:airline_symbols.colnr = ' ℅:'
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ' :'
let g:airline_symbols.maxlinenr = ' ☰ '
let g:airline_symbols.dirty = '⚡'

" ============================
" FZF Configuration
" ============================
nnoremap <C-f> :FZF<CR>

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

" FZF layout
let g:fzf_layout = { 'window': { 'width': 0.7, 'height': 0.5 } }

" FZF colors
let g:fzf_colors = {
  \ 'fg':      ['fg', 'Normal'],
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

" FZF history
let g:fzf_history_dir = '~/.local/share/fzf-history'

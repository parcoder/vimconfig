
call plug#begin('~/AppData/Local/nvim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'ajh17/spacegray.vim'
Plug 'fatih/vim-go',{ 'do':':GoUpdateBinaries'}
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'yggdroot/indentline'
Plug 'flazz/vim-colorschemes'
call plug#end()


let g:spacegray_underline_search = 1
let g:spacegray_use_italics = 1
let g:spacegray_low_contrast = 1

let g:airline#extensions#tabline#enabled = 0 

let g:enable_bold_font = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1
let g:go_fmt_autosave = 0

let g:airline_powerline_fonts = 0


syntax on
colorscheme spacegray

filetype plugin on
filetype indent on

set autoread
set number
set title
set cursorline
set tabstop=2 shiftwidth=2 expandtab


map <silent> <F2> NERDTreeToggle 

call plug#begin()
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries', 'for': 'go' }
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'sheerun/vim-polyglot'
Plug 'PProvost/vim-ps1'
Plug 'tomasr/molokai'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'stamblerre/gocode'
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'danilo-augusto/vim-afterglow'
call plug#end()



" con esto se agregan los json tags a las estructuras
let g:go_addtags_transform = "snakecase"

" si los tooltips salen sin color activar esto para corregir es un error de gtk? 
" GuiPopupmenu 0

" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" esto corrige un molesto problema con gopls 
let g:go_auto_sameids = 1
let g:go_auto_info = 1

" -------------------------------------------------------------------------------------------------
" CONFIGURACIONES CASERAS
" -------------------------------------------------------------------------------------------------
" con esto arrancamos nerdtree al inicio
autocmd VimEnter * NERDTree

autocmd VimEnter * GuiPopupmenu 0


" con esto hacemos que nerdtree muestre los bookmarks al arrancar
let NERDTreeShowBookmarks=2

" activamos gopls para el sistema
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" activamos los colores molokai esta bien lindo pero se puede cambiar a placer

syntax enable
colorscheme afterglow 

let g:afterglow_blackout = 1
let g:airline_theme="afterglow'

" mostramos los numeros en las lineas 1 2 3 4 ...
set number
" con esto mostramos las lineas verticales cuando se tabula para sevir de guía

set listchars=tab:\|\ 
set list

" montamos 4 espacios de TAB
au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4

" Habilitamos muchas modalidades de colores en vim-go
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_auto_sameids = 1

" Con esto procesamos el archivo al momento de guardar genera elformato y agrega los imports faltantes si hay alguno
let g:go_fmt_command = "goimports"


" Error and warning signs.
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'" Enable integration with airline.
let g:airline#extensions#ale#enabled = 1

" ir a declaraciones
au FileType go nmap <leader>gt :GoDeclsDir<cr>

" Muestra el tipo de dato en el que trabajamos en la barra de tareas
let g:go_auto_type_info = 1

" IR A DEFINICION CON F12
au FileType go nmap <F12> <Plug>(go-def)

" automatically install coc extensions if they're missing
let g:coc_global_extensions=[ 'coc-powershell', 'coc-python' , 'coc-yaml']

" -------------------------------------------------------------------------------------------------
" coc.nvim default settings
" -------------------------------------------------------------------------------------------------

" if hidden is not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <C-n> :NERDTreeToggle<CR>

" Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

"*****************************************************************************
"" Abbreviations
"*****************************************************************************
"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

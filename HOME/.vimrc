syntax on 					" Resaltado de syntaxis
set ai						" Permite la indentación
set nu						" Monstrar numero de la linea de codigo
filetype off 					" Dectecta el tipo de archivo
filetype plugin indent on
set nocompatible 				" Permite funciones no soportadas por Vim
set autoindent 					" Permite la autoindentación
set ruler					" Identifica la fila y columna en la barra de estado
set mouse=a 					" Activa el uso de mouse en vim
set expandtab 					" Expande el tabulador dentro del espacio
set ts=4 					" Establece 4 espcacio con el tabulador
set shiftwidth=4 				" Establece 4 espacio en la autoindentacón
set cursorline 					" Mustra una line visual bajo la linea actual del cursor
set showmatch 					" Mostrar la parte conicidente del par [] {} ()
set cindent 					" Permite la indentación de lenguaje en C

" Plugin  Vundle
"--------------------------
set rtp+=~/.vim/bundle/Vundle.vim
"--------------------------

execute pathogen#infect()

call pathogen#infect()
call pathogen#helptags()

call vundle#begin()
Plugin 'mattn/gist-vim'
Plugin 'mattn/webapi-vim'
Plugin 'gmarik/Vundle.vim'
Plugin 'wikitopian/hardmode'
Plugin 'scrooloose/nerdtree.git'
call vundle#end()

let python_highlight_all = 1 			" habilitar todas las características de resaltado de sintaxis de Python
let g:airline#extensions#tabline#enabled = 1 	" Activa Airline plugin
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ''

augroup VimCSS3Syntax
  autocmd!

  autocmd FileType css setlocal iskeyword+=-
augroup END

autocmd FileType python set omnifunc=pythoncomplete#Complete 			" Autocompletado para Python
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS 		" Autocompletadp para JavaScripts
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags 			" Autocompletado para HTML

" Syntax PHP
" --------------------------------------
function! PhpSyntaxOverride()
      hi! def link phpDocTags  phpDefine
      hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverrid
    autocmd!
    autocmd FileType php call PhpSyntaxOverride()
augroup END

" Corrector ortográfico españo, ingles
" ---------------------------------------
nmap  :setlocal spell spelllang=es_es<cr> 				
nmap  :setlocal spell spelllang=en_en<cr>
" ---------------------------------------

" Platilla lorem ipsum
"---------------------
nmap ,L :so ~/.vim/templates/lorem_ipsum.vim<cr>
"---------------------

map <F2> :NERDTreeToggle<CR>				" Buscador de fichero NerdTree
map <F3> :TlistToggle<CR>				" Buscador de etiquetas 
map <F7> :w <CR>:!gcc % -o %< && ./%< <CR>		" Compilar y ejecutar en C
map <F8> :w <CR>:!python %<CR>				" Ejecutar programas Python

map <F4> : call CompileGcc()<CR> 			" Compilar y ejecutar en C
func! CompileGcc()
  exec "w"
  exec "!gcc % -o %<"
endfunc

map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
  exec "w"
  exec "!gcc % -o %<"
  exec "! ./%<"
endfunc 

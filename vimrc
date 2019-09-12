set nocompatible			" set compatibility to Vim only.

filetype off				" helps force plug-ins to load correctly when it is turned back on below.

" set background=dark
" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
Plug 'mattn/emmet-vim'
Plug 'itchyny/lightline.vim'
Plug 'koirand/tokyo-metro.vim'
call plug#end()

" turn on syntax highlighting.
syntax on

" colors
colorscheme tokyo-metro
let g:lightline = {
      \ 'colorscheme': 'tokyometro',
      \ }
"
if !has('gui_running')
          set t_Co=256
  endif

" filetype plugins
filetype plugin indent on		

" Turn off modelines
set modelines=0				 

" Automatically wrap text that extends beyond the screen length.
set wrap
" Vim's auto indentation feature does not work properly with text copied
" from outside of Vim. Press the <F2> key to toggle paste mode on/off.
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>

" tabs, indentation etc
set tabstop=4
set softtabstop=4
set expandtab


" highlight current line
set cursorline 				
" Display 5 lines above/below the cursor when scrolling with a mouse.
set scrolloff=5 			
" Fixes common backspace problems
set backspace=indent,eol,start 		
" Speed up scrolling in Vim
set ttyfast 				
" display status line always
set laststatus=2 			

" Display options
set showmode
set showcmd

" highlight matching pairs of brackets.
set matchpairs+=<:>			 

" show line numbers
set number				 

" Set status line display
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')} 

set encoding=utf-8		

" highlight matching search patterns
set hlsearch				 
nnoremap <leader><space> :nohlsearch<CR>
" enable incremental search
set incsearch				 
" include matching uppercase words with lowercase search term
set ignorecase				 
" include only uppercase words with uppercase search term
set smartcase				 

" " Store info from no more than 100 files at a time, 9999 lines of text,
" 100kb of data. Useful for copying large amounts of data between files.
set viminfo='100,<9999,s100
"
" " Map the <Space> key to toggle a selected fold opened/closed.
" nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
" vnoremap <Space> zf
"
" " Automatically save and load folds
" autocmd BufWinLeave *.* mkview
" autocmd BufWinEnter *.* silent loadview"



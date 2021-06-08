set nocompatible			" set compatibility to Vim only.

filetype off				" helps force plug-ins to load correctly when it is turned back on below.

" set background=dark
" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'dense-analysis/ale'
Plug 'Valloric/YouCompleteMe'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'mattn/emmet-vim'
Plug 'sheerun/vim-polyglot'
Plug 'itchyny/lightline.vim'
Plug 'iojani/silenthill.vim'
Plug 'iojani/half-life.vim'
call plug#end()

" turn on syntax highlighting.
syntax on

" colors
colorscheme half-life

let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

if &term =~ '256color'
    " Disable Background Color Erase (BCE) so that color schemes
    "     " work properly when Vim is used inside tmux and GNU screen.
    set t_ut=
endif

set termguicolors

" filetype plugins
filetype plugin indent on		

" emmet
let g:user_emmet_leader_key=','
let g:user_emmet_install_global=0
autocmd Filetype html,htmldjango,css,scss,php,javascript EmmetInstall
let g:user_emmet_settings = {
            \ 'javascript' : {
            \   'extends' : 'jsx',
            \ },
            \}

" YCM
nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <Leader>gD :YcmCompleter FixIt<CR>

" Ale
" let g:ale_linter = {'python': ['flake8']}

" fzf
nnoremap <C-p> :Files<CR>
nnoremap <C-g> :GFiles<CR>
nnoremap <C-f> :Rg!<CR>
nnoremap <leader>b :Buffer<CR>
nnoremap <leader>g :BCommits<CR>
nnoremap <leader>gg :GFiles?<CR>
nnoremap <leader>l :Lines<CR>


" Turn off modelines
set modelines=0				 

" Automatically wrap text that extends beyond the screen length.
set wrap
" Vim's auto indentation feature does not work properly with text copied
" from outside of Vim. Press the <F2> key to toggle paste mode on/off.
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>

" syntax group under cursor
nnoremap <leader>h :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
            \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
            \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
" tabs, indentation etc
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent

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

" show relative(hybrid) line numbers
set number relativenumber

" Set status line display
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')} 

set encoding=UTF-8		

" Nerdtree
map <F3> :NERDTreeToggle<CR>

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


" folding
" set foldmethod=syntax
" set foldlevelstart=99
"
" " Automatically save and load folds
" autocmd BufWinLeave *.* mkview
" autocmd BufWinEnter *.* silent loadview"


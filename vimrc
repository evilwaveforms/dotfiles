" set compatibility to Vim only.
set nocompatible

set wildmode=longest,list,full
set wildmenu
set clipboard^=unnamed,unnamedplus

set wildignore+=*.pyc
set wildignore+=**/node_modules/*

" helps force plug-ins to load correctly when it is turned back on below.
filetype off

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'Valloric/YouCompleteMe'
Plug 'vim-test/vim-test'
Plug 'mbbill/undotree'

Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-rhubarb'

Plug 'sheerun/vim-polyglot'
Plug 'stsewd/fzf-checkout.vim'
Plug 'suy/vim-context-commentstring'
Plug 'dbeniamine/cheat.sh-vim'
Plug 'mattn/emmet-vim'
" Plug 'dense-analysis/ale'
Plug 'psf/black', { 'branch': 'stable' }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'itchyny/lightline.vim'
Plug 'janituo/silenthill.vim'
Plug 'janituo/half-life.vim'
Plug 'janituo/system-shock.vim'
Plug 'ewilazarus/preto'
call plug#end()

syntax on
set redrawtime=10000

let mapleader = " "

let g:lightline = {
            \ 'colorscheme': 'systemshock',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
            \ },
            \ 'component_function': {
            \   'gitbranch': 'FugitiveHead'
            \ },
            \ }

set background=dark
set termguicolors
colorscheme half-life

if &term =~ '256color'
    " Disable Background Color Erase (BCE) so that color schemes
    "     " work properly when Vim is used inside tmux and GNU screen.
    set t_ut=
endif

" filetype plugins
filetype plugin indent on

" emmet
let g:user_emmet_leader_key=','
let g:user_emmet_install_global=0
autocmd Filetype html,htmldjango,css,scss,php,javascript,vue EmmetInstall
let g:user_emmet_settings = {
            \ 'javascript' : {
            \   'extends' : 'jsx',
            \ },
            \}

" Ale
" let g:ale_linters = {'python': ['flake8']}
" let g:ale_fixers = {}
" let g:ale_fixers.python = ['black']
"

" YCM
nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <Leader>gr :YcmCompleter GoToReferences<CR>
nnoremap <silent> <Leader>doc :YcmCompleter GetDoc<CR>

map <F3> :NERDTreeToggle<CR>
map <F4> :NERDTreeFind<cr>

nnoremap <leader>ut :UndotreeToggle<CR>

" fzf
nnoremap <C-p> :Files<CR>
nnoremap <C-g> :GFiles<CR>
nnoremap <C-f> :Rg!<CR>
nnoremap <leader>b :Buffer<CR>
nnoremap <leader>g :BCommits<CR>
nnoremap <leader>gg :GFiles?<CR>
nnoremap <leader>l :Lines<CR>

" fugitive
nmap <leader>gs :G<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gj :diffget //3<CR>

" vim-test
nmap <silent> <leader>tt :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tv :TestVisit<CR>

let g:pandoc#formatting#mode = 'h' " A'
let g:pandoc#formatting#textwidth = 72
let g:pandoc#modules#disabled = ['folding']

nnoremap <leader>gc :GBranches<CR>

nmap <expr> <leader>gg &filetype ==# 'fugitiveblame' ? "gq" : ":Git blame\r"
nnoremap <leader>GB :GBrowse<CR>

" keep visual selection after indenting
vnoremap < <gv
vnoremap > >gv

nnoremap <leader><space> :nohlsearch<CR>

let g:CheatDoNotReplaceKeywordPrg=1

" commit msg tooltip
nmap <silent><Leader>gb :call setbufvar(winbufnr(popup_atcursor(split(system("git log -n 1 -L " . line(".") . ",+1:" . expand("%:p")), "\n"), { "padding": [1,1,1,1], "pos": "botleft", "wrap": 0 })), "&filetype", "git")<CR>


highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

" exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
" set list

set hidden

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
set shiftwidth=4
set expandtab
set autoindent

autocmd Filetype html,htmldjango,javascript,vue setlocal ts=2 sw=2 expandtab

runtime macros/matchit.vim

let g:undotree_SetFocusWhenToggle = 1

if has("persistent_undo")
   let target_path = expand('~/.undodir')

    " create the directory and any parent directories
    " if the location does not exist.
    if !isdirectory(target_path)
        call mkdir(target_path, "p", 0700)
    endif

    let &undodir=target_path
    set undofile
endif

" highlight current lineNr
set cursorline
set cursorlineopt=number

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

set matchpairs+=<:>

set number relativenumber

set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}

set encoding=UTF-8

" highlight matching search patterns
set hlsearch
" enable incremental search
set incsearch
" include matching uppercase words with lowercase search term
set ignorecase
" include only uppercase words with uppercase search term
set smartcase


let g:go_fmt_autosave = 1
let g:go_gopls_enabled = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_diagnostic_errors = 1
let g:go_highlight_diagnostic_warnings = 1

" " Store info from no more than 100 files at a time, 9999 lines of text,
" 100kb of data. Useful for copying large amounts of data between files.
set viminfo='100,<9999,s100

" syntax group under cursor
nnoremap <leader>h :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
            \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
            \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" folding
" set foldmethod=syntax
" set foldlevelstart=99
"
" " Automatically save and load folds
" autocmd BufWinLeave *.* mkview
" autocmd BufWinEnter *.* silent loadview"

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

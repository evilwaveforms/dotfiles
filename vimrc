set nocompatible

set wildmode=longest,list,full
set wildmenu
set clipboard^=unnamed,unnamedplus

set wildignore+=*.pyc
set wildignore+=**/node_modules/*

" helps force plug-ins to load correctly when it is turned back on below.
filetype off

call plug#begin('~/.vim/plugged')
Plug 'mbbill/undotree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-rhubarb'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'rust-lang/rust.vim'
Plug 'evilwaveforms/system-shock.vim'
Plug 'evilwaveforms/cybernetics-vim'
call plug#end()

syntax on
set redrawtime=10000

let mapleader = " "

set background=dark
set termguicolors
colorscheme cybernetics

if &term =~ '256color'
    " Disable Background Color Erase (BCE) so that color schemes
    "     " work properly when Vim is used inside tmux and GNU screen.
    set t_ut=
endif

filetype plugin indent on

nnoremap <leader>ut :UndotreeToggle<CR>

" fzf
nnoremap <C-p> :Files<CR>
nnoremap <C-g> :GFiles!?<CR>
nnoremap <C-f> :Rg!<CR>
nnoremap <leader>b :Buffer<CR>
nnoremap <leader>g :BCommits<CR>
nnoremap <leader>l :Lines<CR>
let g:fzf_preview_window = ['right,50%,<70(up,40%)', 'ctrl-/']

" fugitive
nmap <leader>gs :G<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gj :diffget //3<CR>

nmap <expr> <leader>gg &filetype ==# 'fugitiveblame' ? "gq" : ":Git blame\r"
nnoremap <leader>GB :GBrowse<CR>

" keep visual selection after indenting
vnoremap < <gv
vnoremap > >gv

nnoremap [q :cprev<CR>
nnoremap ]q :cnext<CR>
nnoremap [b :bprev<CR>
nnoremap ]b :bnext<CR>
nnoremap [t :tabprevious<CR>
nnoremap ]t :tabnext<CR>

nnoremap <leader><space> :nohlsearch<CR>

" commit msg tooltip
nmap <silent><Leader>gb :call setbufvar(winbufnr(popup_atcursor(split(system("git log -n 1 -L " . line(".") . ",+1:" . expand("%:p")), "\n"), { "padding": [1,1,1,1], "pos": "botleft", "wrap": 0 })), "&filetype", "git")<CR>

" exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
" set list

set hidden
set modelines=0

" Automatically wrap text that extends beyond the screen length.
set wrap
autocmd FileType gitcommit setlocal textwidth=72
autocmd FileType markdown setlocal textwidth=100

nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent

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

set cursorline
set cursorlineopt=number

set scrolloff=5
set backspace=indent,eol,start
set ttyfast
set laststatus=2

set showmode
set showcmd

set matchpairs+=<:>
set number relativenumber
nnoremap <silent><F11> :exec &nu ? "se nu!" : "se rnu!"<CR>

set statusline=
set statusline+=\ %f
set statusline+=%m
set statusline+=%=
set statusline+=\ %y
" set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
" set statusline+=\%{&fileformat}
set statusline+=\ %l:%c
set statusline+=\ %p%\%

set encoding=UTF-8

set hlsearch
set incsearch
set ignorecase
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

nnoremap <leader>\ :if exists("g:syntax_on") <Bar> syntax off <Bar> else <Bar> syntax enable <Bar> endif<CR>

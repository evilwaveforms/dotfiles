let mapleader = " "
lua require('init')

set wildmode=longest,list,full
set wildmenu
set clipboard^=unnamed,unnamedplus
set wildignore+=*.pyc,*/node_modules/*,*.o

set redrawtime=10000

set background=dark
set termguicolors
colorscheme system-shock

if &term =~ '256color'
    " Disable Background Color Erase (BCE) so that color schemes
    "     " work properly when Vim is used inside tmux and GNU screen.
    set t_ut=
endif

let g:fzf_preview_window = ['right,50%,<70(up,40%)', 'ctrl-/']


nmap <expr> <leader>gg &filetype ==# 'fugitiveblame' ? "gq" : ":Git blame\r"

" syntax group under cursor
nnoremap <leader>h :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
            \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
            \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" highlight ColorColumn ctermbg=magenta
" call matchadd('ColorColumn', '\%81v', 100)

" exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
" set list

augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=350}
augroup END

set hidden

" Turn off modelines
set modelines=0

" Automatically wrap text that extends beyond the screen length.
set wrap

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
   let target_path = expand('~/.nundodir')

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

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

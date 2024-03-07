vim.g.mapleader = " "
require('init')

vim.opt.wildmode = "longest,list,full"
vim.opt.wildmenu = true
vim.opt.clipboard = "unnamed,unnamedplus"
vim.opt.wildignore:append("*.pyc,*/node_modules/*,*.o")

vim.opt.redrawtime = 10000

vim.opt.background = "dark"
vim.opt.termguicolors = true
vim.cmd([[colorscheme system-shock]])

vim.g.fzf_preview_window = { "right,50%,<70(up,40%)", "ctrl-/" }

-- vim.opt.colorcolumn = "81"
-- vim.cmd([[call matchadd('ColorColumn', '\%81v', 100)]])

-- vim.opt.listchars:append("tab:\uBB\uBB,trail:\uB7,nbsp:~")
-- vim.opt.list = true

vim.cmd([[augroup highlight_yank]])
vim.cmd([[autocmd!]])
vim.cmd([[au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=350}]])
vim.cmd([[augroup END]])

vim.opt.hidden = true

vim.opt.modelines = 0

vim.opt.wrap = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true

vim.cmd([[autocmd Filetype html,htmldjango,javascript,vue setlocal ts=2 sw=2 expandtab]])
vim.cmd([[runtime macros/matchit.vim]])
vim.g.undotree_SetFocusWhenToggle = 1

if vim.fn.has("persistent_undo") == 1 then
    local target_path = vim.fn.expand("~/.nundodir")

    if vim.fn.isdirectory(target_path) == 0 then
        vim.fn.mkdir(target_path, "p", 0700)
    end

    vim.opt.undodir = target_path
    vim.opt.undofile = true
end

-- highlight current lineNr
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"

-- Display 5 lines above/below the cursor when scrolling with a mouse.
vim.opt.scrolloff = 5
-- Fixes common backspace problems
vim.opt.backspace = "indent,eol,start"
-- Speed up scrolling in Vim
vim.opt.ttyfast = true

-- display status line always
vim.opt.laststatus = 2

-- Display options
vim.opt.showmode = true
vim.opt.showcmd = true

vim.opt.matchpairs:append("<:>")
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.statusline = ""
vim.opt.statusline:append("%f")
vim.opt.statusline:append("%m")
vim.opt.statusline:append("%= ")
vim.opt.statusline:append(" %y")
-- -- vim.opt.statusline:append("\\ %{&fileencoding?&fileencoding:&encoding}")
-- -- vim.opt.statusline:append("\\ %{&fileformat}")
vim.opt.statusline:append(" %l:%c")
vim.opt.statusline:append(" %p%%")

vim.opt.encoding = "UTF-8"

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.g.go_fmt_autosave = 1
vim.g.go_gopls_enabled = 1
vim.g.go_highlight_types = 1
vim.g.go_highlight_fields = 1
vim.g.go_highlight_functions = 1
vim.g.go_highlight_function_calls = 1
vim.g.go_highlight_operators = 1
vim.g.go_highlight_extra_types = 1
vim.g.go_highlight_variable_declarations = 1
vim.g.go_highlight_variable_assignments = 1
vim.g.go_highlight_build_constraints = 1
vim.g.go_highlight_diagnostic_errors = 1
vim.g.go_highlight_diagnostic_warnings = 1
vim.opt.viminfo = "'100,<9999,s100"

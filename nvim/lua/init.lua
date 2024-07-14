vim.g.mapleader = " "
-- vim.cmd('syntax off')
vim.g.syntax_on = true

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {})
require("remap")
require('fzf').setup()

local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    client.server_capabilities.semanticTokensProvider = nil
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end)
    vim.keymap.set("n", "<leader>gr", function() vim.lsp.buf.references() end)
    vim.keymap.set("n", "<leader>k", function() vim.lsp.buf.hover() end)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end)
    vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end)
    lsp_zero.default_keymaps({buffer = bufnr})
end)

local on_attach = function(client, bufnr)
    if client.name == 'ruff_lsp' then
        -- Disable hover in favor of Pyright
        client.server_capabilities.hoverProvider = false
    end
end

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = { "pyright", "ruff_lsp", "rust_analyzer" },
    handlers = {
        lsp_zero.default_setup,
        lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
        end,
        pyright = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            require('lspconfig').pyright.setup({
                capabilities = capabilities,
                on_attach = on_attach,
                settings = {
                    pyright = { disableOrganizeImports = true, },
                    python = {
                        analysis = {
                            ignore = { '*' },
                            -- typeCheckingMode = "strict",
                        },
                    },
                },
            })
        end,
        ruff_lsp = function()
            require("lspconfig").ruff_lsp.setup({
                on_attach = on_attach,
                init_options = {
                    settings = {
                        lint = { args = { "--line-length=91" } },
                        format = { args = { "--line-length=91" } },
                        -- args = {
                        --     "--ignore=xxx",
                        -- }
                    },
                }
            })
        end,
    }
})

local cmp = require('cmp')
local cmp_format = lsp_zero.cmp_format()

local function border(hl_name)
    return {
        { "┌", hl_name },
        { "─", hl_name },
        { "┐", hl_name },
        { "│", hl_name },
        { "┘", hl_name },
        { "─", hl_name },
        { "└", hl_name },
        { "│", hl_name },
    }
end

local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local luasnip = require("luasnip")
cmp.setup({
    formatting = cmp_format,
    mapping = cmp.mapping.preset.insert({
        -- scroll up and down the documentation window
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<CR>'] = cmp.mapping.confirm({select = false}),
        ['<C-e>'] = cmp.mapping.abort(),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
                -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
                -- that way you will only jump inside the snippet region
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    }),
    window = {
        completion = {
            border = border("CmpMenuBorder"),
            -- winhighlight = "Normal:CmpMenu,CursorLine:CmpMenuSel,Search:None",
        },
        documentation = {
            border = border("CmpMenuBorder"),
            -- winhighlight = "Normal:CmpDoc",
        },
    }
})

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = true,
    underline = true,
    severity_sort = false,
    float = {
        -- border = 'rounded',
        header = '',
        prefix = '',
        focusable = false,
        close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
        source = false
    },
})

vim.opt.wildmode = "longest,list,full"
vim.opt.wildmenu = true
vim.opt.clipboard = "unnamed,unnamedplus"
vim.opt.wildignore:append("*.pyc,*/node_modules/*,*.o")

vim.opt.redrawtime = 10000

vim.opt.background = "dark"
vim.opt.termguicolors = true
vim.cmd([[colorscheme cybernetics]])

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
vim.cmd([[autocmd FileType gitcommit setlocal textwidth=72]])
vim.cmd([[autocmd FileType markdown setlocal textwidth=100]])
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

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = border("CmpMenuBorder") })
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border("CmpMenuBorder") })

-- This file can be loaded by calling `lua require("plugins")` from your init.vim

return {
    "evilwaveforms/system-shock.vim",
    "evilwaveforms/cybernetics-vim",
    {
        "junegunn/fzf.vim",
        dependencies = {"junegunn/fzf", build = ":call fzf#install()"}
    },
    "tpope/vim-fugitive",
    "tpope/vim-commentary",
    "tpope/vim-rhubarb",
    "shumphrey/fugitive-gitlab.vim",
    "rhysd/git-messenger.vim",

    -- {"fatih/vim-go", build = ":call GoUpdateBinaries()" },
    "rust-lang/rust.vim",
    "mbbill/undotree",
    {"vim-test/vim-test", lazy = true, cmd = {"TestNearest", "TestFile", "TestLast", "TestVisit", }},
    {
        "puremourning/vimspector",
        keys = {
            {"<F9>", "<Plug>VimspectorContinue"},
            {"<F10>", "<Plug>VimspectorStop"},
            {"<F11>", "<Plug>VimspectorRestart"},
            {"<F5>", "<Plug>VimspectorStepOver"},
            {"<F6>", "<Plug>VimspectorStepOut"},
            {"<F7>", "<Plug>VimspectorStepInto"},
            {"<leader>pp", "<Plug>VimspectorToggleBreakpoint"},
            {"<leader>aw", "<Plug>VimspectorAddWatch"},
            {"<leader>ev", "<Plug>VimspectorEvaluate"},
            -- {"<leader>di", "<Plug>VimspectorBalloonEval"},
            -- {"<leader>di", "<Plug>VimspectorBalloonEval", mode = "x"},
        },
    },

    -- LSP
    {"neovim/nvim-lspconfig"},
    {"williamboman/mason.nvim"},
    {"williamboman/mason-lspconfig.nvim"},

    -- Autocompletion
    {
        'saghen/blink.cmp',
        version = '1.*',
        opts = {
            keymap = {
                preset = 'enter',
                ['<S-Tab>'] = { 'select_prev', 'fallback' },
                ['<Tab>'] = { 'select_next', 'fallback' },
                ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation', 'fallback' },
                ["<Esc>"] = {'cancel', 'fallback'},
            },
            completion = { 
                documentation = { auto_show = true },
                menu = {
                    draw = { columns = { { "kind" }, { "label", "label_description" }, },
                    },
                },
            },
            sources = { default = { 'lsp', 'path', 'snippets', 'buffer' }, },
            fuzzy = { implementation = "prefer_rust_with_warning" }
        },
        opts_extend = { "sources.default" }
    },
    {"tpope/vim-dispatch", lazy = true, cmd = {"Dispatch", "Make", "Focus", "Start"}},
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function ()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = {
                    "c", "lua", "vim",
                    "vimdoc", "query",
                    "javascript", "html",
                    "css", "python",
                    "rust", "go",
                    "markdown",
                    "bash", "diff", "gitcommit",
                    "git_config", "git_rebase",
                    "gitattributes", "htmldjango",
                    "cpp",
                },
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<C-space>",
                        node_incremental = "<C-space>",
                        scope_incremental = false,
                        node_decremental = "<bs>",
                    },
                },
                textobjects = {
                    select = {
                        enable = true,
                        -- Automatically jump forward to textobj, similar to targets.vim
                        lookahead = true,
                        keymaps = {
                            -- You can use the capture groups defined in textobjects.scm
                            ["af"] = { query = "@function.outer", desc = "Select outer part of a method/function definition" },
                            ["if"] = { query = "@function.inner", desc = "Select inner part of a method/function definition" },
                            -- ["ac"] = { query = "@class.outer", desc = "Select outer part of a class" },
                            -- ["ic"] = { query = "@class.inner", desc = "Select inner part of a class" },
                        },
                    },
                    swap = {
                        enable = true,
                        swap_next = {["]a"] = "@parameter.inner",},
                        swap_previous = {["[a"] = "@parameter.inner",},
                    },
                }
            })
        end
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
    },
}

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
    "stsewd/fzf-checkout.vim",

    {"fatih/vim-go", build = ":call GoUpdateBinaries()" },
    "rust-lang/rust.vim",

    "vim-test/vim-test",
    "mbbill/undotree",
    "puremourning/vimspector",

    {"VonHeikemen/lsp-zero.nvim", branch = "v3.x"},

    -- LSP Support
    {"neovim/nvim-lspconfig"},
    {"williamboman/mason.nvim"},
    {"williamboman/mason-lspconfig.nvim"},

    -- Autocompletion
    {"hrsh7th/nvim-cmp"},
    {"hrsh7th/cmp-nvim-lsp"},
    {"L3MON4D3/LuaSnip"},

    -- Lazy loading:
    -- Load on specific commands
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

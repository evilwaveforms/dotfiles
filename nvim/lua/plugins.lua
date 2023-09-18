-- This file can be loaded by calling `lua require("plugins")` from your init.vim

return {
    "evilwaveforms/system-shock.vim",
    {
        "junegunn/fzf.vim",
        dependencies = {"junegunn/fzf", build = ":call fzf#install()"}
    },
    "tpope/vim-fugitive",
    "tpope/vim-commentary",
    "tpope/vim-rhubarb",
    "shumphrey/fugitive-gitlab.vim",
    "rhysd/git-messenger.vim",

    {"fatih/vim-go", build = ":call GoUpdateBinaries()" },
    "rust-lang/rust.vim",

    "scrooloose/nerdtree",
    "vim-test/vim-test",
    "mbbill/undotree",

    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",

    {"VonHeikemen/lsp-zero.nvim", branch = "v3.x"},

    -- LSP Support
    {"neovim/nvim-lspconfig"},
    {"williamboman/mason.nvim"},
    {"williamboman/mason-lspconfig.nvim"},

    -- Autocompletion
    {"hrsh7th/nvim-cmp"},         -- Required
    {"hrsh7th/cmp-nvim-lsp"},     -- Required
    {"hrsh7th/cmp-buffer"},       -- Optional
    {"hrsh7th/cmp-path"},         -- Optional
    {"saadparwaiz1/cmp_luasnip"}, -- Optional
    {"hrsh7th/cmp-nvim-lua"},     -- Optional

    -- Snippets
    {"L3MON4D3/LuaSnip"},             -- Required

    -- Lazy loading:
    -- Load on specific commands
    {"tpope/vim-dispatch", lazy = true, cmd = {"Dispatch", "Make", "Focus", "Start"}},
}

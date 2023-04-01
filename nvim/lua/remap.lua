vim.g.mapleader = " "

vim.keymap.set("n", "<leader><space>", "<cmd>nohlsearch<CR>")

vim.keymap.set("n", "F3",  "<cmd>NERDTreeToggle<CR>")
vim.keymap.set("n", "F4",  "<cmd>NERDTreeFind<CR>")

vim.keymap.set("n", "<leader>ut",  "<cmd>UndotreeToggle<CR>")

-- fzf
vim.keymap.set("n", "<C-p>",  "<cmd>Files<CR>")
vim.keymap.set("n", "<C-g>",  "<cmd>GFiles?<CR>")
vim.keymap.set("n", "<C-f>",  "<cmd>Rg!<CR>")

vim.keymap.set("n", "<leader>b",  "<cmd>Buffer!<CR>")
vim.keymap.set("n", "<leader>g",  "<cmd>BCommits<CR>")
vim.keymap.set("n", "<leader>gg",  "<cmd>GFiles?<CR>")
vim.keymap.set("n", "<leader>l",  "<cmd>Lines<CR>")

-- fugitive
vim.keymap.set("n", "<leader>gs", "<cmd>G<CR>")
vim.keymap.set("n", "<leader>gf", "<cmd>diffget //2<CR>")
vim.keymap.set("n", "<leader>gj", "<cmd>diffget //3<CR>")
vim.keymap.set("n", "<leader>GB",  "<cmd>GBrowse<CR>")
vim.keymap.set("n", "<leader>gc",  "<cmd>GBranches<CR>")

-- vim-test
vim.keymap.set("n", "<leader>tt",  "<cmd>TestNearest<CR>")
vim.keymap.set("n", "<leader>tf",  "<cmd>TestFile<CR>")
vim.keymap.set("n", "<leader>tl",  "<cmd>TestLast<CR>")
vim.keymap.set("n", "<leader>tv",  "<cmd>TestVisit<CR>")

vim.keymap.set("v", "<",  "<gv")
vim.keymap.set("v", ">",  ">gv")

vim.keymap.set("n", "[q", "<cmd>cprev<CR>")
vim.keymap.set("n", "]q", "<cmd>cnext<CR>")
vim.keymap.set("n", "[b", "<cmd>bprev<CR>")
vim.keymap.set("n", "]b", "<cmd>bnext<CR>")

vim.g.mapleader = " "

vim.keymap.set("n", "<leader><space>", "<cmd>nohlsearch<CR>")

vim.keymap.set("n", "<leader>nt", "<cmd>Lexplore<CR>")
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

vim.keymap.set("n", "<F9>", "<Plug>VimspectorContinue")
vim.keymap.set("n", "<F10>", "<Plug>VimspectorStop")
vim.keymap.set("n", "<F11>", "<Plug>VimspectorRestart")
vim.keymap.set("n", "<F5>", "<Plug>VimspectorStepOver")
vim.keymap.set("n", "<F6>", "<Plug>VimspectorStepOut")
vim.keymap.set("n", "<F7>", "<Plug>VimspectorStepInto")
vim.keymap.set("n", "<leader>pp", "<Plug>VimspectorToggleBreakpoint")
vim.keymap.set("n", "<leader>aw", "<Plug>VimspectorAddWatch")
vim.keymap.set("n", "<leader>ev", "<Plug>VimspectorEvaluate")
vim.keymap.set("n", "<Leader>di", "<Plug>VimspectorBalloonEval")
vim.keymap.set("x", "<Leader>di", "<Plug>VimspectorBalloonEval")

vim.keymap.set('n', '<leader>gg', function()
    if vim.bo.filetype == 'fugitiveblame' then
        vim.cmd('q')
    else
        vim.cmd('Git blame')
    end
end, {noremap = true, silent = true})

vim.api.nvim_set_keymap("n", "<leader>h", [[:echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>]], { noremap = true })

vim.g.mapleader = " "


vim.keymap.set("n", "<leader>\\", "<cmd>syntax<CR>")
vim.keymap.set("n", "<leader><space>", "<cmd>nohlsearch<CR>")

vim.keymap.set("n", "<leader>nt", "<cmd>Lexplore<CR>")
vim.keymap.set("n", "<leader>ut",  "<cmd>UndotreeToggle<CR>")

-- fzf
vim.keymap.set("n", "<C-p>",  "<cmd>Files!<CR>")
vim.keymap.set("n", "<leader>f",  "<cmd>Files!<CR>")
vim.keymap.set("n", "<C-g>",  "<cmd>GFiles!?<CR>")
vim.keymap.set("n", "<C-f>",  "<cmd>Rg!<CR>")
vim.keymap.set("n", "<leader>?",  "<cmd>Rg!<CR>")

vim.keymap.set("n", "<leader>b",  "<cmd>Buffer!<CR>")
vim.keymap.set("n", "<leader>gl",  "<cmd>BCommits<CR>")
vim.keymap.set("n", "<leader>l",  "<cmd>Lines<CR>")

-- fugitive
vim.keymap.set("n", "<leader>gs", "<cmd>G<CR>")
-- vim.keymap.set("n", "<leader>gf", "<cmd>diffget //2<CR>")
-- vim.keymap.set("n", "<leader>gj", "<cmd>diffget //3<CR>")
vim.keymap.set("n", "<leader>G",  "<cmd>GBrowse<CR>")
vim.keymap.set("v", "<leader>G", ":GBrowse<CR>", {silent = true})
-- vim.keymap.set("n", "<leader>gc", ":Gclog %<CR>")

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
vim.keymap.set("n", "[t", "<cmd>tabprevious<CR>")
vim.keymap.set("n", "]t", "<cmd>tabnext<CR>")
-- vim.keymap.set("n", "<F2>", "<cmd>:make %:r<CR>")

vim.keymap.set('n', '<leader>gg', function()
    if vim.bo.filetype == 'fugitiveblame' then
        vim.cmd('q')
    else
        vim.cmd('Git blame')
    end
end, {noremap = true, silent = true})

vim.keymap.set("n", "<leader>h", function()
    local buf = vim.api.nvim_get_current_buf()
    local highlighter = require "vim.treesitter.highlighter"
    if highlighter.active[buf] then
        vim.cmd("Inspect")
    else
        vim.cmd([[:echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
        \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
        \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"]])
    end
end, { noremap = true })

vim.keymap.set('n', '<leader>|', function()
  if vim.g.syntax_on then
    vim.cmd('syntax off')
    vim.g.syntax_on = false
    print("syntax off")
  else
    vim.cmd('syntax on')
    vim.g.syntax_on = true
    print("syntax on")
  end
end, { noremap = true, silent = true })

vim.keymap.set('n', '<leader>\\', function()
  if vim.wo.number or vim.wo.relativenumber then
    vim.wo.number = false
    vim.wo.rnu = false
    vim.opt.laststatus = 0
    vim.opt.ruler = false
  else
    vim.wo.number = true
    vim.wo.rnu = true
    vim.opt.laststatus = 2
    vim.opt.ruler = true
  end
end, { noremap = true, silent = true })

vim.g.theme_mode = 'dark'

vim.keymap.set('n', '<leader>th', function()
  if vim.g.theme_mode == 'dark' then
    vim.g.theme_mode = 'light'
    vim.cmd('set background=light')
    vim.cmd('colorscheme cybernetics-light')
  else
    vim.g.theme_mode = 'dark'
    vim.cmd('set background=dark')
    vim.cmd('colorscheme cybernetics')
  end
end, { noremap = true, silent = true })


function LoadLocal(local_task)
  vim.b.local_task = local_task
end

function RunLocal()
  vim.cmd(vim.b.local_task)
end

vim.cmd [[command! -nargs=1 LoadLocal call v:lua.LoadLocal(<f-args>)]]
vim.keymap.set('n', 'gxl', RunLocal, {desc="Buffer Task"})
vim.keymap.set('n', '<F2>', ':!gcc -Wall -Wextra -g3 -o %<.o % && ./%<.o<CR>')
vim.keymap.set('n', '<F3>', ':!make<CR>')

vim.keymap.set('n', '<leader>hd', function()
  local word = vim.fn.expand('<cword>')
  local num = tonumber(word) or tonumber(word, 16)
  if num then
    vim.lsp.util.open_floating_preview(
      { string.format('dec: %d', num), string.format('hex: 0x%X', num) },
      'plaintext',
      { focus = false }
    )
  end
end, { desc = 'Show decimal/hex' })

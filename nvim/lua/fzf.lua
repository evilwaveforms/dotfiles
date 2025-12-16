local M = {}

local RG_BASE_OPTS = "--column --hidden --line-number --no-heading --color=always --smart-case"
local RG_IGNORE = "-g '!{.git,build,node_modules,LC_MESSAGES,tags}'"
local PREVIEW_OPTS = {'--delimiter', ':', '--nth', '4..', '--preview-window', 'right:50%'}

local function execute_fzf_grep(rg_cmd_parts, query_prefill)
  local rg_command = table.concat(rg_cmd_parts, " ")
  local fzf_options = vim.list_extend({}, PREVIEW_OPTS)
  if query_prefill and query_prefill ~= '' then
    vim.list_extend(fzf_options, {'--query', query_prefill})
  end
  local spec = vim.fn['fzf#vim#with_preview']({options = fzf_options})
  vim.fn['fzf#vim#grep'](rg_command, spec, 1)
end

function M.vim_grep(args)
  local cmd_parts = {"rg", RG_BASE_OPTS, RG_IGNORE, vim.fn.shellescape(args or '')}
  execute_fzf_grep(cmd_parts)
end

local function search_visual_selection()
  vim.cmd('normal! "gy')
  local selection = vim.fn.getreg('g')
  if selection == "" then return end

  local trimmed = selection:match('^%s*(.-)%s*$')
  local is_multiline = trimmed:find('\n')
  local cmd_parts = {"rg"}
  if is_multiline then
    table.insert(cmd_parts, "--multiline")
  end
  table.insert(cmd_parts, "--fixed-strings")
  table.insert(cmd_parts, RG_BASE_OPTS)
  table.insert(cmd_parts, RG_IGNORE)
  table.insert(cmd_parts, vim.fn.shellescape(trimmed))
  local query_prefill = nil
  if not is_multiline then
    query_prefill = trimmed
  end
  execute_fzf_grep(cmd_parts, query_prefill)
end

function M.setup()
  vim.g.fzf_preview_window = {"right,50%,<70(up,40%)", "ctrl-/"}
  vim.env.FZF_DEFAULT_COMMAND = "rg --files --hidden " .. RG_IGNORE
  vim.g.fzf_action = {
    ['ctrl-c'] = function(files)
      require('nvim-claudecode-tmux').add_files(files)
    end,
  }
  vim.api.nvim_create_user_command('Rg', function(c)
    M.vim_grep(c.args)
  end, {bang = true, nargs = '*'})
  vim.keymap.set('v', '<C-f>', search_visual_selection, {
    noremap = true, silent = true, desc = 'Search visual selection with Rg'
  })
end

return M

local FZF = {}

local function vim_grep(args, bang)
  local query = ''
  if args ~= nil then
    query = vim.fn.shellescape(args)
  end

  local rg_command = "rg --column --hidden --line-number --no-heading --color=always --smart-case -g '!{build,node_modules,LC_MESSAGES}' " .. query
  local spec_with_preview = vim.fn['fzf#vim#with_preview']({
    options = '--delimiter : --nth 4.. --preview-window right:50%'
  })
  vim.fn['fzf#vim#grep'](rg_command, spec_with_preview, 1)
end

function FZF.setup()
  vim.g.fzf_preview_window = { "right,45%,<70(up,40%)", "ctrl-/" }
  vim.env.FZF_DEFAULT_COMMAND = "rg --files --hidden -g '!{build,node_modules,LC_MESSAGES}' "
  vim.api.nvim_create_user_command('Rg', function(c)
    vim_grep(c.args, c.bang)
  end, { bang = true, nargs = '*' })
end

return FZF

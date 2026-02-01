-- Neovim Clipboard Configuration for SSH/Tmux
-- Add this to your init.lua or init.vim to enable clipboard sharing over SSH

-- Enable OSC 52 clipboard support
vim.g.clipboard = {
  name = 'OSC 52',
  copy = {
    ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
    ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
  },
  paste = {
    ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
    ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
  },
}

-- Alternative: Manual OSC 52 implementation (if above doesn't work)
--[[
local function copy_to_clipboard(lines, _)
  local content = table.concat(lines, '\n')
  local b64 = vim.fn.system('base64', content)
  b64 = b64:gsub('\n', '')

  if os.getenv('TMUX') then
    -- Inside tmux
    vim.fn.system('echo -en "\\ePtmux;\\e\\e]52;c;' .. b64 .. '\\007\\e\\\\"')
  else
    -- Direct SSH
    vim.fn.system('echo -en "\\e]52;c;' .. b64 .. '\\007"')
  end
end

vim.g.clipboard = {
  name = 'OSC52',
  copy = { ['+'] = copy_to_clipboard, ['*'] = copy_to_clipboard },
  paste = { ['+'] = { 'pbpaste' }, ['*'] = { 'pbpaste' } },
}
]]--

-- Usage:
-- In visual mode: "+y to yank to system clipboard
-- In normal mode: "+p to paste from system clipboard
-- Or set clipboard=unnamedplus to always use system clipboard

-- Optional: Auto-use system clipboard for all operations
-- vim.opt.clipboard = 'unnamedplus'

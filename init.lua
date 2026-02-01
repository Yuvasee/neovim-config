-- Disable automatic root detection - always use cwd (must be before lazy)
vim.g.root_spec = { "cwd" }

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- OSC 52 clipboard support for SSH/tmux
require('clipboard')

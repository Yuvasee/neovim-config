-- Built-in OSC 52 clipboard (nvim 0.10+)
return {
  dir = "~", -- dummy dir, no actual plugin
  name = "osc52-clipboard",
  lazy = false,
  priority = 1000,
  config = function()
    vim.g.clipboard = {
      name = "OSC 52",
      copy = {
        ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
        ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
      },
      paste = {
        ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
        ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
      },
    }
  end,
}

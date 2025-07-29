-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Copy filename
vim.keymap.set("n", "<leader>y", function()
  local filename = vim.fn.expand("%:t")
  vim.fn.setreg("+", filename)
  vim.notify("Copied: " .. filename)
end, { desc = "Copy filename to clipboard" })

-- Copy full path
vim.keymap.set("n", "<leader>Y", function()
  local filepath = vim.fn.expand("%:p")
  vim.fn.setreg("+", filepath)
  vim.notify("Copied: " .. filepath)
end, { desc = "Copy filepath to clipboard" })

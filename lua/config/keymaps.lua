-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Copy filename
vim.keymap.set("n", "<leader>y", function()
  local filename = vim.fn.expand("%:t")
  vim.fn.setreg("+", filename)
  vim.notify("Copied: " .. filename)
end, { desc = "Copy filename to clipboard" })

-- Copy relative path
vim.keymap.set("n", "<leader>Y", function()
  local filepath = vim.fn.expand("%")
  vim.fn.setreg("+", filepath)
  vim.notify("Copied: " .. filepath)
end, { desc = "Copy relative path to clipboard" })

-- Alt-arrow word movement in insert mode
vim.keymap.set("i", "<M-Left>", "<C-o>b", { desc = "Move word backward in insert mode" })
vim.keymap.set("i", "<M-Right>", "<C-o>w", { desc = "Move word forward in insert mode" })
-- Alternative mappings if alt-arrows don't work on macOS
vim.keymap.set("i", "<A-Left>", "<C-o>b", { desc = "Move word backward in insert mode (alt)" })
vim.keymap.set("i", "<A-Right>", "<C-o>w", { desc = "Move word forward in insert mode (alt)" })

-- Diffview main branch comparison
vim.keymap.set("n", "<leader>gm", "<cmd>DiffviewOpen main<cr>", { desc = "Diffview against main branch" })

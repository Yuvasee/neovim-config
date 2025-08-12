return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewFileHistory" },
  keys = {
    { "<leader>ga", "<cmd>DiffviewOpen<cr>", desc = "Open Diffview", mode = { "n", "v" } },
    { "<leader>gc", "<cmd>DiffviewOpen HEAD~1<cr>", desc = "Diffview vs 1 commit back", mode = { "n", "v" } },
    { "<leader>gA", "<cmd>DiffviewClose<cr>", desc = "Close Diffview" },
  },
  opts = {
    file_panel = {
      win_config = {
        width = 50,
      },
    },
    diff_view = {
      options = {
        diff_context = 99999, -- Show the entire file
      },
    },
    hooks = {
      diff_buf_read = function()
        vim.opt_local.foldenable = false
      end,
    },
  },
}
return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewFileHistory" },
  keys = {
    { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Diffview", mode = { "n", "v" } },
    { "<leader>gD", "<cmd>DiffviewClose<cr>", desc = "Close Diffview" },
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

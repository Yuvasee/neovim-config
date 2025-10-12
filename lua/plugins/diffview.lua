return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewFileHistory" },
  keys = {
    { "<leader>ga", "<cmd>DiffviewOpen<cr>", desc = "Open Diffview", mode = { "n", "v" } },
    {
      "<leader>gc",
      function()
        local count = vim.v.count1
        vim.cmd("DiffviewOpen HEAD~" .. count)
      end,
      desc = "Diffview vs N commits back",
      mode = { "n", "v" },
    },
    { "<leader>gm", "<cmd>DiffviewOpen origin/main<cr>", desc = "Diffview vs main branch", mode = { "n", "v" } },
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
return {
  "mistweaverco/kulala.nvim",
  ft = "http",
  keys = {
    { "<leader>r", desc = "REST Request" },
    { "<leader>rr", "<cmd>lua require('kulala').run()<cr>", desc = "Run request" },
    { "<leader>rt", "<cmd>lua require('kulala').toggle_view()<cr>", desc = "Toggle view" },
    { "<leader>rp", "<cmd>lua require('kulala').jump_prev()<cr>", desc = "Previous request" },
    { "<leader>rn", "<cmd>lua require('kulala').jump_next()<cr>", desc = "Next request" },
    { "<leader>ri", "<cmd>lua require('kulala').inspect()<cr>", desc = "Inspect" },
  },
  opts = {
    -- default_view = "headers_body",
    -- debug = false,
  },
  config = function(_, opts)
    require("kulala").setup(opts)
  end,
}
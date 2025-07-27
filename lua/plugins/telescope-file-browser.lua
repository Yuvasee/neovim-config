return {
  "nvim-telescope/telescope-file-browser.nvim",
  dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  keys = {
    {
      "<leader>fB",
      "<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>",
      desc = "File Browser (current file)",
    },
    {
      "<leader>fb",
      "<cmd>Telescope file_browser<cr>",
      desc = "File Browser (cwd)",
    },
  },
  config = function()
    require("telescope").load_extension("file_browser")
  end,
}
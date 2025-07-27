return {
  -- Project management
  {
    "ahmedkhalf/project.nvim",
    opts = {
      -- Manual mode allows you to manually add projects
      manual_mode = false,
      -- Detection methods: "lsp" or "pattern"
      detection_methods = { "lsp", "pattern" },
      -- Patterns to detect project root
      patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "go.mod", "Cargo.toml" },
      -- Show hidden files in telescope
      show_hidden = false,
      -- Don't change directory when opening project
      silent_chdir = true,
      -- What scope to change the directory
      scope_chdir = "global",
      -- Path where project.nvim will store the project history
      datapath = vim.fn.stdpath("data"),
    },
    event = "VeryLazy",
    config = function(_, opts)
      require("project_nvim").setup(opts)
      require("telescope").load_extension("projects")
    end,
    keys = {
      { "<leader>fp", "<cmd>Telescope projects<cr>", desc = "Projects" },
    },
  },
}
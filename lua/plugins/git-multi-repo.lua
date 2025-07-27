return {
  -- LazyGit integration with enhanced features
  {
    "kdheepak/lazygit.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("telescope").load_extension("lazygit")
      vim.g.lazygit_floating_window_scaling_factor = 0.9
      vim.g.lazygit_use_neovim_remote = 1
    end,
    keys = {
      { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
      { "<leader>gl", "<cmd>Telescope lazygit<cr>", desc = "LazyGit Repos" },
    },
  },

  -- Git worktree for parallel branch development
  {
    "ThePrimeagen/git-worktree.nvim",
    config = function()
      require("git-worktree").setup({
        change_directory_command = "cd",
        update_on_change = true,
        clearjumps_on_change = true,
      })
      require("telescope").load_extension("git_worktree")
    end,
    keys = {
      { "<leader>gws", function()
        require('telescope').extensions.git_worktree.git_worktrees()
      end, desc = "Switch Worktree" },
      { "<leader>gwc", function()
        require('telescope').extensions.git_worktree.create_git_worktree()
      end, desc = "Create Worktree" },
    },
  },

  -- Enhanced Git signs with multi-repo awareness
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        untracked = { text = "┆" },
      },
    },
  },

  -- Project management for repository switching
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup({
        detection_methods = { "lsp", "pattern" },
        patterns = { ".git", "package.json", "pyproject.toml", "Cargo.toml" },
      })
      require("telescope").load_extension("projects")
    end,
    keys = {
      { "<leader>pp", "<cmd>Telescope projects<cr>", desc = "Switch Project" },
    },
  },

  -- Diffview for git diff visualization
  {
    "sindrets/diffview.nvim",
    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Open Diffview" },
      { "<leader>gD", "<cmd>DiffviewClose<cr>", desc = "Close Diffview" },
      { "<leader>gh", "<cmd>DiffviewFileHistory<cr>", desc = "File History" },
    },
    opts = {
      enhanced_diff_hl = true,
      view = {
        default = {
          layout = "diff2_horizontal",
        },
      },
    },
  },
}
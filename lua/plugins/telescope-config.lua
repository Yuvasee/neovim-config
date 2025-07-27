return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- Override the default <leader>ff to include hidden files
      {
        "<leader>ff",
        function()
          require("telescope.builtin").find_files({
            hidden = true,
            no_ignore = true,
          })
        end,
        desc = "Find Files (including hidden/ignored)",
      },
      -- Add alternative mapping for non-hidden files
      {
        "<leader>fF",
        function()
          require("telescope.builtin").find_files({
            hidden = false,
            no_ignore = false,
          })
        end,
        desc = "Find Files (no hidden/ignored)",
      },
      -- Add mapping for hidden files only
      {
        "<leader>fH",
        function()
          require("telescope.builtin").find_files({
            hidden = true,
            no_ignore = false,  -- Still respect .gitignore
          })
        end,
        desc = "Find Files (hidden only)",
      },
    },
    opts = {
      defaults = {
        -- You can also set default behavior here
        file_ignore_patterns = {
          "node_modules",
          ".git/",
          ".cache",
          "%.o",
          "%.a",
          "%.out",
          "%.class",
          "%.pdf",
          "%.mkv",
          "%.mp4",
          "%.zip",
        },
      },
    },
  },
}
-- Override LazyVim git keymaps to prevent conflicts with Diffview
return {
  "lewis6991/gitsigns.nvim",
  opts = function(_, opts)
    -- Ensure gitsigns doesn't override our <leader>gd mapping
    return opts
  end,
  keys = {
    -- Add git hunk navigation and preview on different keys
    {
      "]h",
      function()
        require("gitsigns").next_hunk()
      end,
      desc = "Next Git Hunk",
    },
    {
      "[h",
      function()
        require("gitsigns").prev_hunk()
      end,
      desc = "Previous Git Hunk",
    },
    {
      "<leader>gh",
      function()
        require("gitsigns").preview_hunk()
      end,
      desc = "Preview Git Hunk",
    },
    {
      "<leader>gH",
      function()
        require("gitsigns").preview_hunk_inline()
      end,
      desc = "Preview Git Hunk Inline",
    },
    {
      "<leader>gr",
      function()
        require("gitsigns").reset_hunk()
      end,
      desc = "Reset Git Hunk",
    },
    {
      "<leader>gR",
      function()
        require("gitsigns").reset_buffer()
      end,
      desc = "Reset Git Buffer",
    },
    {
      "<leader>gs",
      function()
        require("gitsigns").stage_hunk()
      end,
      desc = "Stage Git Hunk",
    },
    {
      "<leader>gS",
      function()
        require("gitsigns").stage_buffer()
      end,
      desc = "Stage Git Buffer",
    },
    {
      "<leader>gu",
      function()
        require("gitsigns").undo_stage_hunk()
      end,
      desc = "Undo Stage Git Hunk",
    },
    {
      "<leader>gb",
      function()
        require("gitsigns").blame_line({ full = true })
      end,
      desc = "Git Blame Line",
    },
    {
      "<leader>gB",
      function()
        require("gitsigns").toggle_current_line_blame()
      end,
      desc = "Toggle Git Blame",
    },
  },
}


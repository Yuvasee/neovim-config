return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        explorer = {
          hidden = true,
          ignored = true,
          follow_file = false,
          auto_close = false,
          layout = {
            width = 40,
            min_width = 40,
            position = "left",
            preview = false,
          },
        },
      },
    },
    explorer = {
      replace_netrw = true,
    },
  },
}
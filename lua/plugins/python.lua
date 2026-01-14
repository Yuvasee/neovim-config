return {
  {
    "linux-cultist/venv-selector.nvim",
    branch = "main",
    opts = {
      options = {
        debug = true,
        notify_user_on_venv_activation = true,
      },
      search = {
        avon = {
          command = "fd '/bin/python$' /home/dev/avon-ai/.venv --full-path --color never",
        },
      },
    },
  },
}

return {
  {
    "mfussenegger/nvim-dap",
    opts = function()
      local dap = require("dap")

      table.insert(dap.configurations.python, {
        type = "python",
        request = "attach",
        name = "Database Service",
        connect = {
          host = "localhost",
          port = 9992,
        },
        pathMappings = {
          {
            localRoot = vim.fn.getcwd() .. "/conversations-monitoring-system/database_service",
            remoteRoot = "/app",
          },
          {
            localRoot = vim.fn.getcwd() .. "/conversations-monitoring-system/bff_service",
            remoteRoot = "/app",
          },
          {
            localRoot = vim.fn.getcwd() .. "/avoncore/python",
            remoteRoot = "/avoncore",
          },
        },
      })
    end,
  },
}

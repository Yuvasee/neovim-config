return {
  {
    "mfussenegger/nvim-dap",
    keys = {
      { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
      { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
      { "<leader>dc", function() require("dap").continue() end, desc = "Continue" },
      { "<leader>dC", function() require("dap").run_to_cursor() end, desc = "Run to Cursor" },
      { "<leader>dg", function() require("dap").goto_() end, desc = "Go to line (no execute)" },
      { "<leader>di", function() require("dap").step_into() end, desc = "Step Into" },
      { "<leader>dj", function() require("dap").down() end, desc = "Down" },
      { "<leader>dk", function() require("dap").up() end, desc = "Up" },
      { "<leader>dl", function() require("dap").run_last() end, desc = "Run Last" },
      { "<leader>do", function() require("dap").step_out() end, desc = "Step Out" },
      { "<leader>dO", function() require("dap").step_over() end, desc = "Step Over" },
      { "<leader>dp", function() require("dap").pause() end, desc = "Pause" },
      { "<leader>dr", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
      { "<leader>ds", function() require("dap").session() end, desc = "Session" },
      { "<leader>dt", function() require("dap").terminate() end, desc = "Terminate" },
      { "<leader>dw", function() require("dap.ui.widgets").hover() end, desc = "Widgets" },
    },
    opts = function()
      local dap = require("dap")

      -- BFF Service
      table.insert(dap.configurations.python, {
        type = "python",
        request = "attach",
        name = "BFF Service",
        connect = {
          host = "localhost",
          port = 9991,
        },
        pathMappings = {
          {
            localRoot = vim.fn.getcwd() .. "/conversations-monitoring-system/bff_service",
            remoteRoot = "/conversations-monitoring-system/bff_service",
          },
          {
            localRoot = vim.fn.getcwd() .. "/avoncore/python",
            remoteRoot = "/avoncore",
          },
        },
      })

      -- Database Service
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
            remoteRoot = "/conversations-monitoring-system/database_service",
          },
          {
            localRoot = vim.fn.getcwd() .. "/avoncore/python",
            remoteRoot = "/avoncore",
          },
        },
      })

      -- Test Runner Service
      table.insert(dap.configurations.python, {
        type = "python",
        request = "attach",
        name = "Test Runner Service",
        connect = {
          host = "localhost",
          port = 9993,
        },
        pathMappings = {
          {
            localRoot = vim.fn.getcwd() .. "/conversations-monitoring-system/test_runner_service",
            remoteRoot = "/app",
          },
          {
            localRoot = vim.fn.getcwd() .. "/avoncore/python",
            remoteRoot = "/avoncore",
          },
        },
      })

      -- Enterprise AI Agents
      table.insert(dap.configurations.python, {
        type = "python",
        request = "attach",
        name = "Enterprise AI Agents",
        connect = {
          host = "localhost",
          port = 5678,
        },
        pathMappings = {
          {
            localRoot = vim.fn.getcwd(),
            remoteRoot = "/app",
          },
        },
      })

      -- Registry Service
      table.insert(dap.configurations.python, {
        type = "python",
        request = "attach",
        name = "Registry Service",
        connect = {
          host = "localhost",
          port = 9994,
        },
        pathMappings = {
          {
            localRoot = vim.fn.getcwd() .. "/conversations-monitoring-system/registry_service",
            remoteRoot = "/conversations-monitoring-system/registry_service",
          },
          {
            localRoot = vim.fn.getcwd() .. "/avoncore/python",
            remoteRoot = "/avoncore",
          },
        },
      })

      -- Validation Job Service
      table.insert(dap.configurations.python, {
        type = "python",
        request = "attach",
        name = "Validation Job Service",
        connect = {
          host = "localhost",
          port = 9995,
        },
        pathMappings = {
          {
            localRoot = vim.fn.getcwd() .. "/conversations-monitoring-system/validation_job_service",
            remoteRoot = "/conversations-monitoring-system/validation_job_service",
          },
          {
            localRoot = vim.fn.getcwd() .. "/avoncore/python",
            remoteRoot = "/avoncore",
          },
        },
      })
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "nvim-neotest/nvim-nio" },
    keys = {
      { "<leader>du", function() require("dapui").toggle({ }) end, desc = "Dap UI" },
      { "<leader>de", function() require("dapui").eval() end, desc = "Eval", mode = {"n", "v"} },
    },
    opts = {},
    config = function(_, opts)
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup(opts)
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open({})
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close({})
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close({})
      end
    end,
  },
}

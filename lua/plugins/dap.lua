return {
  {
    "mfussenegger/nvim-dap",
    keys = {
      -- Function keys (traditional debugging keys)
      {
        "<F5>",
        function()
          require("dap").continue()
        end,
        desc = "Debug: Continue",
      },
      {
        "<F9>",
        function()
          require("dap").toggle_breakpoint()
        end,
        desc = "Debug: Toggle Breakpoint",
      },
      {
        "<F10>",
        function()
          require("dap").step_over()
        end,
        desc = "Debug: Step Over",
      },
      {
        "<F11>",
        function()
          require("dap").step_into()
        end,
        desc = "Debug: Step Into",
      },
      {
        "<F12>",
        function()
          require("dap").step_out()
        end,
        desc = "Debug: Step Out",
      },
      {
        "<S-F5>",
        function()
          require("dap").terminate()
        end,
        desc = "Debug: Terminate",
      },
      -- Leader key mappings for additional functionality
      {
        "<leader>db",
        function()
          require("dap").toggle_breakpoint()
        end,
        desc = "Toggle Breakpoint",
      },
      {
        "<leader>dB",
        function()
          require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
        end,
        desc = "Breakpoint Condition",
      },
      {
        "<leader>dc",
        function()
          require("dap").continue()
        end,
        desc = "Continue",
      },
      {
        "<leader>dd",
        function()
          require("dap").disconnect()
        end,
        desc = "Disconnect",
      },
      {
        "<leader>dC",
        function()
          require("dap").run_to_cursor()
        end,
        desc = "Run to Cursor",
      },
      {
        "<leader>dg",
        function()
          require("dap").goto_()
        end,
        desc = "Go to line (no execute)",
      },
      {
        "<leader>dj",
        function()
          require("dap").down()
        end,
        desc = "Down",
      },
      {
        "<leader>dk",
        function()
          require("dap").up()
        end,
        desc = "Up",
      },
      {
        "<leader>dl",
        function()
          require("dap").run_last()
        end,
        desc = "Run Last",
      },
      {
        "<leader>dp",
        function()
          require("dap").pause()
        end,
        desc = "Pause",
      },
      {
        "<leader>dr",
        function()
          require("dap").repl.toggle()
        end,
        desc = "Toggle REPL",
      },
      {
        "<leader>ds",
        function()
          require("dap").session()
        end,
        desc = "Session",
      },
      {
        "<leader>dw",
        function()
          require("dap.ui.widgets").hover()
        end,
        desc = "Widgets",
      },
    },
    opts = function()
      local dap = require("dap")
      dap.configurations.python = dap.configurations.python or {}

      -- BFF Service (Port 8000 -> Debug 9991)
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
            localRoot = "/Users/yuri/avon-ai/singularity/conversations-monitoring-system/bff_service",
            remoteRoot = "/avon/conversations-monitoring-system/bff_service",
          },
          {
            localRoot = "/Users/yuri/avon-ai/singularity/avoncore",
            remoteRoot = "/avon/avoncore",
          },
        },
      })

      -- Database Service (Port 8002 -> Debug 9992)
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
            localRoot = "/Users/yuri/avon-ai/singularity/conversations-monitoring-system/database_service",
            remoteRoot = "/avon/conversations-monitoring-system/database_service",
          },
          {
            localRoot = "/Users/yuri/avon-ai/singularity/avoncore",
            remoteRoot = "/avon/avoncore",
          },
        },
      })

      -- Test Runner Service (Port 8006 -> Debug 9993)
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
            localRoot = "/Users/yuri/avon-ai/singularity/conversations-monitoring-system/test_runner_service",
            remoteRoot = "/avon/conversations-monitoring-system/test_runner_service",
          },
          {
            localRoot = "/Users/yuri/avon-ai/singularity/avoncore",
            remoteRoot = "/avon/avoncore",
          },
        },
      })

      -- Registry Service (Port 8001 -> Debug 9994)
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
            localRoot = "/Users/yuri/avon-ai/singularity/conversations-monitoring-system/registry",
            remoteRoot = "/avon/conversations-monitoring-system/registry",
          },
          {
            localRoot = "/Users/yuri/avon-ai/singularity/avoncore",
            remoteRoot = "/avon/avoncore",
          },
        },
      })

      -- Validation Job Service (Port 8003 -> Debug 9995)
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
            localRoot = "/Users/yuri/avon-ai/singularity/conversations-monitoring-system/validation_job",
            remoteRoot = "/avon/conversations-monitoring-system/validation_job",
          },
          {
            localRoot = "/Users/yuri/avon-ai/singularity/avoncore",
            remoteRoot = "/avon/avoncore",
          },
        },
      })

      -- Data Ingestion Service (Port 8005 -> Debug 9996)
      table.insert(dap.configurations.python, {
        type = "python",
        request = "attach",
        name = "Data Ingestion Service",
        connect = {
          host = "localhost",
          port = 9996,
        },
        pathMappings = {
          {
            localRoot = "/Users/yuri/avon-ai/singularity/conversations-monitoring-system/data_ingestion",
            remoteRoot = "/avon/conversations-monitoring-system/data_ingestion",
          },
          {
            localRoot = "/Users/yuri/avon-ai/singularity/avoncore",
            remoteRoot = "/avon/avoncore",
          },
        },
      })

      -- KB Service (Port 8004 -> Debug 9997)
      table.insert(dap.configurations.python, {
        type = "python",
        request = "attach",
        name = "KB Service",
        connect = {
          host = "localhost",
          port = 9997,
        },
        pathMappings = {
          {
            localRoot = "/Users/yuri/avon-ai/singularity/conversations-monitoring-system/kb_service",
            remoteRoot = "/avon/conversations-monitoring-system/kb_service",
          },
          {
            localRoot = "/Users/yuri/avon-ai/singularity/avoncore",
            remoteRoot = "/avon/avoncore",
          },
        },
      })

      -- Enterprise AI Agents (Port 8020 -> Debug 5678)
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
            localRoot = "/Users/yuri/avon-ai/singularity/enterprise-ai-agents",
            remoteRoot = "/avon/enterprise-ai-agents",
          },
          {
            localRoot = "/Users/yuri/avon-ai/singularity/avoncore",
            remoteRoot = "/avon/avoncore",
          },
        },
      })
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "nvim-neotest/nvim-nio" },
    keys = {
      {
        "<leader>du",
        function()
          require("dapui").toggle({})
        end,
        desc = "Dap UI",
      },
      {
        "<leader>de",
        function()
          require("dapui").eval()
        end,
        desc = "Eval",
        mode = { "n", "v" },
      },
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

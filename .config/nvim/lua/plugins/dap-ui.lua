return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
    },
  },
  {
    "rcarriga/nvim-dap-ui",
    -- dependencies = {
    --   "nvim-neo-tree/neo-tree.nvim",
    -- },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      -- local neotree_api = require("neo-tree.api")

      local dapui_layout_options = {
        layouts = {
          {
            elements = {
              { id = "scopes", size = 0.5 },
              { id = "breakpoints", size = 0.1 },
              { id = "stacks", size = 0.1 },
              { id = "watches", size = 0.3 },
            },
            size = 50,
            position = "left",
          },
          {
            elements = {
              { id = "repl", size = 0.2 },
              { id = "console", size = 0.8 },
            },
            size = 5,
            position = "bottom",
          },
        },
      }

      dapui.setup(dapui_layout_options)

      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        -- neotree_api.tree.close()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
        -- neotree_api.tree.open()
      end
    end,
  },
}

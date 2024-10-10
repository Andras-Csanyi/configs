return {
  "rcasia/neotest-java",
  ft = "java",
  dependencies = {
    "mfussenegger/nvim-jdtls",
    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
  },
  {
    "Issafalcon/neotest-dotnet",
    ft = "cs",
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      -- dotnet
      -- java
    },
    opts = {
      adapters = {
        ["neotest-dotnet"] = {
          dap = {
            args = { justMyCode = false },
            adapter_name = "netcoredbg",
          },
          custom_attributes = {},
          dotnet_additional_args = {
            "--verbosity detailed",
          },
          discovery_root = "solution",
        },
        ["neotest-java"] = {
          junit_jar = nil,
          incremental_build = true,
        },
      },
    },
  },
}

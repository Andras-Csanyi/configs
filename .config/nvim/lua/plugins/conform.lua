return {
  "stevearc/conform.nvim",
  optional = true,
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      cs = { "csharpier" },
      go = { "goimports-reviser" },
    },
  },
}

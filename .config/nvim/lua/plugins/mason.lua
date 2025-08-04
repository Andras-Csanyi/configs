return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "prettier",
      "postgrestools",
      "roslyn",
    },
  },
  config = function(_, _)
    require("mason").setup({
      registries = {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry",
      },
    })
  end,
}

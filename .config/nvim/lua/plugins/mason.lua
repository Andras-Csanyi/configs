return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      -- go
      "goimports",
      "gofumpt",
      "gomodifytags",
      "impl",
      "delve",
      "html-lsp",
      "netcoredbg",
    },
  },
}

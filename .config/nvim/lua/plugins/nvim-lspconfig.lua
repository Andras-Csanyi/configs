return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      postgres_lsp = {
        filetypes = { "sql" },
        root_dir = require("lspconfig.util").root_pattern(".git", "package.json"),
      },
    },
    inlay_hints = {
      enabled = true,
    },
    diagnostics = {
      virtual_text = false,
      update_in_insert = true,
      float = {
        show_header = true,
        source = "always",
        border = "rounded",
        focusable = false,
      },
    },
  },
}

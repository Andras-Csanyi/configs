return {
  "nvim-lspconfig",
  opts = {
    inlay_hints = {
      enabled = false,
      exclude = {
        "java",
        "csharp",
      },
    },
    diagnostics = {
      virtual_text = false,
      update_in_insert = true,
    },
  },
}

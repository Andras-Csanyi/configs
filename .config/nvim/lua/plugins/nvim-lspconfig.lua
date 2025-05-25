return {
  "nvim-lspconfig",
  dependencies = {
    "nvim-java/nvim-java",
  },
  config = function()
    require("lspconfig")["jdtls"].setup({})
  end,
  opts = {
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

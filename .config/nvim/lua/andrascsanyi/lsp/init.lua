local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require("andrascsanyi.lsp.mason")
require("andrascsanyi.lsp.handlers").setup()
require("andrascsanyi.lsp.null-ls")

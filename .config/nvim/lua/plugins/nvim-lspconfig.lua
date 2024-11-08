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
    -- go settings
    servers = {
      gopls = {
        settings = {
          gopls = {
            gofmt = true,
            codelenses = {
              gc_details = false,
              generate = true,
              regenerate_gco = true,
              run_govulncheck = true,
              test = true,
              tidy = true,
              upgrade_dependency = true,
              vendor = true,
            },
          },
          hints = {
            assignVariableTypes = true,
            compositeLiteralFields = true,
            compositeLiteralTypes = true,
            constantValues = true,
            functionTypeParameters = true,
            parameterNames = true,
            rangeVariableTypes = true,
          },
          analyses = {
            fieldalignment = true,
            nilness = true,
            unusedparams = true,
            unusedwrite = true,
            useany = true,
          },
          usePlaceholders = true,
          completeUnimported = true,
          staticcheck = true,
          directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
        },
      },
    },
  },
  setup = {
    gopls = function(_, opts)
      LazyVim.lsp.on_attach(function(client, _)
        if not client.server_capabilities.semanticTokensProvider then
          local semantic = client.config.capabilities.textDocument.semanticTokens
          client.server_capabilities.semanticTokensProvider = {
            full = true,
            legend = {
              tokenTypes = semantic.tokenTypes,
              tokenModifiers = semantic.tokenModifiers,
            },
            range = true,
          }
        end
      end, "gopls")
    end,
  },
}

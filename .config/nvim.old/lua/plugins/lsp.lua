local installed_servers = {
  "lua_ls",
  "cssls",
  "html",
  "ts_ls",
  "bashls",
  "jsonls",
  "yamlls",
  "jdtls",
  "marksman"
}

local an_lsp_config_template = function()
  local t = {}
  t.capabilties = vim.lsp.protocol.make_client_capabilities()
  t.capabilties.textDocument.completion.completionItem.snippetSupport = true
  -- cmp magic comes here
  t.setup = function()
    local signs = {
      { name = "DiagnosticSignError", text = "" },
      { name = "DiagnosticSignWarn", text = "" },
      { name = "DiagnosticSignHint", text = "" },
      { name = "DiagnosticSignInfo", text = "" },
    }

    for _, sign in ipairs(signs) do
      vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
    end

    local config = {
      -- disable virtual text
      virtual_text = false,
      signs = {
        active = signs,
      },
      update_in_insert = true,
      underline = true,
      severity_sort = true,
      float = {
        focusable = true,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
    }

    vim.diagnostic.config(config)

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
      border = "rounded",
    })
  end
  return t
end

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason-lspconfig.nvim",
    },
    config = function()
      local lang_specific_lsp_config = {}
      for _, server in pairs(installed_servers) do
        lang_specific_lsp_config = {
          on_attach = an_lsp_config_template.on_attach(),
          capabilities = an_lsp_config_template.capabilities()
        }

        server = vim.split(server, "@")[1]

        local status_ok, specific_server_config = pcall(require, "andrascsanyi.lsp.configs." .. server)
        if status_ok then
          lanq_specific_lsp_config = vim.tbl_deep_extend("force", specific_server_config, lang_specific_lsp_config)
        end
        require("lspconfig")[server].setup(lang_specific_lsp_config)
      end
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    cmd = { "LspInstall", "LspUninstall" },
    dependencies = "mason.nvim",
    config = function()
      local settings = {
        ensure_installed = installed_servers,
        automatic_installation = true,
      }
      require("mason-lspconfig").setup(settings)
    end
  },
  {
    {
      "williamboman/mason.nvim",
      cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
      config = function()
        local settings = {
          ui = {
            check_outdated_packages_on_open = true,
          },
          icons = {
            package_installed = "◍",
            package_pending = "◍",
            package_uninstalled = "◍",
          },
          log_level = vim.log.levels.INFO,
        }
        require("mason").setup(settings)
      end,
      build = function()
        pcall(function()
          require("mason-registry").refresh()
        end)
      end,
    },
  }
}

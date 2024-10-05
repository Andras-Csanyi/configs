-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- Path
local HOME = os.getenv("HOME")
local roslynDir = '.local/share/lvim/roslyn'
local platform = 'osx-arm64'
local roslynLangServerExecutable = 'Microsoft.CodeAnalysis.LanguageServer.dll'
local roslynExecutable = HOME .. '/' .. roslynDir .. '/' .. platform .. '/' .. roslynLangServerExecutable

-- Global config
vim.opt.cmdheight = 2;
vim.opt.relativenumber = true;
vim.opt.tabstop = 4;
vim.opt.shiftwidth = 4;
vim.opt.expandtab = true;

----------------
--- Settings ---
----------------

-- Core plugin settings --

lvim.builtin.nvimtree.setup.view.width = 50;
vim.list_extend(
  lvim.lsp.automatic_configuration.skipped_servers,
  {
    "jdtls",
    "csharp_ls",
    "omnisharp"
  }
)

---------------
--- Plugins ---
---------------

lvim.plugins = {
  {
    -- java stuff dependencies
    "mfussenegger/nvim-jdtls",
    "nvim-telescope/telescope-ui-select.nvim"
  },
  {
    -- telescope dependencies
    "BurntSushi/ripgrep",
    "sharkdp/fd"
  },
  {
    "seblj/roslyn.nvim"
  },
  {
    "lervag/vimtex",
    init = function()
      vim.g.vimtex_view_general_viewer = 'okular'
      vim.g.vimtex_view_general_options = [[--unique file:@pdf\#src:@line@tex]]
      vim.g.vimtex_quickfix_enabled = 1
      vim.g.vimtex_syntax_enabled = 1
      vim.g.vimtex_quickfix_mode = 0
    end,
  }
}

require("roslyn").setup({
  config = {
    settings = {
      ["csharp|inlay_hints"] = {
        csharp_enable_inlay_hints_for_implicit_object_creation = true,
        csharp_enable_inlay_hints_for_implicit_variable_types = true,
        csharp_enable_inlay_hints_for_lambda_parameter_types = true,
        csharp_enable_inlay_hints_for_types = true,
        dotnet_enable_inlay_hints_for_indexer_parameters = true,
        dotnet_enable_inlay_hints_for_literal_parameters = true,
        dotnet_enable_inlay_hints_for_object_creation_parameters = true,
        dotnet_enable_inlay_hints_for_other_parameters = true,
        dotnet_enable_inlay_hints_for_parameters = true,
        dotnet_suppress_inlay_hints_for_parameters_that_differ_only_by_suffix = true,
        dotnet_suppress_inlay_hints_for_parameters_that_match_argument_name = true,
        dotnet_suppress_inlay_hints_for_parameters_that_match_method_intent = true,
      },
      ["code_style|formatting|new_line"] = {
        insert_final_newline = true
      },
      ["code_style|code_style|formatting|indentation_and_spacing"] = {
        indent_size = 4,
        indent_style = 4,
        tab_width = 4,
      },
      ["code_style|code_style|formatting|new_line"] = {
        end_of_line = true
      },
      ["csharp|background_analysis"] = {
        dotnet_analyzer_diagnostics_scope = true,
        dotnet_compiler_diagnostics_scope = true
      },
      ["csharp|code_lens"] = {
        dotnet_enable_references_code_lens = true,
        dotnet_enable_tests_code_lens = true
      },
      ["csharp|completion"] = {
        dotnet_provide_regex_completions = true,
        dotnet_show_completion_items_from_unimported_namespaces = true,
        dotnet_show_name_completion_suggestions = true
      },
      ["csharp|quick_info"] = {
        dotnet_show_remarks_in_quick_info = true
      },
      ["csharp|symbol_search"] = {
        dotnet_search_reference_assemblies = true
      },
      ["mystery_language|Highlighting"] = {
        dotnet_highlight_related_json_components = true
      },
      ["mystery_language|background_analysis"] = {
        dotnet_analyzer_diagnostics_scope = true,
        dotnet_compiler_diagnostics_scope = true
      },
      ["mystery_language|code_lens"] = {
        dotnet_enable_references_code_lens = true,
        dotnet_enable_tests_code_lens = true
      },
      ["mystery_language|completion"] = {
        dotnet_provide_regex_completions = true,
        dotnet_show_completion_items_from_unimported_namespaces = true,
        dotnet_show_name_completion_suggestions = true
      },
      ["mystery_language|highlighting"] = {
        dotnet_highlight_related_regex_components = true
      },
      ["mystery_language|implement_type"] = {
        dotnet_insertion_behavior = true,
        dotnet_property_generation_behavior = true
      },
    }
  },
  exe = {
    "dotnet", roslynExecutable

  },
  filewatcing = true
})


---------------
--- Linting ---
---------------

local null_ls_status_ok, null_ls = pcall(require, "null-ls");
if not null_ls_status_ok then
  return
end

local formatting = null_ls.builtins.formatting;
local diagnostics = null_ls.builtins.diagnostics;
local home = os.getenv "HOME"
null_ls.setup({
  sources = {

    -- java

    diagnostics.checkstyle.with({
      extra_args = { "-c", home .. "/.config/lvim/java_configs/google_checks.xml" },
      filetypes = { "java" },
      method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
      command = "checkstyle"
    }),

    -- json, yml, graphql

    formatting.prettier.with({
      filetypes = { "json", "yaml", "grapql", "graphqls" },
      method = null_ls.methods.FORMATTING,
      command = "prettier"
    })
  }
})

require("telescope").setup {
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {}
    }
  }
}

require("telescope").load_extension("ui-select")

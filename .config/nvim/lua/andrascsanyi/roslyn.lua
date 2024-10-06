local roslyn_status_ok, roslyn = pcall(require, "roslyn")
if not roslyn_status_ok then
	print("Roslyn init failed")
	return
end

local HOME = os.getenv("HOME")
local roslynDir = ".local/share/nvim/roslyn"
local platform = "osx-arm64"
local roslynLangServerExecutable = "Microsoft.CodeAnalysis.LanguageServer.dll"
local roslynExecutable = HOME .. "/" .. roslynDir .. "/" .. platform .. "/" .. roslynLangServerExecutable

roslyn.setup({
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
				insert_final_newline = true,
			},
			["code_style|code_style|formatting|indentation_and_spacing"] = {
				indent_size = 4,
				indent_style = 4,
				tab_width = 4,
			},
			["code_style|code_style|formatting|new_line"] = {
				end_of_line = true,
			},
			["csharp|background_analysis"] = {
				dotnet_analyzer_diagnostics_scope = true,
				dotnet_compiler_diagnostics_scope = true,
			},
			["csharp|code_lens"] = {
				dotnet_enable_references_code_lens = true,
				dotnet_enable_tests_code_lens = true,
			},
			["csharp|completion"] = {
				dotnet_provide_regex_completions = true,
				dotnet_show_completion_items_from_unimported_namespaces = true,
				dotnet_show_name_completion_suggestions = true,
			},
			["csharp|quick_info"] = {
				dotnet_show_remarks_in_quick_info = true,
			},
			["csharp|symbol_search"] = {
				dotnet_search_reference_assemblies = true,
			},
			["mystery_language|Highlighting"] = {
				dotnet_highlight_related_json_components = true,
			},
			["mystery_language|background_analysis"] = {
				dotnet_analyzer_diagnostics_scope = true,
				dotnet_compiler_diagnostics_scope = true,
			},
			["mystery_language|code_lens"] = {
				dotnet_enable_references_code_lens = true,
				dotnet_enable_tests_code_lens = true,
			},
			["mystery_language|completion"] = {
				dotnet_provide_regex_completions = true,
				dotnet_show_completion_items_from_unimported_namespaces = true,
				dotnet_show_name_completion_suggestions = true,
			},
			["mystery_language|highlighting"] = {
				dotnet_highlight_related_regex_components = true,
			},
			["mystery_language|implement_type"] = {
				dotnet_insertion_behavior = true,
				dotnet_property_generation_behavior = true,
			},
		},
	},
	exe = { "dotnet", roslynExecutable },
	filewatching = true,
})

local cd_project_status, cd_project = pcall(require, "cd-project")
if not cd_project_status then
	return
end

cd_project.setup({

	-- this json file is acting like a database to update and read the projects in real time.
	-- So because it's just a json file, you can edit directly to add more paths you want manually
	projects_config_filepath = vim.fs.normalize(vim.fn.stdpath("config") .. "/cd-project.nvim.json"),
	-- this controls the behaviour of `CdProjectAdd` command about how to get the project directory
	project_dir_pattern = { ".git", ".gitignore", "Cargo.toml", "package.json", "go.mod" },
	choice_format = "both", -- optional, you can switch to "name" or "path"
	projects_picker = "vim-ui", -- optional, you can switch to `telescope`
	auto_register_project = false, -- optional, toggle on/off the auto add project behaviour
	-- do whatever you like by hooks
	hooks = {
		-- Run before cd to project, add a bookmark here, then can use `CdProjectBack` to switch back
		-- {
		--   trigger_point = "BEFORE_CD",
		--   callback = function(_)
		--     vim.print("before cd project")
		--     require("bookmarks").api.mark({name = "before cd project"})
		--   end,
		-- },
		-- Run after cd to project, find and open a file in the target project by smart-open
		-- {
		--   callback = function(_)
		--     require("telescope").extensions.smart_open.smart_open({
		--       cwd_only = true,
		--       filename_first = false,
		--     })
		--   end,
		-- },
	},
})
-- config
local options = {
	backup = false,
	swapfile = false,
	undofile = true,
	fileencoding = "utf-8",
	clipboard = "unnamedplus",             -- allows access to system keyboard
	showmode = true,
	hlsearch = true,
	ignorecase = true,
	pumheight = 10,
	showtabline = true,
	expandtab = true,
	shiftwidth = 2,
	tabstop = 2,
	cursorline = true,
	number = true,
	relativenumber = true,
	numberwidth = 4,
	signcolumn = "yes",
	wrap = true,
	linebreak = true,
	scrolloff = 8,
	sidescrolloff = 8,
	showtabline = 2
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

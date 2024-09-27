-- config
local options = {
  -- NeoVim will backup the file currently editing, but the backup
  -- file won't be left in the filesystem once the writing of the 
  -- file finished
	backup = false,
  writebackup = true,

  -- how NeoVim manages making backup copies fromt the edited files
  backupcopy = "auto",

  -- when the bell is disabled
  belloff = "all",
  errorbell = off,

  -- if NeoVim will use swap file or not
  -- directory option defines where these files will be put
  -- directory is at default state
	swapfile = false,

	undofile = true,
	fileencoding = "utf-8",
	clipboard = "unnamedplus",             -- allows access to system keyboard
	showmode = true,
	hlsearch = true,
	ignorecase = true,
	pumheight = 10,
	showtabline = true,

  -- highlighting the line where the cursor in and how
	cursorline = true,
  cursorlineopt = "line",

  ----------------------------
	-- global editing options --
  ----------------------------

  -- use spaces when hit TAB
	expandtab = true,
  -- how many spaces are inserted when hit TAB
	tabstop = 2,

	shiftwidth = 2,
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

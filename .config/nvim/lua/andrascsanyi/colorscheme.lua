local colorscheme = "onedark"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify(colorscheme .. " is not available. Go with default colorscheme")
	return
end

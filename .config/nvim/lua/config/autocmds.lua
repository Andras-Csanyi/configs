-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "latex", "tex" },
  callback = function()
    vim.bo.textwidth = 80
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = "cs",
  callback = function()
    vim.bo.textwidth = 120
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = "java",
  callback = function()
    vim.bo.textwidth = 120
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = "markdown",
  callback = function()
    vim.bo.textwidth = 80
  end,
})

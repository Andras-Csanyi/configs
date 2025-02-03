-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt

-- how many lines should remain visible before the cursor
opt.scrolloff = 10
-- how many colums should remain visible right of the cursor
opt.sidescrolloff = 10

-- rust
vim.g.lazyvim_rust_diagnostics = "rust-analyzer"

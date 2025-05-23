-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set({ "n", "v" }, "<leader>j", "50j", { noremap = true, desc = "Jump 50 lines back." })
vim.keymap.set({ "n", "v" }, "<leader>k", "50k", { noremap = true, desc = "Jump 50 lines ahead." })

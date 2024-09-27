-- keymaps
local opts = { noremap = false, silent = true }
local term_opts = { silent = true }
local keymap = vim.keymap.set

-- leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

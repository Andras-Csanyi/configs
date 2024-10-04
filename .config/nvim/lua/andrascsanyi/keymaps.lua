-- keymaps
local opts = { noremap = false, silent = true }
local term_opts = { silent = true }
local keymap = vim.keymap.set

-- leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--  normal mode = "n"
--  insert mode = "i"
--  visual mode = "v"
--  visual block mode = "x"
--  term mode = "t"
--  command mode = "c"

------------
-- Normal --
------------
-- Save buffer 
keymap("n", "<Space>sa", ":w<CR>", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

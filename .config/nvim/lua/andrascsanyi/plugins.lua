local fn = vim.fn

-- Automatically installs Packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing Packer. Close and reopen NeoVim.")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand to reload NeoVim when save plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Protected call to load pluging
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Packer configuration
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

-- installing packages
return packer.startup(function(use)

  -- must haves
  use { "wbthomason/packer.nvim" }
  use { "nvim-lua/plenary.nvim" }

  -- colorschemes
  use { "folke/tokyonight.nvim", lazy = false, priority = 1000, opts = {} }
  use { "navarasu/onedark.nvim" }

  --  cmp
  use { "hrsh7th/nvim-cmp" } 
  use { "hrsh7th/cmp-buffer" } 
  use { "hrsh7th/cmp-path" } 
  use { "hrsh7th/cmp-cmdline" } 
  use { "saadparwaiz1/cmp_luasnip" } 

  -- snippets
  use { "L3MON4D3/LuaSnip" }
  use { "rafamadriz/friendly-snippets" }

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

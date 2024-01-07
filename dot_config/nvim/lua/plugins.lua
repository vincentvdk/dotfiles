-- Neovim Plugins using Packer
--
-- ## usefull info
-- Print 'packpath' -> run :lua print(vim.o.packpath)

-- Set Packer path
--local packer_path = vim.fn.stdpath('config') .. '/site'
--vim.o.packpath = vim.o.packpath .. ',' .. packer_path

-- Plugin install
return require('packer').startup(function(use)
  use "wbthomason/packer.nvim"
  -- Plugins here

  -- Theme
  use "EdenEast/nightfox.nvim"
  use { "catppuccin/nvim", as = "catppuccin" }

  -- Status line
  use {
    "nvim-lualine/lualine.nvim",
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  -- Syntax
  use({"nvim-treesitter/nvim-treesitter"})  -- enable treesitter

  -- LSP
  use ({"neovim/nvim-lspconfig"})     -- enable LSP
  use ({"hrsh7th/nvim-cmp"})          -- Autocompletion plugin
  use ({"hrsh7th/cmp-nvim-lsp"})      -- LSP source for nvim-cmp
  use ({"hrsh7th/cmp-buffer"})        -- Buffer source for nvim-cmp
  use ({"L3MON4D3/LuaSnip"})          -- nvim-cmp needs a snippet engine
  use ({"saadparwaiz1/cmp_luasnip"})  -- nvim-cmp needs a snippet engine (dep)

  -- Telescope
  use {
    "nvim-telescope/telescope.nvim", tag = '0.1.x',
    requires = { {"nvim-lua/plenary.nvim"} }
  }
  -- Terraform
  use({"hashivim/vim-terraform"})

end)

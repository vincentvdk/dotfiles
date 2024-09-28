return {
  --"folke/neodev.nvim",
  --"folke/which-key.nvim",
  --{ "folke/neoconf.nvim", cmd = "Neoconf" },

  -- Theme
  "EdenEast/nightfox.nvim",
  "catppuccin/nvim", as = "catppuccin",

  -- Status line
  "nvim-lualine/lualine.nvim", requires = { 'nvim-tree/nvim-web-devicons', opt = true },

  -- Syntax
  "nvim-treesitter/nvim-treesitter", run = ':TSUpdate',

  -- LSP
  "neovim/nvim-lspconfig",     -- enable LSP
  "hrsh7th/nvim-cmp",          -- Autocompletion plugin
  "hrsh7th/cmp-nvim-lsp",      -- LSP source for nvim-cmp
  "hrsh7th/cmp-buffer",        -- Buffer source for nvim-cmp
  "L3MON4D3/LuaSnip",          -- nvim-cmp needs a snippet engine
  "saadparwaiz1/cmp_luasnip",  -- nvim-cmp needs a snippet engine (dep)

  -- Telescope
  "nvim-telescope/telescope.nvim", tag = '0.1.x', requires = { {"nvim-lua/plenary.nvim"} },

  -- Terraform
  "hashivim/vim-terraform",
}

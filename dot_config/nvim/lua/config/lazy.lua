-- Install lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
      { out, 'WarningMsg' },
      { '\nPress any key to exit...' },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
-- Instead of passing on large table we create separate files in the 'plugins' folder
-- which are then imported here
require('lazy').setup({
  spec = {
    -- import your plugins
    { import = 'plugins' },
  },

  -- Configure lazy.nvim options.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { 'habamax' } },

  -- automatically check for plugin updates
  checker = { enabled = true },
}, {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '[cmd]',
      config = '[cfg]',
      event = '[event]',
      ft = '[ft]',
      init = '[init]',
      keys = '[keys]',
      plugin = '[plugin]',
      runtime = '[rt]',
      require = '[req]',
      source = '[src]',
      start = '[start]',
      task = '[task]',
      lazy = '[lazy]',
    },
  },
})

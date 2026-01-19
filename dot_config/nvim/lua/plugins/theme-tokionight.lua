return {
  'folke/tokyonight.nvim',
  lazy = false,
  priority = 1000,
  init = function()
    -- options:  'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
    vim.cmd.colorscheme('tokyonight-night')

    -- You can configure highlights by doing something like:
    vim.cmd.hi('Comment gui=none')
  end,

  opts = {
    --transparent = true,
    --styles = {
    --  sidebars = 'transparent',
    --  floats = 'transparent',
    --},
  },
}

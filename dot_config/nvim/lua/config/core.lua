-- OPTIONS (https://neovim.io/doc/user/options.html#options)
-- Leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- misc
vim.opt.number = true
vim.opt.relativenumber = true
vim.o.modelines = 1
vim.o.cmdheight = 2
vim.o.swapfile = false
vim.o.cursorline = true   -- highlight current line
vim.o.wrap = false        -- wrap long lines
vim.o.scrolloff = 10      -- keep cursor x lines from bottom when scrolling
vim.o.showmatch = false   -- [{}] matching already part of color theme?
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = 'split'

-- Tab behavious
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

-- Show tab/spaces/trailing chars
vim.opt.list = true
vim.opt.listchars = { tab = ' > ', trail = '.', nbsp = '␣' }

-- indentation
vim.o.autoindent = true
vim.o.smartindent = true
vim.opt.breakindent = true  -- visually indent wrapped lines

-- splitting
vim.opt.splitright = true
vim.opt.splitbelow = true

-- swap
vim.o.swapfile = false

-- clipboard
vim.opt.clipboard = 'unnamedplus'

-- visual aid
vim.opt.signcolumn = 'yes'

-- Mark unnecessay whitespace
vim.api.nvim_set_hl(0, 'Whitespace', { bg='Red' })
vim.cmd[[ match Whitespace /\s\+\%#\@<!$/ ]]

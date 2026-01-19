-- Basic keymaps
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus left' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus right' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus down' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus up' })

-- Custom
vim.keymap.set('n', ';', ':', {desc = 'use : without SHIFT'})
vim.keymap.set('n', ':', ';', {desc = 'use : without SHIFT'})
vim.keymap.set('n', '<silent>', '<Space>', {desc = 'new line in insert mode | Shift-Enter -> o'})
vim.keymap.set('n', '<C-p>', ':Telescope find_files<cr>', {desc = 'Telescope - CTRL-p to open files'})
vim.keymap.set('n', '<C-b>', ':Telescope buffers<cr>', {desc = 'Telescope - CTRL-b to open buffers'})

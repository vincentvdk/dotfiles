-- LSP Configuration (native Neovim 0.11+ API)
vim.lsp.enable('gopls')

-- LSP keymaps on attach
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)

    -- Enable native completion                                                                                                  
    if client:supports_method('textDocument/completion') then
      vim.opt.completeopt = {'menu', 'menuone', 'noinsert', 'fuzzy', 'popup'}
      vim.lsp.completion.enable(true, client.id, event.buf, { autotrigger = true })
    end
 
    -- Key bindings
    local map = function(mode, keys, func, desc)
      vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
    end
    map('n', 'gd', vim.lsp.buf.definition, 'Go to definition')
    map('n', 'gr', vim.lsp.buf.references, 'Go to references')
    map('n', 'gI', vim.lsp.buf.implementation, 'Go to implementation')
    map('n', 'K', vim.lsp.buf.hover, 'Hover documentation')
    map('n', '<leader>rn', vim.lsp.buf.rename, 'Rename')
    map('n', '<leader>ca', vim.lsp.buf.code_action, 'Code action')
    map("n", "<leader>e", vim.diagnostic.open_float, "Line diagnostics")
    map('i', '<C-Space>', function()
        vim.lsp.completion.get()
      end, 'Reactivate autocomplete')
  end,
})

vim.diagnostic.config({
  virtual_lines = true
  
  --virtual_lines = {
  --  current_line = true,
  --},
})


-- Completion keymaps (insert mode)
vim.keymap.set('i', '<C-n>', function()
  if vim.fn.pumvisible() == 1 then
    return '<C-n>'
  else
    vim.lsp.completion.get()
    return ''
  end
end, { expr = true, desc = 'Next completion or trigger' })

vim.keymap.set('i', '<CR>', function()
  return vim.fn.pumvisible() == 1 and '<C-y>' or '<CR>'
end, { expr = true, desc = 'Accept completion or newline' })

-- Snippet navigation
vim.keymap.set({ 'i', 's' }, '<Tab>', function()
  if vim.snippet.active({ direction = 1 }) then
    vim.snippet.jump(1)
    return ''
  end
  return '<Tab>'
end, { expr = true, desc = 'Next snippet placeholder' })

vim.keymap.set({ 'i', 's' }, '<S-Tab>', function()
  if vim.snippet.active({ direction = -1 }) then
    vim.snippet.jump(-1)
    return ''
  end
  return '<S-Tab>'
end, { expr = true, desc = 'Prev snippet placeholder' })

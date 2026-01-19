-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Golang format on save
vim.api.nvim_create_autocmd({"BufWritePre"}, {
  pattern = {"*.go"},
  callback = function()
    vim.lsp.buf.format()
  end,
})

-- Terraform format on save
vim.api.nvim_create_autocmd({"BufWritePre"}, {
  pattern = {"*.tf", "*.tfvars"},
  callback = function()
    vim.lsp.buf.format()
  end,
})

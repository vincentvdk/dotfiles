return {
  cmd = { 'gopls' },
  filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
  root_markers = { 'go.mod', 'go.work', '.git' },
  -- settings https://github.com/golang/tools/blob/master/gopls/doc/settings.md
  settings = {
    analyses = {
      unusedparams = true,
    },
    staticcheck = true,         -- Enable additional linting
    gofumpt = true,
    usePlaceholders = true,     -- Add parentheses and placeholders for function params
    completeUnimported = true,  -- Auto-import packages on completion
  }, 
}

-- debug packer
-- local file = io.open("rtp.log", "w")
-- file:write(table.concat(vim.opt.runtimepath:get(), "\n"))
-- file:close()

-- "Lua config
require("config.lazy") -- lazy.vim https://github.com/folke/lazy.nvim
require("lazy").setup("plugins") -- Plugins managed with lazy.vim https://github.com/folke/lazy.nvim
--require("plugins")
require("base")

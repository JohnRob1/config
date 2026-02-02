vim.g.have_nerd_font = true

vim.o.relativenumber = true
vim.o.expandtab = true
vim.o.swapfile = false

vim.keymap.set('n', '<M-j>', '<cmd>cnext<CR>')
vim.keymap.set('n', '<M-k>', '<cmd>cprev<CR>')

-- guess-indent is not loaded in main init.lua
require('guess-indent').setup {}

return {}

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local k = vim.keymap

k.set('n', '<leader>e', ':Ex<CR>', { noremap = true, silent = true })

k.set('n', '<c-k>', ':wincmd k<CR>')
k.set('n', '<c-j>', ':wincmd j<CR>')
k.set('n', '<c-h>', ':wincmd h<CR>')
k.set('n', '<c-l>', ':wincmd l<CR>')

k.set('n', '<leader>h', ':nohlsearch<CR>')


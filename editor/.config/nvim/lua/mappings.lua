local keymap = vim.keymap

local telescope = require('telescope.builtin')

local opts = {noremap = true, silent = true}
local function map(mode, key, command)
    vim.api.nvim_set_keymap(mode, key, command, opts)
end

vim.cmd [[imap <C-c> <Esc>]]
vim.g.netrw_banner = false

map("v", "<", "<gv")
map("v", ">", ">gv")

map("n", "<leader>e", "<cmd>Ex<cr>")

map('n', '<leader>f', ":Telescope find_files<cr>")
map('n', '<leader>g', ":Telescope live_grep<cr>")
map('n', '<leader>b', ':Telescope buffers<cr>')

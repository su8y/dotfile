local map = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap('n', 'j', 'gj', opts)
vim.api.nvim_set_keymap('n', 'k', 'gk', opts)
vim.api.nvim_set_keymap('n', '<c-u>', '20gk', opts)
vim.api.nvim_set_keymap('n', '<c-d>', '20gj', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

map("n", "<", "<<", opts)
map("n", ">", ">>", opts)
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })
map('n', '<leader>qo', ':tabo<CR>', { remap = true })
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })

map("n", "H", "gt", opts)
map("n", "L", "gT", opts)

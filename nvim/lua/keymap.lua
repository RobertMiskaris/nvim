local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }


-- Telescope
map('n', '<F3>', ':Telescope current_buffer_fuzzy_find<CR>', opts)
map('n', '<F4>', ':Telescope find_files<CR>', opts)

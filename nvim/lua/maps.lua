
local keymap = vim.keymap


-- Delete without clipboard
keymap.set('n', 'dw', 'vb"_d')
keymap.set('n', 'D', '"_D')
keymap.set('n', 'dd', '"_dd')

-- Cut and write without clipboard
keymap.set('n', 'C', '"_C')
keymap.set('n', 'cc', '"_cc')
keymap.set('n', 'ce', '"_ce')
keymap.set('n', 'cb', '"_cb')


-- New tab
keymap.set('n', 'te', ':tabedit')
-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w')
keymap.set('n', 'sv', ':vsplit<Return><C-w>w')
-- Move window
keymap.set('n', '<Space>', '<C-w>w')
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')

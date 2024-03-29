local status, saga = pcall(require, "lspsaga")
if not status then
	return
end

saga.init_lsp_saga({
	server_filetype_map = {
		typescript = "typescript",
		python = "python",
	},
})

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<C-j>", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opts)
vim.keymap.set("n", "K", "<Cmd>Lspsaga hover_doc<CR>", opts)
vim.keymap.set("n", "gD", "<Cmd>Lspsaga lsp_finder<CR>", opts)
vim.keymap.set("i", "<C-k>", "<Cmd>Lspsaga signature_help<CR>", opts)
vim.keymap.set("n", "gp", "<Cmd>Lspsaga preview_definition<CR>", opts)
vim.keymap.set("n", "gr", "<Cmd>Lspsaga rename<CR>", opts)
vim.keymap.set("n", "cd", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)

--vim.cmd([[autocmd CursorHold * lua lspsaga.show_line_diagnostics()]])
-- Terminal
--vim.keymap.set("n", "<F3>", "<cmd>Lspsaga open_floaterm<CR>", opts)
--vim.keymap.set("t", "<F3>", [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], opts)

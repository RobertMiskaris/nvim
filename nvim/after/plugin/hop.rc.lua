local status, hop = pcall(require, "hop")
if not status then
	return
end

hop.setup({
	vim.api.nvim_set_keymap("n", "f", "<cmd> lua require'hop'.hint_words()<cr>", {}),
})

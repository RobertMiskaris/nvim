local status, lazygit = pcall(require, "lazygit")
if not status then
	return
end

vim.keymap.set("n", "<F1>", "<cmd>LazyGit<CR>")

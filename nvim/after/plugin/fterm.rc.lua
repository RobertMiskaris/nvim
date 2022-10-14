local status, fterm = pcall(require, "FTerm")
if not status then
	return
end

fterm.setup({
	border = "double",
	dimensions = {
		height = 0.9,
		width = 0.9,
	},
})

vim.keymap.set("n", "<F3>", '<CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set("t", "<F3>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')

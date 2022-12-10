vim.g.catppuccin_flavour = "macchiato"
require("catppuccin").setup({
	transparent_background = false,
	term_colors = true,
	compile = {
		enabled = true,
		path = vim.fn.stdpath("cache") .. "/catppuccin",
	},
	integrations = {
		treesitter = true,
		native_lsp = {
			enabled = true,
		},
		cmp = true,
		hop = true,
		-- lsp_saga = true,
		telescope = true,
		harpoon = true,
		noice = true,
		-- neotree = true,
	},
})
vim.cmd([[colorscheme catppuccin]])
-- vim.cmd [[color catppuccin]]

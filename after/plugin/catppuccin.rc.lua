vim.g.catppuccin_flavour = "mocha"
require("catppuccin").setup({
	transparent_background = false,
	term_colors = false,
	compile = {
		enabled = true,
		path = vim.fn.stdpath("cache") .. "/catppuccin",
	},
	styles = {
		comments = { "italic" },
		properties = {},
		functions = { "bold" },
		keywords = {},
		operators = { "bold" },
		conditionals = { "bold" },
		loops = { "bold" },
		booleans = { "bold" },
		numbers = {},
		types = {},
		strings = {},
		variables = {},
	},
	integrations = {
		treesitter = true,
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" },
			},
			underlines = {
				errors = { "underline" },
				hints = { "underline" },
				warnings = { "underline" },
				information = { "underline" },
			},
		},
		cmp = true,
		hop = true,
		-- lsp_saga = true,
		telescope = true,
		harpoon = true,
		noice = true,
		neotree = { enabled = false, show_root = true, transparent_panel = false },
	},
})
-- vim.cmd([[colorscheme catppuccin]])
vim.cmd.colorscheme("catppuccin")
-- vim.cmd [[color catppuccin]]

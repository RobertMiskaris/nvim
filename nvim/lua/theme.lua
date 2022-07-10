local catppuccin = require("catppuccin")
catppuccin.setup({
transparent_background = false,
term_colors = false,
integrations = {
	treesitter = true,
	native_lsp = {
		enabled = true,
	},
	-- lsp_trouble = true,
	cmp = true,
	-- gitgutter = false,
	-- gitsigns = true,
	-- telescope = true,
	nvimtree = {
		enabled = true,
		show_root = false,
		transparent_panel = false,
	},
	-- neotree = {
	-- 	enabled = false,
	-- 	show_root = false,
	-- 	transparent_panel = false,
	-- },
	-- which_key = false,
	-- indent_blankline = {
	-- 	enabled = true,
	-- 	colored_indent_levels = false,
	-- },
	-- dashboard = true,
	-- neogit = false,
	-- vim_sneak = false,
	-- fern = false,
	barbar = true,
	-- bufferline = true,
	-- markdown = true,
	-- lightspeed = false,
	-- ts_rainbow = false,
	hop = true,
	-- notify = true,
	-- telekasten = true,
	-- symbols_outline = true,
}})



vim.cmd 'colorscheme catppuccin'


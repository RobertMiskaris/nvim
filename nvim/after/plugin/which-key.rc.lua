local status, wk = pcall(require, "which-key")
if not status then
	return
end

wk.register({
	["<F6>"] = { "<cmd>NeoTreeFloat<cr>", "Tree" },
	["ss"] = { "<cmd>split<Return><C-w>w", "Split" },
	["sv"] = { "<cmd>vsplit<Return><C-w>w", "SplitVertical" },
	["<Leader>ds"] = { "<cmd>Neogen<cr>", "Neogen" },
	[";;"] = { "<cmd>Telescope harpoon marks theme=dropdown<cr>", "HarpoonFinder" },
	["<Leader>af"] = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "HarpoonAddFile" },
	["<Leader>nb"] = { "<cmd>lua require('harpoon.ui').nav_next()<cr>", "HarpoonMoveNext" },
	["<Leader>pb"] = { "<cmd>lua require('harpoon.ui').nav_prev()<cr>", "HarpoonMovePrev" },
	["<F7>"] = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "HarpoonUI" },
})

wk.setup({
	plugins = {
		marks = false, -- shows a list of your marks on ' and `
		registers = false, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		spelling = {
			enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		presets = {
			operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
			motions = true, -- adds help for motions
			text_objects = true, -- help for text objects triggered after entering an operator
			windows = true, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = true, -- bindings for prefixed with g
		},
	},
	disable = {
		buftypes = {},
		filetypes = { "TelescopePrompt" },
	},
})

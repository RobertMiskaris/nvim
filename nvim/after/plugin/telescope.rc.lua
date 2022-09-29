local status, telescope = pcall(require, "telescope")
if not status then
	return
end
local builtin = require("telescope.builtin")
local actions = require("telescope.actions")

telescope.setup({
	defaults = {
		file_ignore_patterns = {
			"node_modules/.*",
			"venv/.*",
			"__pycache__/.*",
			".git/.*",
			"client/.*",
			"data/.*",
			"dist/.*",
		},
		mappings = {
			i = {
				["<esc>"] = actions.close,
			},
		},
	},
	pickers = {
		find_files = {
			theme = "dropdown",
		},
		live_grep = {
			theme = "dropdown",
		},
		buffers = {
			theme = "dropdown",
		},
		current_buffer_fuzzy_find = {
			theme = "dropdown",
		},
		diagnostics = {
			theme = "dropdown",
		},
	},
	extensions = {},
})

vim.keymap.set("n", ";f", function()
	builtin.find_files({
		no_ignore = false,
		hidden = true,
	})
end)

vim.keymap.set("n", ";r", function()
	builtin.live_grep()
end)

vim.keymap.set("n", "\\\\", function()
	builtin.buffers()
end)

vim.keymap.set("n", ";t", function()
	builtin.help_tags()
end)

vim.keymap.set("n", "/", function()
	builtin.current_buffer_fuzzy_find()
end)

vim.keymap.set("n", ";;", function()
	builtin.resume()
end)

vim.keymap.set("n", ";e", function()
	builtin.diagnostics()
end)

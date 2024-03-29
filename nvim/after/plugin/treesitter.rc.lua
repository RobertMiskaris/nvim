local status, ts = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

ts.setup({
	highlight = {
		enable = true,
		use_languagetree = true,
		disable = {},
	},
	indent = {
		enable = true,
		disable = { "python", "yaml" },
	},
	ensure_installed = {
		"tsx",
		"toml",
		"json",
		"yaml",
		"css",
		"html",
		"lua",
		"python",
		"go",
		"dockerfile",
		"javascript",
		"markdown",
		"lua",
	},
	autotag = {
		enable = true,
	},
})

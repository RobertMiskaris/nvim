local status, neogen = pcall(require, "neogen")
if not status then
	return
end

neogen.setup({
	snippet_engine = "luasnip",
	enabled = true,
	languages = {
		python = {
			template = {
				annotation_convention = "google_docstrings", -- for a full list of annotation_conventions, see supported-languages below,
			},
		},
	},
})

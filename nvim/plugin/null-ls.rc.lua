local status, null_ls = pcall(require, "null-ls")
if not status then
	return
end

local sources = {
	null_ls.builtins.diagnostics.flake8.with({
		prefer_local = "venv/bin",
		filetypes = { "python" },
		args = { "--format", "default", "--stdin-display-name", "$FILENAME", "-" },
		diagnostics_format = "[flake8] #{m}\n(#{c})",
	}),
	null_ls.builtins.diagnostics.mypy.with({
		prefer_local = "venv/bin",
		filetypes = { "python" },
		diagnostics_format = "[mypy] #{m}\n(#{c})",
	}),
	null_ls.builtins.diagnostics.zsh,
}

null_ls.setup({
	sources = sources,
})

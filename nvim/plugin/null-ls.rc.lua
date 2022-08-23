local status, null_ls = pcall(require, "null-ls")
if (not status) then return end

local sources = {
    null_ls.builtins.formatting.autopep8.with({
       prefer_local = ".venv/.bin",
    }),
    null_ls.builtins.diagnostics.flake8.with({
       prefer_local = "venv/bin",
	   filetypes = { "python" },
	   args = { "--format", "default", "--stdin-display-name", "$FILENAME", "-" },
	   diagnostics_format = '[flake8] #{m}\n(#{c})'
    }),
    null_ls.builtins.diagnostics.mypy.with({
       prefer_local = "venv/bin",
	   filetypes = { "python" },
	   diagnostics_format = '[mypy] #{m}\n(#{c})'
    }),
	null_ls.builtins.diagnostics.zsh,
	on_attach = function(client, bufnr)
	if client.server_capabilities.documentFormattingProvider then
	  vim.api.nvim_clear_autocmds { buffer = 0, group = augroup_format }
	  vim.api.nvim_create_autocmd("BufWritePre", {
		group = augroup_format,
		buffer = 0,
		callback = function() vim.lsp.buf.formatting_seq_sync() end
	  })
	end
	end
}

null_ls.setup({
   sources = sources,
})

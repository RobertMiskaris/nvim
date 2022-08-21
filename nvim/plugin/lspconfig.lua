vim.lsp.set_log_level("debug")

local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then return end


util = require "lspconfig/util"


-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap = true, silent = true }

  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
end


local capabilities = require('cmp_nvim_lsp').update_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)



-- Diagnostic

vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

vim.o.updatetime = 0

vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]


-- The main servers

nvim_lsp.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "python" },
  cmd = { "pyright-langserver", "--stdio" },
  settings = {
	  python = {
	    analysis = {
	      autoSearchPaths = true,
	      diagnosticMode = "workspace",
	      useLibraryCodeForTypes = true,
	      typeCheckingMode = "basic",
		  strictParameterNoneValue = false
	    }
	  }
	}
}

nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" },
  capabilities = capabilities
}



nvim_lsp.gopls.setup {
cmd = {"gopls", "serve"},
filetypes = {"go", "gomod"},
root_dir = util.root_pattern("go.work", "go.mod", ".git"),
settings = {
	  gopls = {
		analyses = {
		  unusedparams = true,
		},
		staticcheck = true,
	  },
	},
}

local status, cmp = pcall(require, "cmp")
if not status then
	return
end
if not cmp then
	return
end

local lspkind = require("lspkind")


cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<F11>"] = cmp.mapping.complete(),
		["<F10>"] = cmp.mapping.complete(),
		["<C-c>"] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		-- ["<C-m>"] = cmp.mapping.complete(),
		["<F12>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		["<C-s>"] = cmp.mapping.complete({
			config = {
				sources = {
					{ name = "buffer", max_item_count = 5 },
				},
			},
		}),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp", max_item_count = 5 },
		{ name = "luasnip", max_item_count = 5 },
	}),
	formatting = {
		format = lspkind.cmp_format({ with_text = false, maxwidth = 50 }),
	},
	completion = {
		autocomplete = false,
	},
})

vim.cmd([[
  set completeopt=menuone,noinsert,noselect
  highlight! default link CmpItemKind CmpItemMenuDefault
]])

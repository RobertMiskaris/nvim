-----------------------
---- Color
-----------------------
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


-----------------------
---- Comment
-----------------------

require('Comment').setup()
-- `gcc` - Toggles the current line using linewise comment
-- `gbc` - Toggles the current line using blockwise comment


-----------------------
---- CursorLine
-----------------------
require('nvim-cursorline').setup {
  cursorline = {
    enable = true,
    timeout = 1000,
    number = false,
  },
  cursorword = {
    enable = true,
    min_length = 3,
    hl = { underline = true },
  }
}


-----------------------
---- Buffer
-----------------------

-- Lualine
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}


-- NerdTree
require'nvim-tree'.setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = false,
  ignore_ft_on_setup  = {},
  -- auto_close          = false,
  open_on_tab         = false,
  hijack_cursor       = false,
  update_cwd          = false,
  -- update_to_buf_dir   = {
  --  enable = true,
  --  auto_open = true,
  -- },
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  update_focused_file = {
    enable      = false,
    update_cwd  = false,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  filters = {
    dotfiles = false,
    custom = {}
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  view = {
    width = 30,
    height = 30,
    hide_root_folder = false,
    side = 'left',
    -- auto_resize = false,
    mappings = {
      custom_only = false,
      list = {}
    },
    number = false,
    relativenumber = false,
    signcolumn = "yes"
  },
  trash = {
    cmd = "trash",
    require_confirm = true
  }
}

-----------------------
---- General
-----------------------

vim.opt.number = true
vim.opt.termguicolors = true
vim.opt.mouse = "a"
vim.opt.encoding = "utf-8"
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.smarttab = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 5

-----------------------
---- LSP
-----------------------


local lsp_installer = require("nvim-lsp-installer")

local on_attach = function(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	local opts = { noremap = true, silent = true }

	buf_set_keymap("n", "gd", ":lua vim.lsp.buf.definition()<CR>", opts) --> jumps to the definition of the symbol under the cursor
	buf_set_keymap("n", "<leader>lh", ":lua vim.lsp.buf.hover()<CR>", opts) --> information about the symbol under the cursos in a floating window
	buf_set_keymap("n", "gi", ":lua vim.lsp.buf.implementation()<CR>", opts) --> lists all the implementations for the symbol under the cursor in the quickfix window
	buf_set_keymap("n", "<leader>rn", ":lua vim.lsp.util.rename()<CR>", opts) --> renaname old_fname to new_fname
	buf_set_keymap("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>", opts) --> selects a code action available at the current cursor position
	buf_set_keymap("n", "gr", ":lua vim.lsp.buf.references()<CR>", opts) --> lists all the references to the symbl under the cursor in the quickfix window
	buf_set_keymap("n", "<leader>ld", ":lua vim.diagnostic.open_float()<CR>", opts)
	buf_set_keymap("n", "[d", ":lua vim.diagnostic.goto_prev()<CR>", opts)
	buf_set_keymap("n", "]d", ":lua vim.diagnostic.goto_next()<CR>", opts)
	buf_set_keymap("n", "<leader>lq", ":lua vim.diagnostic.setloclist()<CR>", opts)
	buf_set_keymap("n", "<leader>lf", ":lua vim.lsp.buf.formatting()<CR>", opts) --> formats the current buffer
end

local servers = {
	"pyright",
	"tsserver"
}

lsp_installer.on_server_ready(function(server)
	-- Specify the default options which we'll use to setup all servers
	local default_opts = {
		on_attach = on_attach,
		capabilities = capabilities,
	}

	server:setup(default_opts)
end)



-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
-- vim.o.completeopt = 'menuone,noselect'
local luasnip = require 'luasnip'
local cmp = require 'cmp'
local lspkind = require 'lspkind'


cmp.setup({
	formatting = {
		format = lspkind.cmp_format({
			mode = 'symbol_text',
			with_text = true, -- do not show text alongside icons
			maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)

			-- The function below will be called before any actual modifications from lspkind
			-- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
			before = function(entry, vim_item)
				return vim_item
			end,
		}),
	},
	completion = {
		autocomplete = false,
	},
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = {
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		["<Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end,
		["<S-Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end,
	},
	sources = {
		-- { name = "buffer", max_item_count = 10 },
		{ name = "nvim_lsp", max_item_count = 10 },
		{ name = "luasnip", max_item_count = 10 }
	},
})

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { 
	  "python",
	  "javascript",
	  "go",
	  "typescript",
	  "dockerfile",
	  "yaml",
	  "json",
	  "dot",
	  "lua",
	  "bash"},

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing (for "all")
  -- ignore_install = { "javascript" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    -- disable = { "c", "rust" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  -- indent = {
  --   enable = true
  -- }
}


require'hop'.setup({
	vim.api.nvim_set_keymap('n', '<leader>f', "<cmd> lua require'hop'.hint_words()<cr>", {})
}
)

-- Lsp Diagnostic

vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

-- Show line diagnostics automatically in hover window
vim.o.updatetime = 250
-- vim.api.nvim_create_autocmd("CursorHold", {
--   buffer = bufnr,
--   callback = function()
--     local opts = {
--       focusable = false,
--       close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
--       border = 'rounded',
--       source = 'always',
--       prefix = ' ',
--       scope = 'cursor',
--     }
--     vim.diagnostic.open_float(nil, opts)
--   end
-- })
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
-- vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})]]



--
-- require'lsp_signature'.setup(
-- {
--   -- debug = false, -- set to true to enable debug logging
--   -- log_path = vim.fn.stdpath("cache") .. "/lsp_signature.log", -- log dir when debug is on
--   -- default is  ~/.cache/nvim/lsp_signature.log
--   -- verbose = false, -- show debug line number
--
--   bind = true, -- This is mandatory, otherwise border config won't get registered.
--                -- If you want to hook lspsaga or other signature handler, pls set to false
--   doc_lines = 10, -- will show two lines of comment/doc(if there are more than two lines in doc, will be truncated);
--                  -- set to 0 if you DO NOT want any API comments be shown
--                  -- This setting only take effect in insert mode, it does not affect signature help in normal
--                  -- mode, 10 by default
--
--   -- floating_window = true, -- show hint in a floating window, set to false for virtual text only mode
--
--   floating_window_above_cur_line = true, -- try to place the floating above the current line when possible Note:
--   -- will set to true when fully tested, set to false will use whichever side has more space
--   -- this setting will be helpful if you do not want the PUM and floating win overlap
--
--   floating_window_off_x = 1, -- adjust float windows x position.
--   floating_window_off_y = 1, -- adjust float windows y position.
--
--
--   -- fix_pos = false,  -- set to true, the floating window will not auto-close until finish all parameters
--   hint_enable = true, -- virtual hint enable
--   -- hint_prefix = "🐼 ",  -- Panda for parameter
--   -- hint_scheme = "String",
--   -- hi_parameter = "LspSignatureActiveParameter", -- how your parameter will be highlight
--   max_height = 12, -- max height of signature floating_window, if content is more than max_height, you can scroll down
--                    -- to view the hiding contents
--   max_width = 80, -- max_width of signature floating_window, line will be wrapped if exceed max_width
--   handler_opts = {
--     border = "rounded"   -- double, rounded, single, shadow, none
--   },
--
--   always_trigger = true, -- sometime show signature on new line or in middle of parameter can be confusing, set it to false for #58
--
--   auto_close_after = nil, -- autoclose signature float win after x sec, disabled if nil.
--   extra_trigger_chars = {}, -- Array of extra characters that will trigger signature completion, e.g., {"(", ","}
--   zindex = 200, -- by default it will be on top of all floating windows, set to <= 50 send it to bottom
--
--   padding = '', -- character to pad on left and right of signature can be ' ', or '|'  etc
--
--   transparency = nil, -- disabled by default, allow floating win transparent value 1~100
--   shadow_blend = 36, -- if you using shadow as border use this set the opacity
--   shadow_guibg = 'Black', -- if you using shadow as border use this set the color e.g. 'Green' or '#121315'
--   timer_interval = 200, -- default timer check interval set to lower value if you want to reduce latency
--   toggle_key = nil -- toggle signature on and off in insert mode,  e.g. toggle_key = '<M-x>'
-- }
-- )



------
-- Telescope
------

require'telescope'.setup( {
  defaults = {
	  file_ignore_patterns = {
		  'node_modules/.*',
		  'venv/.*',
		  '__pycache__/.*',
		  '.git/.*'
	  },

  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  },

})


require('nvim-autopairs').setup{}
require('nvim-ts-autotag').setup()



require('neoscroll').setup({
    -- All these keys will be mapped to their corresponding default scrolling animation
    mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>',
                '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
    hide_cursor = false,          -- Hide cursor while scrolling
    stop_eof = true,             -- Stop at <EOF> when scrolling downwards
    use_local_scrolloff = true, -- Use the local scope of scrolloff instead of the global scope
    respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
    cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
    easing_function = nil,       -- Default easing function
    pre_hook = nil,              -- Function to run before the scrolling animation starts
    post_hook = nil,             -- Function to run after the scrolling animation ends
    performance_mode = false,    -- Disable "Performance Mode" on all buffers.
})

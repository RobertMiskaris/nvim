local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end


vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'MunifTanjim/nui.nvim'

	-- Lsp
	use 'neovim/nvim-lspconfig' -- Lsp Engine
	use 'onsails/lspkind-nvim' -- vscode-like pictograms
	use 'jose-elias-alvarez/null-ls.nvim' -- Linter, Diagnostic ...
	use 'glepnir/lspsaga.nvim' -- UI
	use 'L3MON4D3/LuaSnip' -- Snippet Engine
	-- use 'ray-x/lsp_signature.nvim'
	
	-- Lsp installer
	use 'williamboman/mason.nvim'
	use 'williamboman/mason-lspconfig.nvim'


	-- Base Req
	use 'nvim-lua/plenary.nvim'
	
	-- Completion
	use 'hrsh7th/nvim-cmp' -- Capabilities Engine
	use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
	use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP

	-- Fzf
	use 'nvim-telescope/telescope.nvim'
	use { "nvim-telescope/telescope-file-browser.nvim" }

	-- File explorer
	-- use 'kyazdani42/nvim-tree.lua'
	use 'nvim-neo-tree/neo-tree.nvim'

	-- Code
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}
	use 'kyazdani42/nvim-web-devicons'
	use 'windwp/nvim-autopairs'
	-- use 'numToStr/Comment.nvim'

	-- Nvim
	use 'nvim-lualine/lualine.nvim'
	use 'akinsho/bufferline.nvim'
	use 'phaazon/hop.nvim'

	-- Theme
	use { "catppuccin/nvim", as = "catppuccin" }
end)

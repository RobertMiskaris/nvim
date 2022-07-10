vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()


	use 'wbthomason/packer.nvim'

	-- Base
	-- use 'nvim-lua/plenary.nvim'

	-- Lsp
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'L3MON4D3/LuaSnip'
	
	-- File exploer
	use {
	    'kyazdani42/nvim-tree.lua',
	    requires = {
	      'kyazdani42/nvim-web-devicons', -- optional, for file icon
	    },
		config = function() require'nvim-tree'.setup {} end
	}


	-- Move
	use 'phaazon/hop.nvim'
	use {
	  'nvim-telescope/telescope.nvim',
	  requires = { {'nvim-lua/plenary.nvim'} }
	}


	-- Theme
	use({
		"catppuccin/nvim",
		as = "catppuccin"
	})


end)

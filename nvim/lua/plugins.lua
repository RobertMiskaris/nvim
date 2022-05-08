
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()

	-- Language
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}

	-- Lsp
	use 'neovim/nvim-lspconfig'
	use 'williamboman/nvim-lsp-installer'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'
    	use 'saadparwaiz1/cmp_luasnip'
	use 'L3MON4D3/LuaSnip'
	use 'onsails/lspkind.nvim'

	use {
		"ray-x/lsp_signature.nvim",
	}


	-- Utils
	use {
	    'numToStr/Comment.nvim',
	    config = function()
		require('Comment').setup()
	    end
	}
	use 'karb94/neoscroll.nvim'
	use 'phaazon/hop.nvim'
	use 'yamatsum/nvim-cursorline'
	-- use 'terryma/vim-multiple-cursors'

	use 'windwp/nvim-ts-autotag'
	use 'windwp/nvim-autopairs'

	-- Buffer
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}

	use {
	    'kyazdani42/nvim-tree.lua',
	    requires = {
	      'kyazdani42/nvim-web-devicons', -- optional, for file icon
	    },
	    config = function() require'nvim-tree'.setup {} end
	}


	use {
		'romgrk/barbar.nvim',
		requires = {'kyazdani42/nvim-web-devicons'}
	}

	use {
	  'nvim-telescope/telescope.nvim',
	  requires = { {'nvim-lua/plenary.nvim'} }
	}

	-- Color
	use({
		"catppuccin/nvim",
		as = "catppuccin"
	})
end)

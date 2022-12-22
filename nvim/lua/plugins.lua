local status, packer = pcall(require, "packer")
if not status then
	print("Packer is not installed")
	return
end

vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	use("MunifTanjim/nui.nvim")
	use("nvim-lua/plenary.nvim")

	-- Lsp
	use("neovim/nvim-lspconfig") -- Lsp Engine
	use("onsails/lspkind-nvim") -- vscode-like pictograms
	use("jose-elias-alvarez/null-ls.nvim") -- Linter, Diagnostic ...
	use("glepnir/lspsaga.nvim") -- UI
	use("L3MON4D3/LuaSnip") -- Snippet Engine
	use("ray-x/lsp_signature.nvim")
	-- use("mfussenegger/nvim-lint")

	-- Lsp installer
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")

	-- Completion
	use("hrsh7th/nvim-cmp") -- Capabilities Engine
	use("hrsh7th/cmp-buffer") -- nvim-cmp source for buffer words
	use("hrsh7th/cmp-nvim-lsp") -- nvim-cmp source for neovim's built-in LSP

	-- Fzf
	use("nvim-telescope/telescope.nvim")

	-- Terminal
	use("numToStr/FTerm.nvim")

	-- Git
	use("kdheepak/lazygit.nvim")
	use({
		"lewis6991/gitsigns.nvim",
	})

	-- File explorer
	use("nvim-neo-tree/neo-tree.nvim")

	-- Code
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("danymat/neogen")
	use("windwp/nvim-autopairs")
	use("lukas-reineke/indent-blankline.nvim")

	-- Nvim
	use("nvim-lualine/lualine.nvim")
	use("phaazon/hop.nvim")
	use("Pocco81/true-zen.nvim")
	use("lewis6991/impatient.nvim") -- cashe nvim
	use("folke/which-key.nvim")
	use("ThePrimeagen/harpoon")

	-- Icons
	use("kyazdani42/nvim-web-devicons")

	-- Theme
	use({ "catppuccin/nvim", as = "catppuccin" })
end)

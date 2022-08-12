--        _             _
--  _ __ | |_   _  __ _(_)_ __  ___
-- | '_ \| | | | |/ _` | | '_ \/ __|
-- | |_) | | |_| | (_| | | | | \__ \
-- | .__/|_|\__,_|\__, |_|_| |_|___/
-- |_|            |___/
--
require("packer").startup(function()

	use("wbthomason/packer.nvim")

	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	-- comments
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})

	use("folke/tokyonight.nvim")
	use("sainnhe/edge")
	use("embark-theme/vim")
	use("projekt0n/github-nvim-theme")
	use("Shatur/neovim-ayu")
	use("marko-cerovac/material.nvim")

	-- tree thingy
	use({
		"kyazdani42/nvim-tree.lua",
		requires = { "kyazdani42/nvim-web-devicons" },
	})

	use({ "akinsho/toggleterm.nvim", tag = "v2.*" })

	-- telescope
	use({
		"nvim-telescope/telescope.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	})

	-- highlights
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	-- lsp set up
	use("neovim/nvim-lspconfig")

	-- completion engine
	use("hrsh7th/nvim-cmp")
	-- COMPLETION SOURCES
	use("hrsh7th/cmp-nvim-lsp") -- for lsp completions
	use("hrsh7th/cmp-buffer") -- for word completions gotten from file
	use("hrsh7th/cmp-path") -- for filesystem paths

	-- this is required for some reason
	use("saadparwaiz1/cmp_luasnip")
	use("L3MON4D3/LuaSnip")
end)

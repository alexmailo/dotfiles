--  _ __ | |_   _  __ _(_)_ __  ___
-- | '_ \| | | | |/ _` | | '_ \/ __|
-- | |_) | | |_| | (_| | | | | \__ \
-- | .__/|_|\__,_|\__, |_|_| |_|___/
-- |_|            |___/

require("packer").startup(function()
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- comments
	use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
	}

	-- 5 colorschemes
	use "elianiva/icy.nvim" 
	use "catppuccin/nvim"
	use "folke/tokyonight.nvim"
	use "sainnhe/edge"
  use "lunarvim/darkplus.nvim"
	use "sainnhe/gruvbox-material"


	use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    config = function() require'nvim-tree'.setup {} end
	}
	-- telescope
	use {
	  'nvim-telescope/telescope.nvim',
	  requires = { {'nvim-lua/plenary.nvim'} }
	}

	-- terminal
	use "akinsho/toggleterm.nvim"

	-- highlights
	use "nvim-treesitter/nvim-treesitter"

	-- lsp set up
	use("neovim/nvim-lspconfig")

	-- completion
	use "hrsh7th/cmp-nvim-lsp"
	use "hrsh7th/cmp-buffer"
	use "hrsh7th/cmp-path"
	use "hrsh7th/nvim-cmp"
	use "saadparwaiz1/cmp_luasnip" -- snippet completions
	use "L3MON4D3/LuaSnip" 

 -- end packer.setup
end)

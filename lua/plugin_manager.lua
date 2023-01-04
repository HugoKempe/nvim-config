return require('packer').startup(function()
	use 'wbthomason/packer.nvim' -- Package manager
	use { -- LSP Configuration & Plugins
    		'neovim/nvim-lspconfig',
    		requires = {
      		-- Automatically install LSPs to stdpath for neovim
      		'williamboman/mason.nvim',
      		'williamboman/mason-lspconfig.nvim',

      		-- Useful status updates for LSP
      		'j-hui/fidget.nvim',

      		-- Additional lua configuration, makes nvim stuff amazing
      		'folke/neodev.nvim',
    		},
  	}

	use { -- Autocompletion
    		'hrsh7th/nvim-cmp',
    		requires = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
  	}

	use { -- Additional text objects via treesitter
    		'nvim-treesitter/nvim-treesitter-textobjects',
    		after = 'nvim-treesitter',
  	}

	-- Git related plugins
  	use 'tpope/vim-fugitive'
  	use 'tpope/vim-rhubarb'
  	use 'lewis6991/gitsigns.nvim'

  	use 'navarasu/onedark.nvim' -- Theme inspired by Atom
  	use 'nvim-lualine/lualine.nvim' -- Fancier statusline
  	use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines
  	use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines
  	use 'tpope/vim-sleuth' -- Detect tabstop and shiftwidth automatically

  	-- Fuzzy Finder (files, lsp, etc)
  	use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }

  	-- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  	use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }

	-- colorscheme
	use 'gruvbox-community/gruvbox'

	-- neo tree
	vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

	use {
  		"nvim-neo-tree/neo-tree.nvim",
    		branch = "v2.x",
    		requires = { 
      			"nvim-lua/plenary.nvim",
      			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
     			 "MunifTanjim/nui.nvim",
    		}
  	}
	
	-- treesitter
	use {
		'nvim-treesitter/nvim-treesitter',
        	run = ':TSUpdate'
	}

	-- smart splits
	use('mrjones2014/smart-splits.nvim')
	
	-- toggleterm
	use {"akinsho/toggleterm.nvim", tag = '*', config = function()
	  require("toggleterm").setup()
	end}
end)

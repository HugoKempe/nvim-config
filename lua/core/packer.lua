local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- Colorscheme
  use 'EdenEast/nightfox.nvim'

  use 'nvim-tree/nvim-web-devicons'

  use 'nvim-lua/plenary.nvim'
  use {'nvim-telescope/telescope.nvim', tag = '0.1.1'}

  use {
	'nvim-treesitter/nvim-treesitter',
	run = function()
		local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
        	ts_update()
        end,
  }
  use "ikatyang/tree-sitter-markdown"

  -- LSP
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }
  use 'mfussenegger/nvim-dap'
  
  use 'jose-elias-alvarez/null-ls.nvim'
  use({
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	tag = "v<CurrentMajor>.*",
	-- install jsregexp (optional!:).
	run = "make install_jsregexp"
  })

  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
        require("lspsaga").setup({})
    end,
    requires = { {"nvim-tree/nvim-web-devicons"} }
  })
  
  -- CMP
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'

  use 'p00f/clangd_extensions.nvim'

  use {
	"windwp/nvim-autopairs",
	config = function() require("nvim-autopairs").setup {} end
  }


  -- Neotree
  use {
  'nvim-tree/nvim-tree.lua', tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  use 'voldikss/vim-floaterm'

  use {
    'numToStr/Comment.nvim',
    config = function()
	    require('Comment').setup()
    end
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

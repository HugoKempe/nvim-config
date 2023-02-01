return {
	"neovim/nvim-lspconfig",

	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup()
		end,
	},

	"mfussenegger/nvim-dap",
	"mfussenegger/nvim-lint",
	"mhartington/formatter.nvim",

}

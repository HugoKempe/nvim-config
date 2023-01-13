local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  return
end

local tree_cb = nvim_tree_config.nvim_tree_callback


-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.load_newtrw = 1
vim.g.load_newtrwPlugin = 1

vim.opt.termguicolors = true

require("nvim-tree").setup({
	sort_by = "case_sensitive",
	view = {
		adaptive_size = false,
		width = 40,
		mappings = {
			list = {
				{ key = "a", action = "create" },
				{ key = "D", action = "delete" },
				{ key = "r", action = "rename" },
				{ key = "p", action = "paste" },
			},
		},
	},
})

local map = require("utils").map

map("n", "<C-x>", ":NvimTreeFocus<CR>", { silent = true })

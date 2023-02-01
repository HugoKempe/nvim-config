local global = vim.g
local option = vim.o
local opt = vim.opt
local buffer_option = vim.bo
local window_option = vim.wo
local indent = 2

global.mapleader = " " -- Set leader
global.maplocalleader = " " -- Set local leader

vim.wo.relativenumber = true

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

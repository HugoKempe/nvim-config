
-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.

-- Setup neovim lua configuration
require('plugins.lsp.settings')
require('neodev').setup()
require('plugins.lsp.mason')

-- Turn on lsp status information
require('fidget').setup()
require('plugins.lsp.cmp')
-- nvim-cmp setup
require('plugins.lsp.clangd-extentions')

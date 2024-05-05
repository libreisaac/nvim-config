-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Packages
require "nvim-tree".setup()

-- Configuration
require "ide.autocmds"
require "ide.options"
require "ide.keymaps"
require "ide.styles"


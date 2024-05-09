-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- Plugin
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
local lazy_vim = require("lazy")
lazy_vim.setup({
    {
        "ibhagwan/fzf-lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("fzf-lua").setup({})
        end
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local configs = require("nvim-treesitter.configs")
            configs.setup({
                ensure_installed = {
                    "asm",
                    "bash",
                    "c",
                    "c_sharp",
                    "cmake",
                    "cpp",
                    "css",
                    "csv",
                    "diff",
                    "git_config",
                    "git_rebase",
                    "gitattributes",
                    "gitcommit",
                    "gitignore",
                    "gpg",
                    "html",
                    "javascript",
                    "json",
                    "lua",
                    "make",
                    "markdown",
                    "markdown_inline",
                    "nasm",
                    "python",
                    "rust",
                    "toml",
                    "xml",
                    "yaml",
                },
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },
                fold = { enable = true },
            })
        end
    },
    {
        "mbbill/undotree"
    },
    {
        "kelly-lin/ranger.nvim",
        config = function()
            require("ranger-nvim").setup({ replace_netrw = true })
        end,
    },
    { "VonHeikemen/lsp-zero.nvim",        branch = "v3.x" },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "neovim/nvim-lspconfig" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/nvim-cmp" },
    { "L3MON4D3/LuaSnip" },
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons", },
    },
})
-- Enable Nvim-Tree
require("nvim-tree").setup()
-- Configuration
require "ide.autocmds"
require "ide.options"
require "ide.keymaps"
require "ide.styles"
require "ide.lsp"

vim.cmd(":NvimTreeOpen")

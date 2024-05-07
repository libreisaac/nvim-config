-- Leader Key Remapping
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Helper functions
local function file_exists(path)
    local f = io.open(path, "r")
    if (f) then
        f.close(f)
        return true
    end

    return false
end

local function toggle(option)
    local new_value = not vim.opt[option]:get()
    vim.opt[option] = new_value
    return new_value
end

local function options(description)
    return { noremap = true, silent = true, desc = description }
end

-- Autoformatting
local function auto_format()
    local cwd = vim.fn.getcwd()
    if file_exists(cwd .. "/Cargo.toml") then
        vim.cmd(":!cargo fmt")
    else
        print("No formatting mechanism detected.")
    end
end

-- Default chord tweaks
vim.keymap.set("n", "gg", "gg0", { silent = true })
vim.keymap.set("n", "G", "G$", { silent = true })

-- Custom Chords
vim.keymap.set("n", "<Leader>rt", function() toggle("relativenumber") end, options("Toggle relative line numbers"))
vim.keymap.set("n", "<Leader>f", auto_format, options("Autoformat all files in the working directory"))
vim.keymap.set("n", "<Leader>t", ":terminal<CR>", options("Open a terminal"))
vim.keymap.set("t", "<Esc>", "<C-u>exit<CR>", options("Exit the terminal"))
-- Fuzzy Find Chords
local fzf = require("fzf-lua")
vim.keymap.set("n", "<Leader>sC", fzf.command_history, options("Search for command from history"))
vim.keymap.set("n", "<Leader>sl", fzf.blines, options("Search for a line in the current buffer"))
vim.keymap.set("n", "<Leader>sP", fzf.loclist, options("Search for a place/location (stack)"))
vim.keymap.set("n", "<Leader>sL", fzf.lines, options("Search for a line in all buffers"))
vim.keymap.set("n", "<Leader>sc", fzf.colorschemes, options("Search for colour scheme"))
vim.keymap.set("n", "<Leader>sF", fzf.oldfiles, options("Search for file from history"))
vim.keymap.set("n", "<Leader>sQ", fzf.quickfix, options("Search for quick fix (stack)"))
vim.keymap.set("n", "<Leader>sp", fzf.loclist, options("Search for a place/location"))
vim.keymap.set("n", "<Leader>sk", fzf.keymaps, options("Search for key mappings"))
vim.keymap.set("n", "<Leader>sq", fzf.quickfix, options("Search for quick fix"))
vim.keymap.set("n", "<Leader>sh", fzf.helptags, options("Search for help tag"))
vim.keymap.set("n", "<Leader>sc", fzf.commands, options("Search for command"))
vim.keymap.set("n", "<Leader>sb", fzf.buffers, options("Search for a buffer"))
vim.keymap.set("n", "<Leader>sf", fzf.files, options("Search for a file"))
vim.keymap.set("n", "<Leader>sa", fzf.args, options("Search for an arg"))
vim.keymap.set("n", "<Leader>st", fzf.tabs, options("Search for a tab"))
-- Fuzzy Find Autocomplete
local autocomplete_modes = { "n", "v", "i", }
vim.keymap.set(autocomplete_modes, "<C-s><C-L>", fzf.complete_bline, options("Complete line based on currently focused buffer"))
vim.keymap.set(autocomplete_modes, "<C-s><C-l>", fzf.complete_line, options("Complete line based on all open buffers"))
vim.keymap.set(autocomplete_modes, "<C-s><C-p>", fzf.complete_path, options("Insert a path; files and directories"))
vim.keymap.set(autocomplete_modes, "<C-s><C-f>", fzf.complete_file, options("Insert a file path"))

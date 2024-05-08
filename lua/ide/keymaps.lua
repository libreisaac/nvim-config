-- Leader Key Remapping
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Helper functions
local function toggle(option)
    local new_value = not vim.opt[option]:get()
    vim.opt[option] = new_value
    return new_value
end

local function options(description)
    return { noremap = true, silent = true, desc = description }
end

-- Default chord tweaks
vim.keymap.set("n", "gg", "gg0", { silent = true })
vim.keymap.set("n", "G", "G$", { silent = true })

-- Custom Chords
vim.keymap.set("n", "<Leader>ex", function() require("ranger-nvim").open(true) end, options("Open ranger file explorer"))
vim.keymap.set("n", "<Leader>rt", function() toggle("relativenumber") end, options("Toggle relative line numbers"))
vim.keymap.set({ "n", "v", "x" }, "<Leader>q", ":q<CR>:redraw<CR>", options("Close the current buffer"))
vim.keymap.set("n", "<Leader>un", ":UndotreeToggle<CR>:UndotreeFocus<CR>", options("Toggle undo tree"))
vim.keymap.set("n", "<Leader>nv", ":vertical new<CR>", options("Open a new buffer split vertically."))
vim.keymap.set("n", "<Leader>nh", ":new<CR>", options("Open a new buffer split horizontally."))
vim.keymap.set({ "n", "v", "x" }, "<S-Tab>", "<:redraw<CR>", options("Decrease indent"))
vim.keymap.set({ "n", "v", "x" }, "<Tab>", ">:redraw<CR>", options("Increase indent"))
vim.keymap.set("n", "<Leader>tr", ":terminal<CR>", options("Open a terminal"))
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
-- LSP Keymaps
local function bind_lsp_keys(buffer)
    local function opts(description)
        local o = options(description)
        o.buffer = buffer
        return o
    end
    vim.keymap.set("n", "<Leader>do", function() vim.diagnostic.open_float() end, opts("Open diagnostics in floating window"))
    vim.keymap.set("n", "<Leader>ws", function() vim.lsp.buf.workspace_symbol() end, opts("Query symbols in workspace"))
    vim.keymap.set("n", "<Leader>dp", function() vim.diagnostic.goto_prev() end, opts("Go to previous disagnostic"))
    vim.keymap.set("n", "<Leader>di", function() vim.lsp.buf.hover() end, opts("Display information about symbol"))
    vim.keymap.set("n", "<Leader>dr", function() vim.lsp.buf.references() end, opts("List references to symbol"))
    vim.keymap.set("n", "<Leader>dn", function() vim.diagnostic.goto_next() end, opts("Go to next diagnostic"))
    vim.keymap.set("n", "<Leader>ca", function() vim.lsp.buf.code_action() end, opts("Open code actions list"))
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts("Display signature help"))
    vim.keymap.set("n", "<Leader>dd", function() vim.lsp.buf.definition() end, opts("Go to definition"))
    vim.keymap.set("n", "<Leader>rs", function() vim.lsp.buf.rename() end, opts("Rename symbol"))
end
-- Move selection
vim.keymap.set("v", "K", ":m '<-2<CR>gv", options("Move highlighted lines up"))
vim.keymap.set("v", "J", ":m '>+1<CR>gv", options("Move highlighted lines down"))

return { bind_lsp_keys = bind_lsp_keys }

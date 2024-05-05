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

local options = { noremap = true, silent = true }

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
vim.keymap.set("n", "<Leader>rt", function() toggle("relativenumber") end, options)
vim.keymap.set("n", "<Leader>e", ":NvimTreeToggle<CR>", options)
vim.keymap.set("n", "<Leader>s", ":find ./**/*", options)
vim.keymap.set("n", "<Leader>f", auto_format, options)

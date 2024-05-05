-- Leader Key Remapping
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Default chord tweaks
vim.keymap.set("n", "gg", "gg0", { silent = true})
vim.keymap.set("n", "G", "G$", { silent = true})

-- Custom Chords
vim.keymap.set("n", "<Leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>s", ":find ./**/*", { noremap = true, silent = true})

-- Autoformatting
local function file_exists(path)
    local f = io.open(path, "r")
    if (f) then
        f.close(f)
        return true
    end

    return false
end

local function auto_format()
    local cwd = vim.fn.getcwd()
    if file_exists(cwd .. "/Cargo.toml") then
        vim.cmd(":!cargo fmt")
    else
        print("No formatting mechanism detected.")
    end
end

vim.keymap.set("n", "<Leader>f", auto_format, { noremap = true, silent = true })

vim.api.nvim_create_autocmd(
    {"TermOpen"}, {
    callback = function(ev)       
        vim.api.nvim_command("startinsert")
        vim.api.nvim_command("setlocal norelativenumber nonumber")
    end,
})

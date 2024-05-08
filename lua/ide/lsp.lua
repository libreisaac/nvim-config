local lsp = require("lsp-zero")
lsp.preset("recommended")

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = cmp.mapping.preset.insert({
    ["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
    ["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
    ["<C-l>"] = cmp.mapping.confirm({select = true}),
    ["<C-Space>"] = cmp.mapping.complete(),
})
cmp.setup({ mapping = cmp_mappings })

require("mason").setup({})
require("mason-lspconfig").setup({
    ensure_installed = {
        "asm_lsp",
        "bashls",
        "clangd",
        "omnisharp",
        "cssls",
        "html",
        "jsonls",
        "tsserver",
        "lua_ls",
        "markdown_oxide",
        "powershell_es",
        "pyright",
        "rust_analyzer",
        "taplo",
        "yamlls",
    },
    handlers = {
        function(server_name)
            require("lspconfig")[server_name].setup({})
        end
    }
})

lsp.on_attach(function(_, buffer)
    require("ide.keymaps").bind_lsp_keys(buffer)
end)

lsp.setup()

return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("plugins.completion.lsp.diagnostics")

        local servers = {
            require("plugins.completion.lsp.servers.rust"),
            require("plugins.completion.lsp.servers.lua"),
        }

        local ensure_installed = {}
        for _, server in ipairs(servers) do
            table.insert(ensure_installed, server.name)
        end


        require("mason").setup({})
        require("mason-lspconfig").setup({
            ensure_installed,
            automatic_installation = true,
        })

        local lspconfig = require("lspconfig")
        for _, server in ipairs(servers) do
            lspconfig[server.name].setup({
                on_attach = server.on_attach,
                capabilities = server.capabilities,
                handlers = server.handlers,
                settings = server.settings
            })
        end
    end
}

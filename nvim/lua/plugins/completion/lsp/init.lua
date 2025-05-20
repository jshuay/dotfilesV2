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
            require("plugins.completion.lsp.servers.css"),
            require("plugins.completion.lsp.servers.html"),
            require("plugins.completion.lsp.servers.java"),
            require("plugins.completion.lsp.servers.json"),
            require("plugins.completion.lsp.servers.lua"),
            require("plugins.completion.lsp.servers.python"),
            require("plugins.completion.lsp.servers.rust"),
            require("plugins.completion.lsp.servers.svelte"),
            require("plugins.completion.lsp.servers.tailwind"),
            require("plugins.completion.lsp.servers.toml"),
            require("plugins.completion.lsp.servers.typescript"),
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
            local config = {
                on_attach = server.on_attach,
                capabilities = server.capabilities,
                handlers = server.handlers,
                settings = server.settings
            }
            if server.root_dir ~= nil then
                config.root_dir = server.root_dir
            end
            lspconfig[server.name].setup(config)
        end
    end
}

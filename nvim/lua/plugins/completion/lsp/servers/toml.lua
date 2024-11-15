local defaults = require("plugins.completion.lsp.servers").defaults

return {
    name = "taplo",
    on_attach = defaults.on_attach,
    capabilities = defaults.capabilities,
    handlers = defaults.handlers,
    settings = {
    },
    root_dir = require("lspconfig.util").root_pattern("*.toml", ".git"),
}

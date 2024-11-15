local defaults = require("plugins.completion.lsp.servers").defaults

return {
    name = "ts_ls",
    on_attach = defaults.on_attach,
    capabilities = defaults.capabilities,
    handlers = defaults.handlers,
    settings = {
    }
}

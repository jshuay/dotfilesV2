local defaults = require("plugins.completion.lsp.servers").defaults

return {
    name = "pylsp",
    on_attach = defaults.on_attach,
    capabilities = defaults.capabilities,
    handlers = defaults.handlers,
    settings = {
    }
}

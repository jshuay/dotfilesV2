local defaults = require("plugins.completion.lsp.servers").defaults

return {
    name = "java_language_server",
    on_attach = defaults.on_attach,
    capabilities = defaults.capabilities,
    handlers = defaults.handlers,
    settings = {
    }
}


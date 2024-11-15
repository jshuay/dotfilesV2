local defaults = require("plugins.completion.lsp.servers").defaults

return {
    name = "html",
    on_attach = defaults.on_attach,
    capabilities = defaults.capabilities,
    handlers = defaults.handlers,
    settings = {
    }
}

local defaults = require("plugins.completion.lsp.servers").defaults

return {
    name = "cssls",
    on_attach = defaults.on_attach,
    capabilities = defaults.capabilities,
    handlers = defaults.handlers,
    settings = {
    }
}

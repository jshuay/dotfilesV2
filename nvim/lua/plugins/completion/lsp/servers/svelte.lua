local defaults = require("plugins.completion.lsp.servers").defaults

return {
    name = "svelte",
    on_attach = defaults.on_attach,
    capabilities = defaults.capabilities,
    handlers = defaults.handlers,
    settings = {
    }
}

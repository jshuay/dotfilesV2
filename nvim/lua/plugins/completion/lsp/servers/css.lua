local defaults = require("plugins.completion.lsp.servers").defaults

local capabilities = defaults.capabilities
capabilities.textDocument.completion.completionItem.snippetSupport = true

return {
    name = "cssls",
    on_attach = defaults.on_attach,
    capabilities = capabilities,
    handlers = defaults.handlers,
    settings = {
    }
}

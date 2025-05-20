local defaults = require("plugins.completion.lsp.servers").defaults

return {
    name = "rust_analyzer",
    on_attach = defaults.on_attach,
    capabilities = defaults.capabilities,
    handlers = defaults.handlers,
    settings = {
        ["rust-analyzer"] = {
            assist = {
                importGranularity = "item",
                importPrefix = "crate"
            },
            cargo = {
                buildScripts = {
                    enable = true
                }
            },
            procMacro = {
                enable = true
            }
        }
    }
}

local keymap = require("keymap")

keymap.set("n", "<LEADER>dd", ":lua vim.diagnostic.open_float()<CR>")
-- keymap.set("n", "<LEADER>dD", ":lua vim.diagnostic.setloclist()<CR>")

vim.diagnostic.config({
    severity_sort = true,
    virtual_text = false,
    float = {
        source = true,
        focus = false,
        border = "rounded",
        format = function(diagnostic)
            if diagnostic.user_data ~= nil and diagnostic.user_data.lsp.code ~= nil then
                return string.format("%s: %s", diagnostic.user_data.lsp.code, diagnostic.message)
            end
            return diagnostic.message
        end
    }
})

local symbols = require("symbols").diagnostics
vim.fn.sign_define("DiagnosticSignError", { text = symbols.ERROR, texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = symbols.WARN, texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = symbols.INFO, texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = symbols.HINT, texthl = "DiagnosticSignHint" })

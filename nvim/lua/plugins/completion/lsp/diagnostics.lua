local keymap = require("keymap")

keymap.set("n", "<LEADER>dd", ":lua vim.diagnostic.open_float()<CR>")
-- keymap.set("n", "<LEADER>dD", ":lua vim.diagnostic.setloclist()<CR>")

local symbols = require("symbols").diagnostics

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
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = symbols.ERROR,
            [vim.diagnostic.severity.WARN] = symbols.WARN,
            [vim.diagnostic.severity.INFO] = symbols.INFO,
            [vim.diagnostic.severity.HINT] = symbols.HINT,
        }
    },
})

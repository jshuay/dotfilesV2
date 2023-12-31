local keymap = require("keymap")

keymap.set("n", "<LEADER>dd", ":lua vim.diagnostic.open_float()<CR>")
keymap.set("n", "<LEADER>dD", ":lua vim.diagnostic.setloclist()<CR>")

vim.diagnostic.config({
    severity_sort = true,
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

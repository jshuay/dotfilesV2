return {
    "petertriho/nvim-scrollbar",
    config = function()
        local symbols = require("symbols")

        require("scrollbar").setup({
            excluded_filetypes = {
                "prompt",
                "TelescopePrompt",
                "NvimTree",
                "aerial"
            },
            excluded_buftypes = {
                "terminal",
                "nofile"
            },
            handle = {
                blend = 0
            },
            marks = {
                Cursor = {
                    text = "•",
                },
                Error = {
                    text = { symbols.diagnostics.ERROR, symbols.diagnostics.ERROR },
                },
                Warn = {
                    text = { symbols.diagnostics.WARN, symbols.diagnostics.WARN },
                },
                Info = {
                    text = { symbols.diagnostics.INFO, symbols.diagnostics.INFO },
                },
                Hint = {
                    text = { symbols.diagnostics.HINT, symbols.diagnostics.HINT },
                },
                GitAdd = {
                },
                GitChange = {
                },
                GitDelete = {
                },
            },
            handlers = {
                gitsigns = true,
            }
        })
        -- require("scrollbar.handlers.gitsigns").setup({})
    end
}

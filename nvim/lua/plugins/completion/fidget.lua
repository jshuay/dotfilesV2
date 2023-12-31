return {
    "j-hui/fidget.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("fidget").setup({
            -- Required for Catppuccin color theme
            notification = {
                window = {
                    winblend = 0
                }
            }
        })
    end
}

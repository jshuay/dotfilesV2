return {
    "catppuccin/nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            transparent_background = true,
            integrations = {
                leap = true,
            }
        })
        vim.cmd([[ colorscheme catppuccin-macchiato ]])
    end
}

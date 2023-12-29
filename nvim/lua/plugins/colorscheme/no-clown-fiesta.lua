return {
    "aktersnurra/no-clown-fiesta.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("no-clown-fiesta").setup({
            --transparent = true
        })

        vim.cmd([[ colorscheme no-clown-fiesta ]])
    end
}

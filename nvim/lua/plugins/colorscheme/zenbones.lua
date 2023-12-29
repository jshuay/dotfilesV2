return {
    "mcchrish/zenbones.nvim",
    dependencies = {
        "rktjmp/lush.nvim"
    },
    lazy = false,
    priority = 1000,
    config = function()
        vim.o.termguicolors = true

        vim.g.forestbone_transparent_background = true

        vim.cmd([[ colorscheme forestbones ]])
    end
}

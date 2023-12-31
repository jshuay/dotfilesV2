return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        "JoosepAlviste/nvim-ts-context-commentstring"
    },
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = "all",
            highlight = {
                enable = true,
                disable = { "NvimTree" },
            }
        })
    end
}

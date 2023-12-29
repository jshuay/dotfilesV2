local keymap = require("keymap")

return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        -- netrw provides nvim's built-in file explorer. nvim-tree recommends to disable it
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        keymap.set("n", "<leader>n", "<cmd>NvimTreeFindFileToggle<CR>")

        require("nvim-tree").setup({
            on_attach = function(bufnr)
                require("nvim-tree.api").config.mappings.default_on_attach(bufnr)
            end
        })
    end,
}

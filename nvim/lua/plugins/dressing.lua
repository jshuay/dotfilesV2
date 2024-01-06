return {
    "stevearc/dressing.nvim",
    dependencies = {
        "nvim-telescope/telescope.nvim",
    },
    config = function()
        require("dressing").setup({
            input = {
                relative = "editor",
                prefer_width = 80,
            },
            select = {
                telescope = require("telescope.themes").get_dropdown({
                    initial_mode = "normal",
                })
            }
        })
    end
}

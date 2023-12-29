return {
    "jesseleite/nvim-noirbuddy",
    dependencies = {
        { "tjdevries/colorbuddy.nvim", branch = "dev" }
    },
    lazy = false,
    priority = 1000,
    opts = {
        colors = {
            primary = "#E3351A",
            secondary = "#EB6651",
            background = "#03181B",
        },
    },
}

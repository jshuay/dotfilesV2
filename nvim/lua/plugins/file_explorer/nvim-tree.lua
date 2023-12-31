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

        local keymap = require("keymap")
        keymap.set("n", "<leader>n", "<cmd>NvimTreeFindFileToggle<CR>")

        require("nvim-tree").setup({
            on_attach = function(bufnr)
                local api = require("nvim-tree.api")

                api.config.mappings.default_on_attach(bufnr)

                keymap.buf_set(bufnr, "n", "v", api.node.open.vertical)
                keymap.buf_set(bufnr, "n", "<LEADER><LEADER>", "<CMD>NvimTreeFindFileToggle<CR>")
            end,
            git = { ignore = true },
            view = {
                width = 30,
                signcolumn = "yes"
            },
            update_focused_file = { enable = true },
            actions = {
                open_file = { resize_window = true }
            },
            hijack_cursor = true,
            diagnostics = {
                enable = true
            },
            ui = {
                confirm = { default_yes = true }
            },
            renderer = {
                indent_markers = { enable = true },
                group_empty = true,
                icons = {
                    git_placement = "signcolumn",
                    show = {
                        git = true,
                        folder = false,
                        file = false,
                        folder_arrow = false
                    },
                    symlink_arrow = " ➜ ",
                    glyphs = {
                        git = {
                            unstaged = "*",
                            staged = "✓",
                            unmerged = "&",
                            renamed = "➜",
                            deleted = "-",
                            untracked = "+",
                            ignored = ""
                        }
                    }
                }
            }
        })
    end,
}

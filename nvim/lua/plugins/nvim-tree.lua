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

        local symbols = require("symbols")

        require("nvim-tree").setup({
            on_attach = function(bufnr)
                local api = require("nvim-tree.api")

                api.config.mappings.default_on_attach(bufnr)

                keymap.buf_set(bufnr, "n", "v", api.node.open.vertical)
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
                enable = true,
                severity = {
                    min = vim.diagnostic.severity.HINT
                },
                icons = {
                    hint = symbols.diagnostics.HINT,
                    info = symbols.diagnostics.INFO,
                    warning = symbols.diagnostics.WARN,
                    error = symbols.diagnostics.ERROR
                }
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
                            unstaged = symbols.git.UNSTAGED,
                            staged = symbols.git.STAGED,
                            unmerged = symbols.git.UNMERGED,
                            renamed = symbols.git.RENAMED,
                            deleted = symbols.git.DELETED,
                            untracked = symbols.git.UNTRACKED,
                            ignored = symbols.git.IGNORED
                        }
                    }
                }
            }
        })
    end,
}

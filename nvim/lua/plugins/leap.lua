return {
    "ggandor/leap.nvim",
    config = function()
        -- Searching in all windows (including the current one) on the tab page.
        LEAP = function()
            require("leap").leap({
                target_windows = vim.tbl_filter(
                    function(win)
                        return vim.api.nvim_win_get_config(win).focusable
                    end,
                    vim.api.nvim_tabpage_list_wins(0)
                )
            })
        end
        require("keymap").set({ "n", "v" }, "<LEADER><LEADER>", "<CMD>lua LEAP()<CR>")
    end
}

local M = {}

M.set = function(mode, lhs, rhs, opts)
    --vim.api.nvim_set_keymap(
    vim.keymap.set(
        mode,
        lhs,
        rhs,
        vim.tbl_extend("keep", opts or {}, { noremap = true, silent = true })
    )
end

M.buf_set = function(bufnr, mode, lhs, rhs, opts)
    --vim.api.nvim_buf_set_keymap(
    vim.keymap.set(
        mode,
        lhs,
        rhs,
        vim.tbl_extend("keep", opts or {}, { noremap = true, silent = true, buffer = bufnr })
    )
end

return M

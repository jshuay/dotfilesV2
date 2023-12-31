local filename = function()
    local filename = vim.fn.expand("%:p:~:.")
    local index = filename:find("?")
    filename = filename:sub(0, (index and index or 0) - 1)

    if filename == "" then
        filename = "[No Name]"
    end
    if vim.bo.modified then
        filename = filename .. " " .. "[+]"
    end
    if vim.bo.modifiable == false or vim.bo.readonly == true then
        filename = filename .. " " .. "[-]"
    end
    return filename
end

local buffer_info = function()
    local buffer_count = 0
    local bufs = vim.api.nvim_list_bufs()
    for _, buf in pairs(bufs) do
        if vim.api.nvim_buf_get_option(buf, "buflisted") then
            buffer_count = buffer_count + 1
        end
    end
    return buffer_count .. " B"
end

local col_location = function()
    return vim.fn.col(".") .. ":" .. vim.fn.col("$") .. " C"
end

local line_location = function()
    return vim.fn.line(".") .. ":" .. vim.fn.line("$") .. " L"
end

local symbols = require("symbols")

return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    config = function()
        require("lualine").setup({
            options = {
                disabled_filetypes = { "NvimTree", "aerial" }
            },
            sections = {
                lualine_a = {
                    "mode",
                },
                lualine_b = {
                    "branch",
                    "diff",
                    {
                        "diagnostics",
                        sources = { "nvim_diagnostic" },
                        symbols = {
                            error = symbols.diagnostics.ERROR,
                            warn = symbols.diagnostics.WARN,
                            info = symbols.diagnostics.INFO,
                            hint = symbols.diagnostics.HINT,
                        }
                    },
                },
                lualine_c = {
                    { filename }
                },
                lualine_x = {},
                lualine_y = {
                    "filetype"
                },
                lualine_z = {
                    { buffer_info },
                    { col_location },
                    { line_location },
                    "progress",
                },
            },
        })
    end
}

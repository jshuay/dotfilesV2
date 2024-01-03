local M = {}

local keymap = require("keymap")

M.on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
    keymap.buf_set(bufnr, "n", "gD", "<CMD>lua vim.lsp.buf.declaration()<CR>")
    keymap.buf_set(bufnr, "n", "gd", "<CMD>lua vim.lsp.buf.definition()<CR>")
    keymap.buf_set(bufnr, "n", "K", "<CMD>lua vim.lsp.buf.hover()<CR>")
    keymap.buf_set(bufnr, "n", "gi", "<CMD>lua vim.lsp.buf.implementation()<CR>")
    keymap.buf_set(bufnr, "n", "ga", "<CMD>lua vim.lsp.buf.code_action()<CR>")
    keymap.buf_set(bufnr, "n", "<C-k>", "<CMD>lua vim.lsp.buf.signature_help()<CR>")
    keymap.buf_set(bufnr, "n", "<LEADER>D", "<CMD>lua vim.lsp.buf.type_definition()<CR>")
    keymap.buf_set(bufnr, "n", "<LEADER>rn", "<CMD>lua vim.lsp.buf.rename()<CR>")
    -- Telescope provides nicer lsp references integration with float window
    -- keymap.buf_set(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")

    keymap.buf_set(bufnr, "n", "<LEADER>rr", "<CMD>lua vim.lsp.buf.document_highlight()<CR>")
    keymap.buf_set(bufnr, "n", "<LEADER>cr", "<CMD>lua vim.lsp.buf.clear_references()<CR>")

    vim.cmd("command! Format execute \"lua vim.lsp.buf.format({ async = true })\"")
end

M.capabilities = require("cmp_nvim_lsp").default_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = false

M.handlers = {
    ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
    ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
}

return { defaults = M }

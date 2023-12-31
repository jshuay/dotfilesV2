return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        -- Completion
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "onsails/lspkind-nvim",

        -- LSP
        "neovim/nvim-lspconfig",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",

        -- Misc.
        "j-hui/fidget.nvim", -- Progress Notification
    },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("plugins.completion.cmp")
        require("plugins.completion.diagnostics")
        require("plugins.completion.lsp")
        require("plugins.completion.fidget")
    end
}

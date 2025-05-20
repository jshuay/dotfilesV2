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
    },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local cmp = require("cmp")

        local select_next_item = cmp.mapping(
            function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                    return
                end
                fallback()
            end,
            { "i", "s" }
        )

        local select_prev_item = cmp.mapping(
            function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                    return
                end
                fallback()
            end,
            { "i", "s" }
        )

        SHOW_CMP = function()
            if cmp.visible() then
                cmp.abort()
                return
            end
            cmp.complete()
        end

        -- Show completion menu from Normal mode
        require("keymap").set("n", "<C-Space>", "i<CMD>lua SHOW_CMP()<CR>")

        cmp.setup({
            experimental = {
                -- ghost_text = true
            },
            completion = {
                completeopt = "menuone,longest,preview,noselect"
            },
            preselect = cmp.PreselectMode.None,
            formatting = {
                format = function(entry, vim_item)
                    local sources = {
                        nvim_lsp = "[Lsp]",
                        nvim_lua = "[Nvim]",
                        buffer = "[Buffer]",
                        path = "[Path]",
                        luasnip = "[Snip]"
                    }
                    local item = require("lspkind").cmp_format()(entry, vim_item)
                    item.menu = sources[entry.source.name]
                    return item
                end
            },
            snippet = {
                expand = function(args)
                    local luasnip = require("luasnip")
                    luasnip.lsp_expand(args.body)
                end
            },
            mapping = {
                ["<Tab>"] = select_next_item,
                ["<Down>"] = select_next_item,
                ["<S-Tab>"] = select_prev_item,
                ["<Up>"] = select_prev_item,
                ["<C-j>"] = cmp.mapping.scroll_docs(4),
                ["<C-Down>"] = cmp.mapping.scroll_docs(4),
                ["<C-k>"] = cmp.mapping.scroll_docs(-4),
                ["<C-Up>"] = cmp.mapping.scroll_docs(-4),
                ["<C-Space>"] = cmp.mapping(SHOW_CMP, { "i", "c" }),
                ["<CR>"] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Insert,
                    select = false
                }),
                ["<C-u>"] = cmp.mapping.abort()
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "nvim_lsp_signature_help" },
                { name = "nvim_lua" },
                { name = "buffer" },
                { name = "path" },
                { name = "luasnip" }
            })
        })
    end
}

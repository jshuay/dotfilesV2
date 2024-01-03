local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    require("plugins.colorscheme.catppuccin"),
    require("plugins.nvim-tree"),
    require("plugins.treesitter"),
    require("plugins.completion"),
    require("plugins.comment"),
    require("plugins.neoscroll"),
    require("plugins.scrollbar"),
    require("plugins.git"),
    require("plugins.lualine"),
    require("plugins.telescope"),
    require("plugins.leap"),
    require("plugins.indent-blankline"),
})

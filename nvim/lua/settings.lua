-- Show line numbers
vim.o.number = true

-- Disable code collapsing
vim.o.foldenable = false

vim.o.backspace = "indent,eol,start"

-- Smoother horizontal and vertical scrolling
--vim.o.sidescroll = 4
--vim.o.scrolloff = 8

-- Tabs as 4 spaces
vim.o.smartindent = true
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4

-- Search while typing
vim.o.incsearch = true

-- Enable file backups
vim.o.backup = true
vim.o.backupdir = vim.fn.stdpath("data") .. "/backup//"

-- Show cursor row and col position
vim.o.ruler = true

-- Disable line wrapping
vim.o.wrap = false

-- Enable mouse interactions in all modes
vim.o.mouse = "a"

-- Allow multiple buffers in single view
vim.o.hidden = true

-- Side gutter
vim.o.signcolumn = "yes:1"

-- Show unwanted characters
vim.o.list = true
vim.o.listchars = "tab:▸ ,trail:·"

-- Show title in terminal window/tab
vim.o.title = true

-- Case settings for search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Predictable split directions
vim.o.splitright = true
vim.o.splitbelow = true

-- Hides VISUAL indicator
vim.o.showmode = false

-- Default color group for color themes
vim.o.background = "dark"

-- Enable undo/redo history
vim.o.undofile = true

vim.o.showcmd = false

-- Spellchecker
vim.o.spell = true
vim.o.spelllang = "en_us"
vim.o.spellsuggest = "best,9"
vim.o.spellfile = vim.fn.stdpath("data") .. "/spell/en.utf-8.add"

-- Set colorcolumn for git commit
vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("ColorColsForGit", { clear = true }),
    pattern = { "gitcommit" },
    callback = function()
        vim.opt_local.colorcolumn = "50,72"
    end
})

-- No horizontal highlighting for cursor
vim.o.cursorline = false

-- Debug logging for LSP
-- vim.lsp.set_log_level = "trace"
-- require("vim.lsp.log").set_format_func(vim.inspect)

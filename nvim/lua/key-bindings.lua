local keymap = require("keymap")

-- Leader Key
vim.g.mapleader = " "
vim.g.maplocalleader = " "
keymap.set("n", " ", "<NOP>")

-- Hot Reload
keymap.set("n", "<LEADER><CR>", ":source " .. vim.fn.stdpath("config") .. "/init.lua<CR>", { silent = false })

-- Window Navigation
keymap.set("n", "<LEADER>h", "<C-w><C-h>")
keymap.set("n", "<LEADER>l", "<C-w><C-l>")
keymap.set("n", "<LEADER>j", "<C-w><C-j>")
keymap.set("n", "<LEADER>k", "<C-w><C-k>")

-- Toggle between last 2 buffers
keymap.set("n", "<LEADER><LEADER>", "<CMD>lua TOGGLE_BUFF()<CR>")
TOGGLE_BUFF = function()
    local prev_buf_name = vim.api.nvim_exec("echo bufname(\"#\")", true)
    if prev_buf_name ~= nil and prev_buf_name ~= "" and prev_buf_name ~= "NvimTree_1" then
        vim.cmd("e #")
    end
end

-- Allow go to files that do not exist
keymap.set("", "gf", ":edit <cfile><CR>")

-- Enable selection indenting
keymap.set("v", "<TAB>", ">gv")
keymap.set("v", "<S-TAB>", "<gv")

-- Disable keybinding for Ex mode
keymap.set("n", "Q", "<NOP>")

-- Maintain the cursor position when yanking a visual selection
-- https://ddrscott.github.io/blog/2016/yank-without-jank/
keymap.set("v", "y", "myy`y")
keymap.set("v", "Y", "myY`y")

-- Add words to spell good/bad list
keymap.set("n", "<LEADER>sg", "zg")
keymap.set("n", "<LEADER>sb", "zw")

-- Run formatter
keymap.set("n", "<LEADER>fmt", "<CMD>lua vim.lsp.buf.format({ async = true })<CR>")

-- TODO: move to cmp plugin
-- Show completion menu from Normal mode
--keymap.set("n", "<C-Space>", "i<CMD>lua SHOW_CMP()<CR>")

-- Clear search highlights
keymap.set("n", "<LEADER>c/", ":noh<CR>")

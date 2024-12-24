-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map("n", "<leader>wtv", ":vsplit | terminal<CR>", opts)
map("n", "<leader>wth", ":split | terminal<CR>", opts)
map("t", "<leader><Esc>", "<C-\\><C-n>", { noremap = true, silent = true })

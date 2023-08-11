-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.relativenumber = false -- Relative line numbers OFF

-- rust debugging support
vim.api.nvim_command("packadd termdebug")
vim.g.termdebugger = "rust-gdb"

vim.b.autoformat = false

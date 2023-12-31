-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.relativenumber = false -- Relative line numbers OFF
vim.opt.ignorecase = false -- be case-sensitive when searching
vim.opt.clipboard = "" -- don't use the system clipboard
vim.opt.spelllang = {} -- disable spellchecking.
vim.opt.conceallevel = 0 -- disable concealing quotes/backticks

-- rust debugging support
vim.api.nvim_command("packadd termdebug")
vim.g.termdebugger = "rust-gdb"

vim.g.autoformat = false

-- disable highlight of current indentation
vim.g.miniindentscope_disable = true

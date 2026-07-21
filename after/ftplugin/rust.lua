local bufnr = vim.api.nvim_get_current_buf()
local opts = { buffer = bufnr, remap = true }

vim.bo.tabstop = 4
vim.bo.shiftwidth = 4

-- NOTE: F4 (docs.rs), F5 (reload workspace), F6 (code action), F8 (format) and
-- F9 (rename) are set generically for every LSP in lua/config/lsp.lua via
-- LspAttach, with a rust-analyzer branch for the rust-specific commands. Only
-- the maps below are truly rust-only.

vim.keymap.set('n', '<leader>c', ':RustLsp openCargo<CR>', vim.tbl_extend('force', opts, { desc = 'Open Cargo.toml' }))

vim.keymap.set('n', '<F2>', ':RustLsp renderDiagnostic<CR>', vim.tbl_extend('force', opts, { desc = 'Show diagnostics' }))

vim.keymap.set('n', '<leader><F5>', ':RustLsp debuggables<CR>', { buffer = bufnr, desc = 'Debuggables' })

-- toggle breakpoint
vim.keymap.set('n', '<leader>b', ':DapToggleBreakpoint<CR>', { buffer = bufnr, desc = 'Toggle breakpoint' })
vim.fn.sign_define('DapBreakpoint', { text = '🛑', texthl = '', linehl = '', numhl = '' })

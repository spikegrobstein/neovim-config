local bufnr = vim.api.nvim_get_current_buf()

vim.bo.tabstop = 4
vim.bo.shiftwidth = 4

--vim.keymap.set('n', 'K', '<cmd>RustHoverActions<cr>', { desc = 'Hover Actions (Rust)' })
--vim.keymap.set('n', '<leader>cR', '<cmd>RustCodeAction<cr>', { desc = 'Code Action (Rust)' })
--vim.keymap.set('n', '<leader>dr', '<cmd>RustDebuggables<cr>', { desc = 'Run Debuggables (Rust)' })
--vim.keymap.set('n', '<F4>', '<cmd>RustOpenExternalDocs<cr>', { desc = 'Open documentation', remap = true })

-- hover (how?)
vim.keymap.set('n', '<leader>c', ':RustLsp openCargo<CR>', { desc = 'Open Cargo.toml', remap = true })

vim.keymap.set('n', '<F2>', ':RustLsp renderDiagnostic<CR>', { desc = 'Show diagnostics', remap = true })

-- open docs (how?)
--vim.keymap.set('n', '<F4>', '<cmd>RustOpenExternalDocs<cr>', { desc = 'Open documentation', remap = true })
vim.keymap.set('n', '<F5>', ':RustLsp reloadWorkspace<CR>', { desc = 'Reload workspace', remap = true })
vim.keymap.set('n', '<F6>', ':RustLsp codeAction<CR>', { desc = 'Show code action menu.', remap = true })

vim.keymap.set('n', '<leader><F5>', ':RustLsp debuggables<CR>', { desc = 'Debuggables' })

-- toggle breakpoint
vim.keymap.set('n', '<leader>b', ':DapToggleBreakpoint<CR>', { desc = 'Toggle breakpoint' })
vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})

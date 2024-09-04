local bufnr = vim.api.nvim_get_current_buf()

-- hover (how?)
vim.keymap.set('n', '<leader>c', ':RustLsp openCargo<CR>', { desc = 'Open Cargo.toml', remap = true })

vim.keymap.set('n', '<F2>', ':RustLsp renderDiagnostic<CR>', { desc = 'Show diagnostics', remap = true })

-- open docs (how?)
--vim.keymap.set('n', '<F4>', '<cmd>RustOpenExternalDocs<cr>', { desc = 'Open documentation', remap = true })
vim.keymap.set('n', '<F5>', ':RustLsp reloadWorkspace<CR>', { desc = 'Reload workspace', remap = true })
vim.keymap.set('n', '<F6>', ':RustLsp codeAction<CR>', { desc = 'Show code action menu.', remap = true })

-- Nvim DAP
vim.keymap.set("n", "<Leader>dl", "<cmd>lua require'dap'.step_into()<CR>", { desc = "Debugger step into" })
vim.keymap.set("n", "<Leader>dj", "<cmd>lua require'dap'.step_over()<CR>", { desc = "Debugger step over" })
vim.keymap.set("n", "<Leader>dk", "<cmd>lua require'dap'.step_out()<CR>", { desc = "Debugger step out" })
vim.keymap.set("n", "<Leader>dc>", "<cmd>lua require'dap'.continue()<CR>", { desc = "Debugger continue" })
vim.keymap.set("n", "<Leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { desc = "Debugger toggle breakpoint" })
vim.keymap.set(
	"n",
	"<Leader>dd",
	"<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
	{ desc = "Debugger set conditional breakpoint" }
)
vim.keymap.set("n", "<Leader>de", "<cmd>lua require'dap'.terminate()<CR>", { desc = "Debugger reset" })
vim.keymap.set("n", "<Leader>dr", "<cmd>lua require'dap'.run_last()<CR>", { desc = "Debugger run last" })

-- rustaceanvim
vim.keymap.set("n", "<Leader>dt", "<cmd>lua vim.cmd('RustLsp testables')<CR>", { desc = "Debugger testables" })

vim.lsp.inlay_hint.enable()

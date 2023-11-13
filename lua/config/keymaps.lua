-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- clear hlsearch
vim.keymap.set("n", "<leader><leader>", ':nohlsearch<Bar>:echo<CR>""', { desc = "Clear search highlight", remap = false })

-- vertical split
vim.keymap.set("n", "<leader>v", "<C-W>v", { desc = "Split window right", remap = true })

-- create tab
vim.keymap.set("n", "<leader>t", ":tabedit<CR>", { desc = "Create new tab", remap = true })

-- close entire tab
vim.keymap.set("n", "<leader>x", ":tabclose<CR>", { desc = "Close entire tab", remap = true })

-- git blame
vim.keymap.set("n", "<leader>gb", ":Git blame<CR>", { desc = "Git blame", remap = true })

-- ctrl-a to move to beginning of command
vim.keymap.set("c", "<C-A>", "<C-B>", { desc = "^A should work like in terminal" })

-- comment toggle
vim.keymap.set({ "n", "v" }, "<C-_>", "<plug>NERDCommenterToggle", { desc = "Toggle comments" })

-- fuzzy-finder
-- vim.keymap.set("n", "<leader>f", "<cmd>lua require('fzf-lua').files()<CR>", { desc = "Fuzzy find files", remap = true })

-- next and previous tabs
vim.keymap.set("n", "gt", "<cmd>BufferLineCycleNext<cr>", { desc = "Next tab" })
vim.keymap.set("n", "gT", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous tab" })

-- Move to window using the <ctrl> hjkl keys
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

vim.keymap.set("n", "<leader>l", ":Lazy<CR>", { desc = "Open Lazy" })

-- map F8 to formatting documents.
vim.keymap.set("n", "<F8>", vim.lsp.buf.format, { desc = "Format document", remap = true })


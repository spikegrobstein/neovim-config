-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

-- local map = vim.map

local map = vim.keymap.set

-- experiemtnal navigation for completion
-- map("i", "<expr><C-j>", 'pumvisible() ? "\\<C-n>" : "<C-j>"', { desc = "Move to next item in popups", remap = false })
-- map("i", "<expr><C-k>", 'pumvisible() ? "\\<C-p>" : "<C-k>"', { desc = "Move to next item in popups", remap = false })

-- vertical split
map("n", "<leader>v", "<C-W>v", { desc = "Split window right", remap = true })

-- clear hlsearch
map("n", "<leader><leader>", ':nohlsearch<Bar>:echo<CR>""', { desc = "Clear search highlight", remap = false })

-- fuzzy-finder
map("n", "<leader>f", "<cmd>lua require('fzf-lua').files()<CR>", { desc = "Fuzzy find files", remap = true})

-- create tab
map("n", "<leader>t", ":tabedit<CR>", { desc = "Create new tab", remap = true })

-- close entire tab
map("n", "<leader>x", ":tabclose<CR>", { desc = "Close entire tab", remap = true })

map("n", "<leader>gb", ":Git blame<CR>", { desc = "Git blame", remap = true })
map("c", "<C-A>", "<C-B>", { desc = "^A should work like in terminal" })

map({"n", "v"}, "<C-_>", "<plug>NERDCommenterToggle", { desc = "Toggle comments" })

-- rust keybindings... should make this only valid for rust files
map("n", "<F4>", "<cmd>RustOpenExternalDocs<cr>", { desc = "Open documentation", remap = false })
map("n", "<F5>", "<cmd>RustReloadWorkspace<CR>", { desc = "Reload the rust workspace", remap = false })
map("n", "<F6>", "<cmd>RustCodeAction<CR>", { desc = "Show code action menu.", remap = false })

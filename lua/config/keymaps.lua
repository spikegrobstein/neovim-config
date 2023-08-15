-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

-- unmap default keys
vim.keymap.del("n", "<leader>ft", { remap = true })
vim.keymap.del("n", "<leader>fT", { remap = true })
vim.keymap.del("n", "<leader>fn", { remap = true })
vim.keymap.del("n", "<leader>fb", { remap = true })
vim.keymap.del("n", "<leader>fF", { remap = true })
vim.keymap.del("n", "<leader>ff", { remap = true })
vim.keymap.del("n", "<leader>fr", { remap = true })
vim.keymap.del("n", "<leader>fR", { remap = true })

-- unmap the "move line" bindings.
vim.keymap.del("n", "<A-j>", {remap = true})
vim.keymap.del("n", "<A-k>", {remap = true})
vim.keymap.del("i", "<A-j>", {remap = true})
vim.keymap.del("i", "<A-k>", {remap = true})
vim.keymap.del("v", "<A-j>", {remap = true})
vim.keymap.del("v", "<A-k>", {remap = true})

local map = vim.keymap.set

-- experiemtnal navigation for completion
-- map("i", "<expr><C-j>", 'pumvisible() ? "\\<C-n>" : "<C-j>"', { desc = "Move to next item in popups", remap = false })
-- map("i", "<expr><C-k>", 'pumvisible() ? "\\<C-p>" : "<C-k>"', { desc = "Move to next item in popups", remap = false })

-- clear hlsearch
map("n", "<leader><leader>", ':nohlsearch<Bar>:echo<CR>""', { desc = "Clear search highlight", remap = false })

-- vertical split
map("n", "<leader>v", "<C-W>v", { desc = "Split window right", remap = true })

-- create tab
map("n", "<leader>t", ":tabedit<CR>", { desc = "Create new tab", remap = true })

-- close entire tab
map("n", "<leader>x", ":tabclose<CR>", { desc = "Close entire tab", remap = true })

-- git blame
map("n", "<leader>gb", ":Git blame<CR>", { desc = "Git blame", remap = true })

-- ctrl-a to move to beginning of command
map("c", "<C-A>", "<C-B>", { desc = "^A should work like in terminal" })

-- comment toggle
map({ "n", "v" }, "<C-_>", "<plug>NERDCommenterToggle", { desc = "Toggle comments" })

-- fuzzy-finder
--map("n", "<leader>f", "<cmd>lua require('fzf-lua').files()<CR>", { desc = "Fuzzy find files", remap = true })

-- next and previous tabs
map("n", "gt", "<cmd>BufferLineCycleNext<cr>", { desc = "Next tab" })
map("n", "gT", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous tab" })

map(
  "n",
  "<leader>f",
  require("lazyvim.util").telescope("files", { preview = false }),
  { desc = "Fuzzy find files", remap = true }
)

-- rust keybindings... this is only valid for rust files
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "rust" },
  callback = function()
    map("n", "<F4>", "<cmd>RustOpenExternalDocs<cr>", { desc = "Open documentation", remap = false })
    map("n", "<F5>", "<cmd>RustReloadWorkspace<CR>", { desc = "Reload the rust workspace", remap = false })
    map("n", "<F6>", "<cmd>RustCodeAction<CR>", { desc = "Show code action menu.", remap = false })
  end,
})

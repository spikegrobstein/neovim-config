-- rust keybindings... this is only valid for rust files
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "rust" },
  callback = function()
    --local rt = require('rust-tools')
    --rt.inlay_hints.enable()

    vim.keymap.set("n", "<F4>", "<cmd>RustOpenExternalDocs<cr>", { desc = "Open documentation", remap = true })
    vim.keymap.set("n", "<F5>", "<cmd>RustReloadWorkspace<CR>", { desc = "Reload the rust workspace", remap = true })
    vim.keymap.set("n", "<F6>", "<cmd>RustCodeAction<CR>", { desc = "Show code action menu.", remap = true })
  end,
})


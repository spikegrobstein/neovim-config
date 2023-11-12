return {
  'simrat39/rust-tools.nvim',
  --on_attach = function(bufnr)
    --local rt = require("rust-tools")

    --rt.setup({
        --server = {
            --on_attach = function(_, bufnr)
                ---- Hover actions
                --vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
                ---- Code action groups
                --vim.keymap.set("n", "<leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
                --on_attach(_, bufnr)
            --end,
        --},
    --})

  --end,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'mfussenegger/nvim-dap',
  }
}

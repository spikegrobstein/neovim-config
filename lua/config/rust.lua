local rt = require 'rust-tools'

rt.setup {
  tools = {
    --autoSetHints = true,
    --hover_with_actions = true,
    inlay_hints = {
      auto = true,
      only_current_line = false,
      show_parameter_hints = false,
      parameter_hints_prefix = ' ',
      other_hints_prefix = '󰇙 ',
      highlight = 'LspInlayHint',
    },
  },
  server = {
    on_attach = function(_, bufnr)
      vim.keymap.set('n', 'K', '<cmd>RustHoverActions<cr>', { desc = 'Hover Actions (Rust)' })
      vim.keymap.set('n', '<leader>cR', '<cmd>RustCodeAction<cr>', { desc = 'Code Action (Rust)' })
      vim.keymap.set('n', '<leader>dr', '<cmd>RustDebuggables<cr>', { desc = 'Run Debuggables (Rust)' })
      vim.keymap.set('n', '<F4>', '<cmd>RustOpenExternalDocs<cr>', { desc = 'Open documentation', remap = true })
      vim.keymap.set('n', '<F5>', '<cmd>RustReloadWorkspace<CR>', { desc = 'Reload the rust workspace', remap = true })
      vim.keymap.set('n', '<F6>', '<cmd>RustCodeAction<CR>', { desc = 'Show code action menu.', remap = true })
    end,
  },
}

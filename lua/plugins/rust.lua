return {
  "mrcjkb/rustaceanvim",
  version = "^3",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "mfussenegger/nvim-dap",
    {
      "lvimuser/lsp-inlayhints.nvim",
      opts = {
        inlay_hints = {
          parameter_hints = {
            prefix = ' ',
            separator = ', ',
          },
          type_hints = {
            prefix = '󰇙 ',
            separator = ', ',
          },
        }
      }
    },
  },
  ft = { "rust" },
  config = function()
    vim.g.rustaceanvim = {
      inlay_hints = {
        highlight = "NonText",
        auto = true,
        only_current_line = false,
        show_parameter_hints = false,
        --highlight = 'LspInlayHint',
      },
      tools = {
        hover_actions = {
          auto_focus = false,
        },
      },
      server = {
        on_attach = function(client, bufnr)
          require("lsp-inlayhints").on_attach(client, bufnr)

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
          vim.keymap.set('n', '<F6>', ':RustLsp hover actions<CR>', { desc = 'Show code action menu.', remap = true })
        end
      }
    }
  end
}

return {
  'simrat39/rust-tools.nvim',
  lazy = true,
  opts = {
    tools = {
      --autoSetHints = true,
      --hover_with_actions = true,
      inlay_hints = {
        auto = true,
        only_current_line = false,
        show_parameter_hints = false,
        parameter_hints_prefix = '<- ',
        other_hints_prefix = '=> ',
        highlight = 'LspInlayHint',
      },
    },
  },

  dependencies = {
    'neovim/nvim-lspconfig',
    'nvim-lua/plenary.nvim',
    'mfussenegger/nvim-dap',
  },
}

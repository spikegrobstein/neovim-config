-- Shows pending keybinds in a popup as you type a mapping prefix.
return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts = {},
  keys = {
    {
      '<leader>?',
      function()
        require('which-key').show { global = false }
      end,
      desc = 'Buffer Local Keymaps (which-key)',
    },
  },
}

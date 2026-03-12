return {
  'apple/pkl-neovim',
  ft = 'pkl',
  dependencies = {
    {
      'nvim-treesitter/nvim-treesitter',
      build = function()
        vim.cmd 'TSUpdate'
      end,
    },
    'L3MON4D3/LuaSnip',
  },
  init = function()
    vim.g.pkl_neovim = {
      start_command = { vim.fn.exepath 'pkl-lsp' },
      pkl_cli_path = vim.fn.exepath 'pkl',
    }
  end,
  build = function()
    require('pkl-neovim').init()
    vim.cmd 'TSInstall pkl'
  end,
  config = function()
    require('pkl-neovim').init()
    require('luasnip.loaders.from_snipmate').lazy_load()
  end,
}

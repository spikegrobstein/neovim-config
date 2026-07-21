-- Faster, actively-maintained successor to the (archived) neodev.nvim.
-- Configures the Lua LS for editing your Neovim config and plugins.
return {
  'folke/lazydev.nvim',
  ft = 'lua',
  opts = {
    library = {
      -- Load luvit types when the `vim.uv` word is found
      { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
    },
  },
}

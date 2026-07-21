-- Autocompletion. Migrated from nvim-cmp -> blink.cmp (the current community
-- default: faster, less config). LuaSnip stays as the snippet engine so
-- friendly-snippets and any snipmate/vscode snippets keep working.
return {
  'saghen/blink.cmp',
  event = 'InsertEnter',
  version = '*', -- use a release tag so lazy pulls the prebuilt fuzzy binary
  dependencies = {
    {
      'L3MON4D3/LuaSnip',
      dependencies = { 'rafamadriz/friendly-snippets' },
      config = function()
        require('luasnip.loaders.from_vscode').lazy_load()
      end,
    },
    'folke/lazydev.nvim',
  },
  opts = {
    snippets = { preset = 'luasnip' },

    keymap = {
      preset = 'none',
      -- Preserve the old cmp behavior: <CR> is left unmapped so it inserts a
      -- literal newline instead of accepting the highlighted item.
      ['<C-n>'] = { 'select_next', 'fallback' },
      ['<C-p>'] = { 'select_prev', 'fallback' },
      ['<C-d>'] = { 'scroll_documentation_up', 'fallback' },
      ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
      ['<C-e>'] = { 'hide', 'fallback' },
      ['<C-Space>'] = { 'show', 'show_documentation', 'hide_documentation' },
      -- <Tab>: next item, else jump forward in a snippet, else fall through.
      ['<Tab>'] = { 'select_next', 'snippet_forward', 'fallback' },
      ['<S-Tab>'] = { 'select_prev', 'snippet_backward', 'fallback' },
    },

    completion = {
      documentation = { auto_show = true, auto_show_delay_ms = 200 },
      menu = { border = 'rounded' },
    },

    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer', 'lazydev' },
      providers = {
        -- lazydev completions for editing the Neovim config itself.
        lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
      },
    },

    fuzzy = { implementation = 'prefer_rust_with_warning' },
  },
}

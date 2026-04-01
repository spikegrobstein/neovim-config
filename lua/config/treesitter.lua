-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`

-- Install parsers (async, no-op if already installed)
require('nvim-treesitter').install {
  'bash',
  'c',
  'cpp',
  'gitcommit',
  'go',
  'javascript',
  'jq',
  'json',
  'lua',
  'make',
  'markdown',
  'markdown_inline',
  'python',
  'regex',
  'ron',
  'rust',
  'toml',
  'tsx',
  'typescript',
  'vim',
  'vimdoc',
  'yaml',
}

-- Enable treesitter highlighting for filetypes with good query support.
-- Neovim 0.12 already enables it for lua, markdown, help, and query via built-in ftplugins.
vim.api.nvim_create_autocmd('FileType', {
  pattern = {
    'bash', 'sh', 'c', 'cpp', 'gitcommit', 'go', 'javascript', 'jq', 'json',
    'make', 'python', 'regex', 'ron', 'rust', 'toml', 'tsx', 'typescript',
    'vim', 'vimdoc', 'yaml',
  },
  callback = function(args)
    vim.treesitter.start(args.buf)
  end,
})

-- Enable treesitter-based indentation (except for rust)
vim.api.nvim_create_autocmd('FileType', {
  callback = function(args)
    if args.match ~= 'rust' then
      vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})

-- [[ Configure Textobjects ]]
require('nvim-treesitter-textobjects').setup {
  select = {
    lookahead = true,
  },
  move = {
    set_jumps = true,
  },
}

-- Textobject select keymaps
local select_textobject = function(capture, query)
  return function()
    require('nvim-treesitter-textobjects.select').select_textobject(capture, query)
  end
end
for _, mapping in ipairs {
  { { 'x', 'o' }, 'aa', '@parameter.outer', 'Around parameter' },
  { { 'x', 'o' }, 'ia', '@parameter.inner', 'Inner parameter' },
  { { 'x', 'o' }, 'af', '@function.outer', 'Around function' },
  { { 'x', 'o' }, 'if', '@function.inner', 'Inner function' },
  { { 'x', 'o' }, 'ac', '@class.outer', 'Around class' },
  { { 'x', 'o' }, 'ic', '@class.inner', 'Inner class' },
} do
  vim.keymap.set(mapping[1], mapping[2], select_textobject(mapping[3], 'textobjects'), { desc = mapping[4] })
end

-- Textobject move keymaps
local move = require 'nvim-treesitter-textobjects.move'
for _, mapping in ipairs {
  { { 'n', 'x', 'o' }, ']m', 'goto_next_start', '@function.outer' },
  { { 'n', 'x', 'o' }, ']]', 'goto_next_start', '@class.outer' },
  { { 'n', 'x', 'o' }, ']M', 'goto_next_end', '@function.outer' },
  { { 'n', 'x', 'o' }, '][', 'goto_next_end', '@class.outer' },
  { { 'n', 'x', 'o' }, '[m', 'goto_previous_start', '@function.outer' },
  { { 'n', 'x', 'o' }, '[[', 'goto_previous_start', '@class.outer' },
  { { 'n', 'x', 'o' }, '[M', 'goto_previous_end', '@function.outer' },
  { { 'n', 'x', 'o' }, '[]', 'goto_previous_end', '@class.outer' },
} do
  vim.keymap.set(mapping[1], mapping[2], function()
    move[mapping[3]](mapping[4], 'textobjects')
  end)
end

-- Textobject swap keymaps
local swap = require 'nvim-treesitter-textobjects.swap'
vim.keymap.set('n', '<leader>a', function()
  swap.swap_next '@parameter.inner'
end, { desc = 'Swap next parameter' })
vim.keymap.set('n', '<leader>A', function()
  swap.swap_previous '@parameter.inner'
end, { desc = 'Swap previous parameter' })

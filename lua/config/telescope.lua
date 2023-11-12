-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
local telescope_actions = require("telescope.actions");
require('telescope').setup {
  pickers = {
    find_files = {
      hidden = true,
    },
    git_files = {
      show_untracked = true,
    },
  },
  defaults = {
    mappings = {
      i = {
        ['<esc>'] = telescope_actions.close,
        ["<C-j>"] = telescope_actions.move_selection_next,
        ["<C-k>"] = telescope_actions.move_selection_previous,
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}

-- Enable telescope fzf native, if installed
require('telescope').load_extension('fzf')

local find_files = function()
  local builtin

  -- if we're in a git project, use the git_files function
  if vim.loop.fs_stat(vim.loop.cwd() .. "/.git") then
    builtin = "git_files"
  else
    builtin = "find_files"
  end

  require('telescope.builtin')[builtin]()
end

vim.keymap.set('n', '<leader>f', find_files, { desc = 'Search [F]iles' })


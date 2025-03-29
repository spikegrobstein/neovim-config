-- [[ Setting options ]]
-- See `:help vim.o`

-- Set highlight on search
vim.o.hlsearch = true

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

-- Case-sensitive searching
vim.o.ignorecase = false
-- vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

vim.opt.wrap = false

vim.opt.expandtab = true
vim.opt.list = true
vim.opt.pumblend = 10
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.winminwidth = 5

-- rust debugging support
vim.api.nvim_command 'packadd termdebug'
vim.g.termdebugger = 'rust-gdb'

vim.cmd.colorscheme 'tokyonight-night'

vim.o.winborder = "rounded"

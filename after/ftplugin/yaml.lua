-- vim-sleuth mis-detects YAML indentation: a `  - item:` list entry followed by
-- a nested `      key:` looks like a 4-space step, so sleuth guesses shiftwidth=4
-- even for files that are really 2-space. Opt this buffer out of sleuth and force
-- 2-space. The defer guards against sleuth's autocmd running after this ftplugin.
vim.b.sleuth_automatic = 0

local function set_indent()
  vim.bo.expandtab = true
  vim.bo.shiftwidth = 2
  vim.bo.tabstop = 2
  vim.bo.softtabstop = 2
end

set_indent()
vim.schedule(set_indent)

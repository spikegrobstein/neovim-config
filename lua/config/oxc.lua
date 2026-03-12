local oxc_config_files = {
  'oxlint.json',
  'oxlint.jsonc',
  '.oxlintrc.json',
  '.oxlintrc.jsonc',
}

local package_json_sections = {
  'dependencies',
  'devDependencies',
  'peerDependencies',
  'optionalDependencies',
}

---Find the nearest package.json for a buffer by searching upward.
---@param bufnr integer
---@return string|nil
local find_package_json = function(bufnr)
  local path = vim.api.nvim_buf_get_name(bufnr)
  if path == '' then
    path = vim.loop.cwd()
  end

  return vim.fs.find('package.json', {
    path = vim.fs.dirname(path),
    upward = true,
  })[1]
end

---Check whether a package.json opts into the Oxc toolchain.
---@param bufnr integer
---@return boolean
local has_oxc_dependency = function(bufnr)
  local package_json = find_package_json(bufnr)
  if not package_json then
    return false
  end

  local ok, lines = pcall(vim.fn.readfile, package_json)
  if not ok then
    return false
  end

  local decoded_ok, package = pcall(vim.json.decode, table.concat(lines, '\n'))
  if not decoded_ok or type(package) ~= 'table' then
    return false
  end

  for _, section in ipairs(package_json_sections) do
    local deps = package[section]
    if type(deps) == 'table' and (deps.oxlint or deps.oxfmt or deps.oxc) then
      return true
    end
  end

  return false
end

---Resolve an Oxc project root from config files or package.json dependencies.
---@param bufnr integer
---@param on_dir fun(root_dir: string)
local oxc_root_dir = function(bufnr, on_dir)
  local root = vim.fs.root(bufnr, oxc_config_files)
  if root then
    on_dir(root)
    return
  end

  if not has_oxc_dependency(bufnr) then
    return
  end

  local package_json = find_package_json(bufnr)
  if package_json then
    on_dir(vim.fs.dirname(package_json))
  end
end

vim.lsp.config('oxlint', {
  root_dir = oxc_root_dir,
})

vim.lsp.config('oxfmt', {
  root_dir = oxc_root_dir,
})

vim.lsp.enable 'oxlint'
vim.lsp.enable 'oxfmt'

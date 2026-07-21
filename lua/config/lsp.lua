-- [[ Configure LSP ]]
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gr', vim.lsp.buf.references, '[G]oto [R]eferences')
  nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
  nmap('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  -- NOTE: signature help lives on <leader>k (normal) and the built-in <C-s>
  -- (insert) so it doesn't clash with the <C-k> window-navigation keymap.
  nmap('<leader>k', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'Configure LSP buffer mappings',
  callback = function(args)
    on_attach(nil, args.buf)
  end,
})

-- Lua LS runtime/library setup is handled by lazydev.nvim (see lua/plugins/lazydev.lua).

-- blink.cmp augments the default LSP client capabilities (completion, etc.);
-- broadcast the enhanced set to every server. Fall back to the built-in
-- capabilities if blink isn't installed yet (e.g. before the first :Lazy sync).
local capabilities = vim.lsp.protocol.make_client_capabilities()
local ok, blink = pcall(require, 'blink.cmp')
if ok then
  capabilities = blink.get_lsp_capabilities(capabilities)
end

vim.lsp.config('*', {
  capabilities = capabilities,
})

-- set up language servers
vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        checkThirdParty = false,
        library = vim.api.nvim_get_runtime_file('', true),
      },
      telemetry = { enable = false },
    },
  },
})

-- mason-lspconfig requires that these setup functions are called in this order
-- before enabling servers.
require('mason').setup()
require('mason-lspconfig').setup {
  ensure_installed = {
    'lua_ls',
    'oxlint',
    'oxfmt',
  },
}

vim.lsp.enable 'lua_ls'

-- [[ Consistent function-key mappings across every language ]]
-- LspAttach fires for every client no matter how it was started (including
-- rustaceanvim's rust-analyzer), so these work everywhere without needing
-- per-language ftplugin overrides. Only the two operations that have no
-- generic LSP equivalent (open external docs, reload workspace) get a small
-- rust-analyzer-specific branch.
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('user-lsp-fkeys', { clear = true }),
  callback = function(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    local map = function(lhs, rhs, desc)
      vim.keymap.set('n', lhs, rhs, { buffer = bufnr, desc = desc })
    end

    -- F6: code action (fix un-imported symbols, fill match arms, quickfixes, ...)
    map('<F6>', vim.lsp.buf.code_action, 'LSP: Code action / fix')
    -- F8: format the buffer
    map('<F8>', function()
      vim.lsp.buf.format()
    end, 'LSP: Format')
    -- F9: rename symbol, then save all buffers
    map('<F9>', function()
      vim.lsp.buf.rename()
      vim.cmd 'silent! wa'
    end, 'LSP: Rename symbol')

    if client and client.name == 'rust-analyzer' then
      -- rust-analyzer ships richer, dedicated versions of these.
      map('<F4>', function()
        vim.cmd.RustLsp 'openDocs'
      end, 'Rust: Open docs.rs for symbol')
      map('<F5>', function()
        vim.cmd.RustLsp 'reloadWorkspace'
      end, 'Rust: Reload workspace')
      map('<F6>', function()
        vim.cmd.RustLsp 'codeAction'
      end, 'Rust: Code action (grouped)')

      -- Auto-format Rust on save so indentation stays correct without pressing
      -- F8 / running `cargo fmt` manually.
      if client:supports_method 'textDocument/formatting' then
        vim.api.nvim_create_autocmd('BufWritePre', {
          group = vim.api.nvim_create_augroup('user-rust-format-' .. bufnr, { clear = true }),
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format { async = false, id = client.id }
          end,
        })
      end
    else
      -- Generic fallback for every other language: restart the buffer's LSP.
      map('<F5>', function()
        for _, c in ipairs(vim.lsp.get_clients { bufnr = bufnr }) do
          vim.lsp.stop_client(c.id, true)
        end
        vim.defer_fn(function()
          vim.cmd 'edit'
        end, 200)
      end, 'LSP: Restart client')
    end
  end,
})

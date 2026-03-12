# AGENTS.md

This file gives coding agents the working rules for this Neovim config.
It is based on the current repository contents, not generic Lua advice.

## Repository Shape

- Entry point: `init.lua`.
- Core config modules live in `lua/config/*.lua`.
- Plugin specs live in `lua/plugins/*.lua`.
- Filetype-specific overrides live in `after/ftplugin/*.lua`.
- Upstream kickstart helper plugins live in `lua/kickstart/plugins/*.lua`.
- Plugin versions are pinned in `lazy-lock.json`.
- Formatting rules are defined in `.stylua.toml`.

## Local Rules Inventory

- No `AGENTS.md` existed before this file.
- No `.cursorrules` file was found.
- No files were found under `.cursor/rules/`.
- No `.github/copilot-instructions.md` file was found.
- Do not assume hidden agent rules beyond what is written here.

## Environment Assumptions

- This repo is a Neovim configuration, not an application library.
- "Build" usually means syncing plugins or validating startup, not producing artifacts.
- Many modules expect to run inside Neovim and may fail in plain `lua`.
- Prefer headless Neovim commands for integration checks.

## Primary Commands

- Install or sync plugins:
  - `nvim --headless "+Lazy! sync" +qa`
- Open the plugin manager manually:
  - `nvim +Lazy`
- Validate Neovim startup with this config:
  - `nvim --headless +qa`
- Run health checks interactively:
  - `nvim +checkhealth`
- Run health checks headlessly and capture output:
  - `nvim --headless "+checkhealth" +qa`

## Formatting Commands

- Format the whole repo with Stylua:
  - `stylua .`
- Check formatting without rewriting files:
  - `stylua --check .`
- Format a single file:
  - `stylua lua/config/keymaps.lua`
- Check a single file only:
  - `stylua --check lua/plugins/trouble.lua`

## Lint / Validation Reality

- There is no dedicated lint runner configured in the repo.
- There is no `package.json`, `Makefile`, `justfile`, `luacheck`, or `selene` config.
- Treat `stylua --check` as the only explicit repository-wide static check.
- Use targeted syntax checks when making isolated edits.

## Syntax / Smoke-Test Commands

- Syntax-check one Lua file outside Neovim:
  - `luac -p lua/plugins/trouble.lua`
- Syntax-check several files:
  - `luac -p init.lua lua/config/*.lua lua/plugins/*.lua`
- Load a single config module inside headless Neovim:
  - `nvim --headless "+lua require('config.options')" +qa`
- Load a single plugin spec module inside headless Neovim:
  - `nvim --headless "+lua require('plugins.trouble')" +qa`

## Test Commands

- There is no formal automated test suite in this repository today.
- No `busted`, `plenary.nvim` test harness, `mini.test`, or `neotest` specs were found.
- Do not claim that `make test` or a single-test runner exists.
- After behavior changes, use the smallest relevant smoke test instead.

## Single-Test Guidance

- For a pure Lua module change, run:
  - `luac -p path/to/file.lua`
- For a formatting-only change, run:
  - `stylua --check path/to/file.lua`
- For a config module change, run:
  - `nvim --headless "+lua require('config.<module>')" +qa`
- For a plugin spec change, run:
  - `nvim --headless "+lua require('plugins.<module>')" +qa`
- For a Rust ftplugin change, use a filetype-scoped smoke test:
  - `nvim --headless "+set ft=rust" "+lua dofile(vim.fn.stdpath('config') .. '/after/ftplugin/rust.lua')" +qa`
- For startup-level changes, prefer:
  - `nvim --headless +qa`

## How To Change Code Safely

- Keep edits narrow and local to the relevant module.
- Preserve the current startup flow in `init.lua` unless the task requires reordering.
- Do not casually rename plugin files; filenames act as module names.
- When adding a plugin, place it in `lua/plugins/<feature>.lua` unless it obviously belongs in `init.lua`.
- When changing filetype behavior, prefer `after/ftplugin/<filetype>.lua` over global conditionals.

## Formatting Rules

- Use spaces, width 2.
- Keep lines within the configured Stylua width of 160.
- Use Unix line endings.
- Let Stylua decide quote normalization; repository config is `AutoPreferSingle`.
- Omit call parentheses when the existing style already does so and Stylua will preserve it.

## Imports And Module Structure

- Use `require 'module'` or `require('module')` consistently within the file you are editing.
- Prefer local requires near the top of a module when values are reused.
- Inline `require(...)` inside mappings or callbacks is acceptable when it avoids eager loading and matches existing code.
- Return plugin specs directly from `lua/plugins/*.lua` files.
- Keep plugin dependencies inside the plugin spec table rather than in separate global setup blocks.

## Naming Conventions

- Module names are lowercase and path-based, for example `config.lsp` or `plugins.trouble`.
- Plugin spec filenames are short, lowercase, and feature-oriented: `rust.lua`, `todo.lua`, `winbar.lua`.
- Config modules use descriptive nouns: `options.lua`, `keymaps.lua`, `treesitter.lua`.
- Use local helper names that are short but readable: `cmp`, `dap`, `ui`, `bufnr`, `opts`.
- Avoid introducing PascalCase locals except when mirroring plugin APIs.

## Types And APIs

- This repo is plain Lua; there is no typed Lua tooling configured.
- Lean on Neovim APIs directly: `vim.o`, `vim.wo`, `vim.bo`, `vim.opt`, `vim.api`, `vim.keymap.set`.
- Prefer buffer/window/filetype-local APIs when the setting is not global.
- Match existing Lazy.nvim plugin spec shapes: string plugin name plus `opts`, `config`, `dependencies`, `ft`, `cmd`, `keys`, `build`, or `cond`.

## Error Handling

- Fail softly for user-triggered actions when a Vim command may error.
- Existing pattern: `pcall(...)` and `vim.notify(err, vim.log.levels.ERROR)`.
- Guard optional executable-dependent features with `vim.fn.executable(...) == 1`.
- Avoid adding noisy notifications for normal control flow.
- Do not swallow errors silently unless the command is explicitly best-effort.

## Keymaps And Commands

- Use `vim.keymap.set` rather than legacy mappings.
- Include `desc` for user-facing mappings whenever practical.
- Scope mappings to buffers or filetypes when behavior is language-specific.
- Reuse existing leader-key conventions instead of inventing a new prefix tree.
- Prefer helper functions for repeated mapping patterns, as in `lua/config/lsp.lua`.

## Comments And Documentation

- Keep the light explanatory tone already present in `init.lua` and `lua/config/*.lua`.
- Add comments only when intent is not obvious from the code.
- Do not restate what a single Neovim API call already makes clear.
- Preserve useful section headers like `-- [[ Configure LSP ]]` when editing nearby code.

## Agent Workflow

- Before editing, inspect neighboring modules for style because this repo is slightly inconsistent.
- After editing, run the smallest relevant validation command from this file.
- For broad changes, run both `stylua --check .` and `nvim --headless +qa`.
- If you add tooling, update this file with the exact new commands.
- If you add a real test framework later, add both full-suite and single-test commands here immediately.

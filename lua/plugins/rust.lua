---@diagnostic disable: undefined-field
return {
  'mrcjkb/rustaceanvim',
  version = '^6',
  lazy = false,
  dependencies = {
    'nvim-lua/plenary.nvim',

    {
      'mfussenegger/nvim-dap',
      dependencies = {
        'rcarriga/nvim-dap-ui',
        'theHamsta/nvim-dap-virtual-text',
        'nvim-neotest/nvim-nio',
        'williamboman/mason.nvim',
      },
      config = function()
        local dap = require 'dap'
        local ui = require 'dapui'

        require('dapui').setup()
        require('nvim-dap-virtual-text').setup {}

        --local rust_debugger = vim.fn.exepath "rust-lldb"
        --if rust_debugger ~= "" then
        --dap.adapters.rust_lldb = {
        --type = "executable",
        --command = rust_debugger,
        --}

        --dap.configurations.elixir = {
        --{
        --type = "rust_lldb",
        --name = "Rust Debugger",
        --task = "cargo run",
        --request = "launch",
        --projectDir = "${workspaceFolder}",
        --exitAfterTaskReturns = false,
        --debugAutoInterpretAllModules = false,
        --},
        --}
        --end

        -- breakpoints
        vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint)
        vim.keymap.set('n', '<leader>B', dap.clear_breakpoints)
        -- NOTE: namespaced under <leader>d* so they don't clobber <leader>gb
        -- (git blame) and other global maps.
        vim.keymap.set('n', '<leader>dC', dap.run_to_cursor)

        --toggle debugger UI
        vim.keymap.set('n', '<leader>du', ui.toggle)

        -- debugger stepping using shift F-keys
        vim.keymap.set('n', '<S-F1>', dap.continue)
        vim.keymap.set('n', '<S-F2>', dap.step_into)
        vim.keymap.set('n', '<S-F3>', dap.step_over)
        vim.keymap.set('n', '<S-F4>', dap.step_out)
        vim.keymap.set('n', '<S-F5>', dap.step_back)
        vim.keymap.set('n', '<S-F11>', dap.close)
        vim.keymap.set('n', '<S-F12>', dap.restart)

        -- ui hooks
        dap.listeners.before.attach.dapui_config = function()
          ui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
          ui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
          ui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
          ui.close()
        end
      end,
    },

    'julianolf/nvim-dap-lldb',
  },
  init = function()
    vim.g.rustaceanvim = {
      inlay_hints = {
        highlight = 'NonText',
        auto = true,
        only_current_line = false,
        show_parameter_hints = false,
        --highlight = 'LspInlayHint',
      },
      tools = {
        hover_actions = {
          auto_focus = false,
        },
      },
      server = {
        -- Use whichever rust-analyzer resolves on PATH rather than hard-coding a
        -- path (e.g. Homebrew's), so the config is portable across machines that
        -- install rust-analyzer differently. Falls back to rustaceanvim's default
        -- if none is found on PATH.
        cmd = (function()
          local ra = vim.fn.exepath 'rust-analyzer'
          if ra ~= '' then
            return { ra }
          end
        end)(),
        default_settings = {
          ['rust-analyzer'] = {
            cargo = {
              -- Analyze all `#[cfg(feature = "...")]` blocks as active so
              -- feature-gated code keeps syntax highlighting and doesn't
              -- emit false "unused import" diagnostics.
              features = 'all',
            },
          },
        },
      },
    }
  end,
}

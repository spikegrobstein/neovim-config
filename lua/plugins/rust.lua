return {
  "mrcjkb/rustaceanvim",
  version = "^6",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",

    {
      "mfussenegger/nvim-dap",
      dependencies = {
        "rcarriga/nvim-dap-ui",
        "theHamsta/nvim-dap-virtual-text",
        "nvim-neotest/nvim-nio",
        "williamboman/mason.nvim",
      },
      config = function()
        local dap = require "dap"
        local ui = require "dapui"

        require("dapui").setup()
        require("nvim-dap-virtual-text").setup()

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
        vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)
        vim.keymap.set("n", "<leader>B", dap.clear_breakpoints)
        vim.keymap.set("n", "<leader>gb", dap.run_to_cursor)

        --toggle debugger UI
        vim.keymap.set("n", "<leader>d", ui.toggle)

        -- debugger stepping using shift F-keys
        vim.keymap.set("n", "<S-F1>", dap.continue)
        vim.keymap.set("n", "<S-F2>", dap.step_into)
        vim.keymap.set("n", "<S-F3>", dap.step_over)
        vim.keymap.set("n", "<S-F4>", dap.step_out)
        vim.keymap.set("n", "<S-F5>", dap.step_back)
        vim.keymap.set("n", "<S-F11>", dap.close)
        vim.keymap.set("n", "<S-F12>", dap.restart)

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
      end
    },

    "julianolf/nvim-dap-lldb",
  },
  ft = { "rust" },
  config = function()
    vim.g.rustaceanvim = {
      inlay_hints = {
        highlight = "NonText",
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
    }
  end
}

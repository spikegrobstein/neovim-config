return {
  "neovim/nvim-lspconfig",
  opts = {
    autoformat = false,
    servers = {
      lua_ls = {
        settings = {
          Lua = {
            format = {
              enable = true,
            },
            diagnostics = {
              neededFileStatus = {
                ["codestyle-check"] = "Any",
              },
              groupSeverity = { ["codestyle-check"] = "Warning" },
            },
            workspace = {
              checkThirdParty = false,
              library = {
                "/Users/spike/c/rome/kong",
              },
            },
            completion = {
              callSnippet = "Replace",
            },
          },
        },
      },
    },
  },
}

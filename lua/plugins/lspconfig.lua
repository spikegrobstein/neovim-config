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
              defaultConfig = {
                indent_style = "space",
                indent_size = "2",
              },
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

local cmp_window = require("cmp.config.window")

return {
  "hrsh7th/nvim-cmp",
  opts = {
    window = {
      completion = cmp_window.bordered({
        winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
      }),
      documentation = cmp_window.bordered({
        winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
      }),
    },
    mapping = {
      ["<CR>"] = vim.NIL,
    },
  },
}

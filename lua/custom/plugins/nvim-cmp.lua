-- additional config for completion

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
    --mapping = {
      ---- pressing return should not select item
      --["<CR>"] = vim.NIL,
    --},
  },
}

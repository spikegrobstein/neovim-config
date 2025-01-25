-- using lazy.nvim
return {
  "S1M0N38/love2d.nvim",
  cmd = "LoveRun",
  ft = "lua",
  opts = {},
  keys = {
    --{ "<leader>v", ft = "lua", desc = "LÖVE" },
    {
      "<leader>r",
      function()
        local love2d = require("love2d")

        if love2d.job and love2d.job.id then
          vim.cmd.LoveStop()
          vim.defer_fn(vim.cmd.LoveRun, 500)
        else
          vim.cmd.LoveRun()
        end
      end,
      ft = "lua",
      desc = "Run LÖVE"
    },
    { "<F10>", "<cmd>LoveStop<cr>", ft = "lua", desc = "Stop LÖVE" },
  },
}

-- using lazy.nvim
return {
  "S1M0N38/love2d.nvim",
  cmd = "LoveRun",
  ft = "lua",
  opts = { },
  keys = {
    --{ "<leader>v", ft = "lua", desc = "LÖVE" },
    { "<leader>r", "<cmd>LoveRun<cr>", ft = "lua", desc = "Run LÖVE" },
    { "<F10>", "<cmd>LoveStop<cr>", ft = "lua", desc = "Stop LÖVE" },
  },
}

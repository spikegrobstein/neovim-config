return {
  "folke/tokyonight.nvim",
  opts = {
    dim_inactive = true,
    style = "night",
    on_colors = function(colors)
      colors.border = colors.yellow
    end,
  },
}

return {
  "folke/tokyonight.nvim",
  lazy = false,
  opts = {
    dim_inactive = true,
    style = "night",
    on_colors = function(colors)
      colors.border = colors.yellow
    end,
  },
}

return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      enabled = vim.fn.executable("make") == 1,
    },
  },
  opts = {
    --defaults = {
      --mappings = {
        --i = {
          --["<c-j>"] = function(...)
            --return require("telescope.actions").move_selection_next(...)
          --end,
          --["<c-k>"] = function(...)
            --return require("telescope.actions").move_selection_previous(...)
          --end,
        --},
      --},
    --},
  },
}

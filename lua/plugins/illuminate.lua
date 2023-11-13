-- Automatically highlights other instances of the word under your cursor.
-- This works with LSP, Treesitter, and regexp matching to find the other
-- instances.

return {
  "RRethy/vim-illuminate",
  --event = "LazyFile",
  opts = {
    delay = 200,
  },
  keys = {
    { "]]", desc = "Next Reference" },
    { "[[", desc = "Prev Reference" },
  },
}

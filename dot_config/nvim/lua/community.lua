-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.editing-support.auto-save-nvim"},
  { import = "astrocommunity.git.git-blame-nvim"},
  { import = "astrocommunity.lsp.coc-nvim"},
  { import = "astrocommunity.comment.mini-comment"},
  -- import/override with your plugins folder
  {
    "github/copilot.vim",
    lazy=false,
  }
}

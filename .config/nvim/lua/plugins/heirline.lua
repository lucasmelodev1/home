-- Remove the AstroNvim UI bars provided by heirline:
--   statusline -- bottom bar (mode, git, diagnostics, ...)
--   winbar     -- path/breadcrumbs bar shown directly below the tabline
--   tabline    -- top buffer tabs
-- Setting a component to `nil` makes heirline skip setting it up entirely.
-- The `statuscolumn` (line numbers/signs) is intentionally kept.

---@type LazySpec
return {
  "rebelot/heirline.nvim",
  opts = function(_, opts)
    opts.statusline = nil
    opts.winbar = nil
    opts.tabline = nil
    return opts
  end,
}

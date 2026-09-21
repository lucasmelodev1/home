-- Gruvbox Material colorscheme: https://github.com/sainnhe/gruvbox-material
-- The scheme is applied by AstroUI (`lua/plugins/astroui.lua`), so it must be
-- loaded eagerly and with a high priority.

---@type LazySpec
return {
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    config = function()
      -- See `:h gruvbox-material-configuration` for all available options
      vim.g.gruvbox_material_background = "medium"
      vim.g.gruvbox_material_enable_italic = 1
      vim.g.gruvbox_material_enable_bold = 1
      vim.g.gruvbox_material_better_performance = 1
      vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
    end,
  },
}

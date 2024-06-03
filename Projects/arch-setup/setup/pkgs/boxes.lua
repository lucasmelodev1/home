local flatpak = require("utils.flatpak")

local M = {}

function M.install()
  flatpak.install_package("org.gnome.Boxes")
end

return M

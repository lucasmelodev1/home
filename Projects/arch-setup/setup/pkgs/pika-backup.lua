local flatpak = require("utils.flatpak")

local M = {}

function M.install()
  flatpak.install_package("org.gnome.World.PikaBackup")
end

return M

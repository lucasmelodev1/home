local flatpak = require("utils.flatpak")

local M = {}

function M.install()
  flatpak.install_package("io.bassi.Amberol")
end

return M

local flatpak = require("utils.flatpak")

local M = {}

function M.install()
  flatpak.install_package("io.github.mrvladus.List")
end

return M

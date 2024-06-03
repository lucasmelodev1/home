local flatpak = require("utils.flatpak")

local M = {}

function M.install()
  flatpak.install_package("com.mattjakeman.ExtensionManager")
end

return M

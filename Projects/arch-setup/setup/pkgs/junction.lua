local flatpak = require("utils.flatpak")

local M = {}

function M.install()
  flatpak.install_package("re.sonny.Junction")
end

return M

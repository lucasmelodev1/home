local pkg = require("utils.pkg")

local M = {}

function M.install()
  pkg.install_package("alacritty")
end

return M

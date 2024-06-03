local pkg = require("utils.pkg")

local M = {}

function M.install()
  pkg.install_package("eza")
end

return M

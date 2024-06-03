-- Define the list of packages to be installed
-- local packages = {
--     -- essentials
--     "neovim",
--     "git",
--     "tmux",
--     "alacritty",
--     "zsh",
--
--     -- utility
--     "eza",
--     "bat",
--     "ripgrep",
--     "fd",
-- }
--
local files = require("utils.files")

local pkgFiles = files.get_all_in_folder("setup/pkgs")

for _, filepath in ipairs(pkgFiles) do
  local moduleName = files.filepath_to_module(filepath)
  local module = require(moduleName)
  module.install()
end

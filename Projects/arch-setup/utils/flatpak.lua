local cmd = require("utils.cmd")

local M = {}

function M.is_installed(package_name)
  local result = cmd.execute_command("flatpak list --app")
  return result:find(package_name) ~= nil
end

function M.install_package(package_name)
  if M.is_installed(package_name) then
    print(package_name .. " is already installed.")
  else
    print(package_name .. " is not installed. Installing...")
    local result = cmd.execute_command("flatpak install -y " .. package_name)
    print(result)
    if M.is_installed(package_name) then
      print(package_name .. " installed successfully.")
    else
      print("Failed to install " .. package_name .. ".")
    end
  end
end

return M

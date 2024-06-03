local cmd = require("utils.cmd")

local M = {}

function M.is_installed(package)
  local result = cmd.execute_command("pacman -Q " .. package .. " 2>&1")
  if string.match(result, "was not found") then
    return false
  else
    return true
  end
end

function M.install_package(package)
  local installed = M.is_installed(package)

  if installed then
    print(package .. " is already installed.")
  else
    print("Installing " .. package .. "...")
    local result = cmd.execute_command("sudo pacman -S --noconfirm " .. package .. " 2>&1")

    if string.match(result, "error:") then
      print(package .. " installed successfully.")
      return false, result
    else
      print("Failed to install " .. package .. ". Error: " .. result)
      return true, result
    end
  end
end

return M

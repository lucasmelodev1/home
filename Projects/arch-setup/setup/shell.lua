local cmd = require("utils.cmd")
local pkg = require("utils.pkg")

local function change_default_shell(shell)
    local current_user = os.getenv("USER")
    local command = string.format("chsh -s %s %s", shell, current_user)
    local result = cmd.execute_command(command)
    return result
end

local function configure_shell(shell)
    print(string.format("Changing default shell to %s...", shell))
    local shell_binary = string.format("/bin/%s", shell)
    local result = change_default_shell(shell_binary)
    if result then
        print(result)
    end

    print(string.format("%s shell configuration complete.", shell))
end

local shell = "zsh"
local success, _ = pkg.install_package(shell)
if success then
    configure_shell(shell)
end

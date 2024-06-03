local M = {}

-- Function to execute a shell command and capture the output
function M.execute_command(command)
    local handle = io.popen(command)
    local result = handle:read("*a")
    handle:close()
    return result
end

return M


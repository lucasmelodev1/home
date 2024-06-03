local files = require("utils.files")

-- Function to execute a Lua file
local function execute_lua_file(file)
    local chunk, err = loadfile(file)
    if not chunk then
        print("Error loading file " .. file .. ": " .. err)
        return
    end
    local success, err = pcall(chunk)
    if not success then
        print("Error running file " .. file .. ": " .. err)
    end
end

-- Function to display help
local function display_help()
    print("Usage: lua init.lua [options]")
    print("Options:")
    print("  --help          Display this help message")
    print("  --only <files>  Execute only the specified Lua files (comma-separated, without .lua extension)")
    print("")
    print("Default behavior is to execute all Lua files in the 'setup' directory")
end

-- Main script
local args = { ... }

if #args == 0 then
    -- No arguments, run all Lua files in the setup directory
    local files = files.get_all_in_folder("setup")
    for _, file in ipairs(files) do
        execute_lua_file(file)
    end
else
    for i, arg in ipairs(args) do
        if arg == "--help" then
            display_help()
            return
        elseif arg == "--only" then
            local files = args[i + 1]
            if not files then
                print("Error: --only flag requires a list of files")
                return
            end
            for file in string.gmatch(files, '([^,]+)') do
                execute_lua_file("setup/" .. file .. ".lua")
            end
            return
        else
            print("Unknown argument: " .. arg)
            display_help()
            return
        end
    end
end

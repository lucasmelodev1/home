-- Function to execute a shell command and capture the output
local function execute_command(command)
    local handle = io.popen(command)
    local result = handle:read("*a")
    handle:close()
    return result
end

-- Function to clone a GitHub repository
local function clone_repository(repo_url, destination)
    local command = "git clone " .. repo_url .. " " .. destination
    return execute_command(command)
end

-- Function to copy/replace all files in the .config directory
local function copy_to_config(src_dir, dest_dir)
    local command = "rsync -avh --delete " .. src_dir .. " " .. dest_dir
    return execute_command(command)
end

-- Main script
local github_repo_url = "https://github.com/lucasmelodev1/.config"
local clone_destination = "/tmp/config_tmp_repo"
local config_destination = os.getenv("HOME") .. "/.config/"

-- Clone the repository
print("Cloning repository...")
local clone_result = clone_repository(github_repo_url, clone_destination)
print(clone_result)

-- Copy/replace files in the .config directory
print("Copying files to .config...")
local copy_result = copy_to_config(clone_destination .. "/.", config_destination)
print(copy_result)

print("Done!")


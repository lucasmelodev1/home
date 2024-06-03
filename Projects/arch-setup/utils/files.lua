local M = {}

function M.get_all_in_folder(folder)
  local files = {}
  local p = io.popen(string.format('ls %s', folder))
  for file in p:lines() do
    if file:match("%.lua$") then
      table.insert(files, string.format("%s/", folder) .. file)
    end
  end
  return files
end

function M.filepath_to_module(filepath)
  -- Remove file extension
  local module_name = filepath:gsub("%.lua$", "")
  -- Replace directory separators with dots
  module_name = module_name:gsub("/", ".")
  return module_name
end

return M

local M = {}

M.read_json = function(file_path)
  local file = io.open(file_path, "r")
  if not file then
    error("无法打开文件：" .. file_path)
  end

  local content = file:read("*a")
  file:close()

  if not content or content == "" then
    return nil
  end

  return vim.json.decode(content)
end

M.write_json = function(file_path, data)
  local file = io.open(file_path, "w")
  if not file then
    error("无法打开文件：" .. file_path)
  end

  local content = vim.json.encode(data)
  file:write(content)
  file:close()
end

return M

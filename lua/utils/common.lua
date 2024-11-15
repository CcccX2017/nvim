local M = {}

M.is_win = vim.uv.os_uname().sysname:find("Windows") ~= nil

function M.java_bin()
  local java_home = vim.env["JAVA_HOME"]
  if java_home then
    return java_home .. "/bin/java"
  end
  return "java"
end

function M.file_is_exist(file_path)
  local file = io.open(file_path, "r")
  if file then
    file:close()
    return true
  end

  return false
end

return M

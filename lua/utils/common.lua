local M = {}

M.is_win = vim.uv.os_uname().sysname:find("Windows") ~= nil

function M.java_bin()
  local java_home = vim.env["JAVA_HOME"]
  if java_home then
    return java_home .. "/bin/java"
  end
  return "java"
end

return M

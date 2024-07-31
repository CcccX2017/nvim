local M = {}

M.is_win = vim.uv.os_uname().sysname:find("Windows") ~= nil

return M

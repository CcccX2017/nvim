local M = {}

local common = require("utils.common")
local json = require("utils.json")

local default_setting = {
  -- 默认不随机选择主题且不透明
  theme = {
    random = false,
    transparent = false,
  },
}

local function is_data_empty(data)
  if not data or (type(data) == "table" and next(data) == nil) then
    return true
  end

  return false
end

local function init_default_data()
  json.write_json(M.file_path, default_setting)
end

local home = os.getenv("HOME") or os.getenv("USERPROFILE")

M.file_path = home .. "/.config/nebula_nvim.json"

M.init = function(force)
  force = force or false
  if force then
    init_default_data()
  else
    -- 检查文件是否存在且非空，否则初始化默认数据
    local data = common.file_is_exist(M.file_path) and json.read_json(M.file_path) or nil
    if not data or is_data_empty(data) then
      init_default_data()
    end
  end
end

return M

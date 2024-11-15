local M = {}

local default_theme = "ayu"

local themes = {
  "catppuccin",
  "github_dark",
  "material",
  "monokai-pro",
  "nightfox",
  "onedark",
  "tokyonight",
  "gruvbox",
  "rose-pine",
  "ayu",
}

local json = require("utils.json")
local nebula_nvim = require("utils.nebula-nvim")
local file_path = nebula_nvim.file_path
local config = json.read_json(file_path)

local function read_persistent_value()
  if config and config.theme and config.theme.random ~= nil then
    return config.theme.random
  end

  -- 默认返回false
  return false
end

local function write_persistent_value(value)
  if config and config.theme and config.theme.random ~= nil then
    config.theme.random = value
    json.write_json(file_path, config)
  end
end

local function shuffle(tbl)
  math.randomseed(os.time())
  for i = #tbl, 2, -1 do
    local j = math.random(1, i)
    tbl[i], tbl[j] = tbl[j], tbl[i]
  end
end
shuffle(themes)

local function get_random_theme()
  math.randomseed(os.time())
  local index = math.random(#themes)
  return themes[index]
end

local random_enabled = read_persistent_value()

M.toggle_random_enabled = function()
  random_enabled = not random_enabled
  write_persistent_value(random_enabled)
  if not random_enabled then
    vim.notify("Disabled random theme, change theme to " .. default_theme)
    return default_theme
  end

  local theme = get_random_theme()
  vim.notify("Enable random theme, change theme to " .. theme)
  return theme
end

M.random = function()
  if not random_enabled then
    return default_theme
  end

  local theme = get_random_theme()

  vim.notify("Current Theme: " .. theme)
  return theme
end

M.get_transparent = function() end

M.set_transparent = function(transparent)
  transparent = transparent or false
  vim.g.transparent_enabled = transparent
  -- 持久化
  local data = json.read_json(file_path)
  if data then
    data.theme.transparent = transparent
    json.write_json(file_path, data)
  end
end

M.change_theme = function(theme)
  require("themes." .. theme).setup()
  vim.cmd("colorscheme " .. theme)
end

return M

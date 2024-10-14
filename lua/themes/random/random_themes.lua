local M = {}

local default_theme = "tokyonight"

local themes = {
  "catppuccin",
  "github_dark",
  "material",
  "monokai-pro",
  "nightfox",
  "onedark",
  "tokyonight",
}

local config_path = vim.fn.stdpath("config") .. "/lua/themes/random/random_theme_config.txt"

local function read_persistent_value()
  local file = io.open(config_path, "r")
  if file then
    local value = string.gsub(file:read("*a"), "%s+", "")
    file:close()
    return value == "true"
  end

  -- 默认返回false
  return false
end

local function write_persistent_value(value)
  local file = io.open(config_path, "w")
  if file then
    file:write(tostring(value))
    file:close()
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

return M

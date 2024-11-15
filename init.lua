require("utils.nebula-nvim").init()

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

--[[ local json = require("utils.json")
local path = vim.fn.stdpath("config") .. "/my-setting.json"
local data = json.read_json(path)
data.theme.random = false
json.write_json(path, data)

data = json.read_json(path)
vim.notify(vim.inspect(data)) ]]

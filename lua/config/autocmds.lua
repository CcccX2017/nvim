local function augroup(name)
  return vim.api.nvim_create_augroup("nebula_" .. name, { clear = true })
end

local api = vim.api

-- 不自动注释新行
api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })

if not vim.g.neotree_enabled then
  api.nvim_create_autocmd("FileType", {
    pattern = {
      "NvimTree",
      "Outline",
    },
    callback = function()
      vim.b.miniindentscope_disable = true
    end,
  })
end

local function is_java_project()
  return require("utils.project").is_java_project()
end

api.nvim_create_autocmd({ "FileType", "BufRead", "BufNewFile" }, {
  pattern = { "xml", "java" },
  callback = function()
    if is_java_project() then
      vim.bo.shiftwidth = 4
      vim.bo.tabstop = 4
      vim.bo.expandtab = true
    end
  end,
})

-- snacks.rename
-- nvim-tree
local prev = { new_name = "", old_name = "" } -- Prevents duplicate events
api.nvim_create_autocmd("User", {
  pattern = "NvimTreeSetup",
  callback = function()
    local events = require("nvim-tree.api").events
    events.subscribe(events.Event.NodeRenamed, function(data)
      if prev.new_name ~= data.new_name or prev.old_name ~= data.old_name then
        data = data
        Snacks.rename.on_rename_file(data.old_name, data.new_name)
      end
    end)
  end,
})
-- mini.files
api.nvim_create_autocmd("User", {
  pattern = "MiniFilesActionRename",
  callback = function(event)
    Snacks.rename.on_rename_file(event.data.from, event.data.to)
  end,
})

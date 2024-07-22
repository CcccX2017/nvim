local M = {}

-- 检查当前vue版本
local function is_vue3()
  local package_json = vim.fn.findfile("package.json", ".;")
  if package_json == "" then
    return nil
  end

  local file = io.open(package_json, "r")
  if not file then
    return nil
  end

  local content = file:read("*a")
  file:close()
  local package = vim.fn.json_decode(content)

  local vue_version = package.dependencies and package.dependencies.vue
    or package.devDependencies and package.devDependencied.vue

  if vue_version then
    local major_version = vue_version:match("%^?(%d)")
    return tonumber(major_version) == 3
  end

  return nil
end

function M.setup_volar_hybrid_mode()
  return is_vue3()
end

-- volar的hybridMode为true时，解决No LSP Definitions found的问题
function M.repair_no_lsp_definitions_found(opts)
  local hybrid_mode = is_vue3() == true
  if hybrid_mode then
    table.insert(opts.routes, {
      filter = {
        event = "notify",
        find = "No LSP Definitions found",
      },
      opts = {
        skip = true,
      },
    })
  end
end

return M

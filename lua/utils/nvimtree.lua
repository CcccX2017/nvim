local M = {}

local function start_telescope(telescope_mode)
  local node = require("nvim-tree.lib").get_node_at_cursor()
  if node then
    local abspath = node.link_to or node.absolute_path
    local is_folder = node.open ~= nil
    local basedir = is_folder and abspath or vim.fn.fnamemodify(abspath, ":h")

    require("telescope.builtin")[telescope_mode]({
      cwd = basedir,
    })
  end
end

function M.on_attach(bufnr)
  local api = require("nvim-tree.api")

  local function telescope_find_files(_)
    start_telescope("find_files")
  end

  local function telescope_live_grep(_)
    start_telescope("live_grep")
  end

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  api.config.mappings.default_on_attach(bufnr)

  vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
  vim.keymap.set("n", "v", api.node.open.vertical, opts("Open: Vertical Split"))
  vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
  vim.keymap.set("n", "C", api.tree.change_root_to_node, opts("CD"))
  vim.keymap.set("n", "<leader>ep", api.tree.change_root_to_parent, opts("Telescope Find Files"))
  vim.keymap.set("n", "<leader>ec", api.tree.collapse_all, opts("Collapse All"))
  vim.keymap.set("n", "<leader>el", telescope_live_grep, opts("Telescope Live Grep"))
  vim.keymap.set("n", "<leader>ef", telescope_find_files, opts("Telescope Find Files"))
end

return M

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- jk回到normal模式
map("i", "jk", "<esc>", { desc = "jk回到normal模式" })

map({ "n", "v" }, "x", '"_x')

-- leader w 保存
map("n", "<leader>w", "<cmd>w<cr><esc>", opts)

-- Q 退出
map("n", "<S-q>", ":wq<cr>", opts)

-- 删除不覆盖剪切板
map({ "n", "v" }, "<leader>dd", '"_dd', { desc = "删除一行不覆盖剪切板" })

map("n", "<leader>dw", '"_dw', { desc = "删除一个单词不覆盖剪切板" })

-- 数字加减
map("n", "+", "<C-a>")
map("n", "-", "<C-x>")

-- 全选
map("n", "<C-a>", "gg<S-v>G")

-- Jumplist 等效按tab键跳到下一个待填充的位置
map("n", "<C-m>", "<C-i>", opts)

-- New Tab
map("n", "te", ":tabedit<cr>", opts)
map("n", "<tab>", ":bn<cr>", opts)
map("n", "<s-tab>", ":bp<cr>", opts)

-- 分屏
map(
  "n",
  "sl",
  ":set splitright<cr>:vsp<cr>",
  { desc = "竖向分屏，光标在右边", noremap = true, silent = true }
)
map(
  "n",
  "sh",
  ":set nosplitright<cr>:vsp<cr>",
  { desc = "竖向分屏，光标在左边", noremap = true, silent = true }
)
map("n", "sj", ":set splitbelow<cr>:sp<cr>", { desc = "横向分屏，光标在下边", noremap = true, silent = true })
map(
  "n",
  "sk",
  ":set nosplitbelow<cr>:sp<cr>",
  { desc = "竖向分屏，光标在上边", noremap = true, silent = true }
)
map("n", "sv", "<C-w>t<C-w>H", { desc = "横向分屏切换为竖向分屏", noremap = true, silent = true })
map("n", "sb", "<C-w>t<C-w>K", { desc = "竖向分屏切换为横向分屏", noremap = true, silent = true })

-- H -> ^ , L -> $
map({ "n", "v" }, "<s-h>", "^")
map({ "n", "v" }, "<s-l>", "$")

-- 取消搜索结果高亮
map("n", "<leader>h", ":nohl<cr>", { noremap = true, silent = true, desc = "取消搜索结果高亮" })

-- Resize window
map("n", "<M-up>", ":res +5<cr>", opts)
map("n", "<M-down>", ":res -5<cr>", opts)
map("n", "<M-left>", ":vertical resize-5<cr>", opts)
map("n", "<M-right>", ":vertical resize+5<cr>", opts)

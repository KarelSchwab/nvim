local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Exit insert mode
map("i", "jk", "<Esc>", opts)
map("t", "jk", "<C-\\><C-n>", opts)

-- Copy to clipboard
map("v", "<leader>y", '"+y', opts)
map("n", "<leader>Y", '"+yg_', opts)
map("n", "<leader>y", '"+y', opts)
map("n", "<leader>yy", '"+yy', opts)

-- Paste from clipboard
map("n", "<leader>p", '"+p', opts)
map("n", "<leader>P", '"+P', opts)
map("v", "<leader>p", '"+p', opts)
map("v", "<leader>P", '"+P', opts)

-- Navigating quickfix list
map("n", "<C-j>", "<cmd>cnext<CR>", opts)
map("n", "<C-k>", "<cmd>cprev<CR>", opts)

-- Navigating tabs
map("n", "<C-l>", "<cmd>tabnext<CR>", opts)
map("n", "<C-h>", "<cmd>tabprevious<CR>", opts)
map("n", "<C-A-h>", "<cmd>tabmove -<CR>", opts)
map("n", "<C-A-l>", "<cmd>tabmove +<CR>", opts)

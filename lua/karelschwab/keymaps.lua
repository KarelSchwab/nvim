local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

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
map("n", "<A-l>", "<cmd>cnext<CR>", opts)
map("n", "<A-h>", "<cmd>cprev<CR>", opts)

-- Easy split window navigation
map("n", "<C-j>", "<C-w><C-j>", opts)
map("n", "<C-k>", "<C-w><C-k>", opts)
map("n", "<C-h>", "<C-w><C-h>", opts)
map("n", "<C-l>", "<C-w><C-l>", opts)

-- Make splits the same size
map("n", "<leader>=", "<C-w>=", opts)

-- Resizing split windows
map("n", "<A-C-k>", "<C-w>5+", opts)
map("n", "<M-C-j>", "<C-w>5-", opts)
map("n", "<M-C-l>", "<C-w>5>", opts)
map("n", "<M-C-h>", "<C-w>5<", opts)

-- Move current line up or down
map("n", "<A-k>", "<cmd>move -2<CR>", opts)
map("n", "<A-j>", "<cmd>move +1<CR>", opts)

-- Lspsaga Mappings
map("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
map("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
map("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
map("n", "<leader>dl", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
map("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
map("n", "<leader>]", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
map("n", "<leader>[", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)

-- Telescope Mappings
map("n", "<leader>gf", ":Telescope git_files<CR>", opts)
map("n", "<leader>ff", ":Telescope find_files<CR>", opts)
map("n", "<leader>fb", ":Telescope file_browser<CR>", opts)
map("n", "<leader>lg", ":Telescope live_grep<CR>", opts)
map("n", "<leader>b", ":Telescope buffers<CR>", opts)
map("n", "<leader>q", ":Telescope quickfix<CR>", opts)

-- Telescope LSP Mappings
map("n", "gd", ":Telescope lsp_definitions<CR>", opts)
map("n", "gi", ":Telescope lsp_implementations<CR>", opts)
map("n", "gr", ":Telescope lsp_references<CR>", opts)
map("n", "gt", ":Telescope lsp_type_definitions<CR>", opts)
map("n", "gs", ":Telescope lsp_document_symbols<CR>", opts)

-- Harpoon Mappings
map("n", "<leader>a", '<cmd>lua require("harpoon.mark").add_file()<CR>', opts)
map("n", "<leader>hh", '<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>', opts)
map("n", "<leader>1", '<cmd>lua require("harpoon.ui").nav_file(1)<CR>', opts)
map("n", "<leader>2", '<cmd>lua require("harpoon.ui").nav_file(2)<CR>', opts)
map("n", "<leader>3", '<cmd>lua require("harpoon.ui").nav_file(3)<CR>', opts)
map("n", "<leader>4", '<cmd>lua require("harpoon.ui").nav_file(4)<CR>', opts)

map("n", "<leader>tt", '<cmd>lua require("harpoon.term").gotoTerminal(1)<CR>', opts)
map("n", "<leader>t2", '<cmd>lua require("harpoon.term").gotoTerminal(2)<CR>', opts)

-- Debugging
map("n", "<leader>b", ':lua require("dap").toggle_breakpoint()<CR>', opts)
map("n", "<F5>", ':lua require("dap").continue()<CR>', opts)
map("n", "<F1>", ':lua require("dap").step_into()<CR>', opts)
map("n", "<F2>", ':lua require("dap").step_over()<CR>', opts)
map("n", "<F3>", ':lua require("dap").step_out()<CR>', opts)

-- Dap
map("n", "<F12>", ':lua require("dapui").toggle()<CR>', opts)

-- Undotree
map("n", "<F6>", ":UndotreeToggle<CR>", opts)

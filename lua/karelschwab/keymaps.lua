local map = vim.keymap.set
local opts = {noremap = true, silent = true}

local telescope = require("telescope.builtin")

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
local term = require("harpoon.term")

local dap = require("dap")

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

-- Line movement Mappings
map("n", "<A-k>", "<cmd>move -2<CR>", opts)
map("n", "<A-j>", "<cmd>move +1<CR>", opts)

-- LSP Mappings
map("n", "K", vim.lsp.buf.hover, opts)
map("n", "<leader>rn", vim.lsp.buf.rename, opts)
map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
map("n", "gd", vim.lsp.buf.definition, opts)
map("n", "gD", vim.lsp.buf.declaration, opts)
map("n", "gi", vim.lsp.buf.implementation, opts)
map("n", "gh", vim.lsp.buf.signature_help, opts)

map("n", "<leader>d", vim.diagnostic.open_float, opts)
map("n", "<leader>]", vim.diagnostic.goto_next, opts)
map("n", "<leader>[", vim.diagnostic.goto_prev, opts)

-- Telescope Mappings
map("n", "<leader>gf", telescope.git_files, opts)
map("n", "<leader>ff", telescope.find_files, opts)
map("n", "<leader>lg", telescope.live_grep, opts)
map("n", "<leader>q", telescope.quickfix, opts)

-- Telescope LSP Mappings
map("n", "gr", telescope.lsp_references, opts)
map("n", "gs", telescope.lsp_document_symbols, opts)

-- Harpoon Mappings
map("n", "<leader>a", mark.add_file, opts)
map("n", "<leader>hh", ui.toggle_quick_menu, opts)
map("n", "<leader>1", function() ui.nav_file(1) end, opts)
map("n", "<leader>2", function() ui.nav_file(2) end, opts)
map("n", "<leader>3", function() ui.nav_file(3) end, opts)
map("n", "<leader>4", function() ui.nav_file(4) end, opts)

map("n", "<leader>tt", function() term.gotoTerminal(1) end, opts)
map("n", "<leader>t2", function() term.gotoTerminal(2) end, opts)

-- Undotree
map("n", "<F7>", vim.cmd.UndotreeToggle, opts)

-- Nvim-dap
map("n", "<leader>b", dap.toggle_breakpoint, opts)

map("n", "<F5>", dap.continue, opts)
map("n", "<F8>", dap.step_into, opts)
map("n", "<F9>", dap.step_over, opts)
map("n", "<F10>", dap.step_out, opts)

map("n", "<F1>", "", opts) -- TODO: Remove 

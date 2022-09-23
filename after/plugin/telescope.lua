local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

-- Telescope Mappings
map("n", "<leader>gf", ":Telescope git_files<CR>", opts)
map("n", "<leader>ff", ":Telescope find_files<CR>", opts)
map("n", "<leader>fb", ":Telescope file_browser<CR>", opts)
map("n", "<leader>lg", ":Telescope live_grep<CR>", opts)
map("n", "<leader>b", ":Telescope buffers<CR>", opts)
map("n", "<leader>q", ":Telescope quickfix<CR>", opts)
map("n", "<leader>d", ":Telescope diagnostics<CR>", opts)

-- Telescope LSP Mappings
map("n", "gd", ":Telescope lsp_definitions<CR>", opts)
map("n", "gi", ":Telescope lsp_implementations<CR>", opts)
map("n", "gr", ":Telescope lsp_references<CR>", opts)
map("n", "gt", ":Telescope lsp_type_definitions<CR>", opts)
map("n", "gs", ":Telescope lsp_document_symbols<CR>", opts)

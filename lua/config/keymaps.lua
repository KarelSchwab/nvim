local map = vim.keymap.set
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

-- Navigating tabs
map("n", "<C-l>", "<cmd>tabnext<CR>", opts)
map("n", "<C-h>", "<cmd>tabprevious<CR>", opts)

-- Line movement Mappings
map("n", "<A-k>", "<cmd>move -2<CR>", opts)
map("n", "<A-j>", "<cmd>move +1<CR>", opts)

map("n", "<C-A-h>", "<cmd>vertical resize -4<CR>", opts)
map("n", "<C-A-l>", "<cmd>vertical resize +4<CR>", opts)
map("n", "<C-A-j>", "<cmd>resize -4<CR>", opts)
map("n", "<C-A-k>", "<cmd>resize +4<CR>", opts)

-- LSP Mappings
map("n", "K", vim.lsp.buf.hover, opts)
map("n", "<leader>rn", vim.lsp.buf.rename, opts)
map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
map("n", "gd", vim.lsp.buf.definition, opts)
map("n", "gD", vim.lsp.buf.declaration, opts)
map("n", "gi", vim.lsp.buf.implementation, opts)
map("n", "gh", vim.lsp.buf.signature_help, opts)

map("n", "<leader>]", vim.diagnostic.goto_next, opts)
map("n", "<leader>[", vim.diagnostic.goto_prev, opts)

-- Nvim Tree
map("n", "<C-b>", "<cmd>:NvimTreeToggle<CR>", opts)

map("n", "gt", function()
  local params = vim.lsp.util.make_position_params()
  vim.lsp.buf_request(0, "textDocument/declaration", params, function(_, result, _, _)
    if not result or vim.tbl_isempty(result) then
      print("No declaration found")
      return
    end

    local uri = result[1].uri
    local range = result[1].range

    -- Convert LSP range to Vim-friendly values
    local line = range.start.line + 1
    local col = range.start.character + 1

    -- Open the file in a new tab and navigate to the position
    vim.cmd("tabnew " .. vim.uri_to_fname(uri))
    vim.api.nvim_win_set_cursor(0, { line, col })
  end)
end, opts)

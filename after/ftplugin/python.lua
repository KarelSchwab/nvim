local map = vim.keymap.set
local opts = {noremap = true, silent = true}

map("n", "<leader>dd", function()
    local current_indent = vim.fn.indent(vim.fn.line('.'))
    local indent_str = string.rep(' ', current_indent)
    vim.cmd("normal! o")
    vim.api.nvim_put({indent_str .. "breakpoint()"}, "", true, true)
end, opts)

map("n", "<leader>dc", function()
    local current_indent = vim.fn.indent(vim.fn.line('.'))
    local indent_str = string.rep(' ', current_indent)
    vim.cmd("normal! o")
    vim.api.nvim_put({indent_str .. "from celery.contrib import rdb; rdb.set_trace()"}, "", true, true)
end, opts)

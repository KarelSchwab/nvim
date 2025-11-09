return {
    'stevearc/conform.nvim',
    opts = {
        formatters_by_ft = {
            yaml = { "ansible-lint" },
            python = function(bufnr)
                if require("conform").get_formatter_info("ruff_format", bufnr).available then
                    return { "ruff_format" }
                else
                    return { "black" }
                end
            end,
        },
        formatters = {
            black = {
                prepend_args = { "--line-length", "120", "--target-version", "py310" },
            },
            ansible_lint = {
                prepend_args = { "--profile", "production" },
                args = { "--format", "full" },
            },
        },
        default_format_opts = {
            lsp_format = "fallback",
        },
        notify_on_error = true,
    },
}

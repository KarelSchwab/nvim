return {
    'stevearc/conform.nvim',
    opts = {
        formatters_by_ft = {
            python = { "black" },
        },
        formatters = {
            black = {
                prepend_args = { "--line-length", "120", "--target-version", "py310" },
            },
        },
    },
}

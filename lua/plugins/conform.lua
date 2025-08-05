return {
    'stevearc/conform.nvim',
    opts = {
        formatters_by_ft = {
            -- run Black (and only Black) on Python files.  You can prepend "isort"
            -- here if you also want your imports sorted.
            python = { "black" },
        },
        formatters = {
            black = {
                -- `inherit = true` (default) keeps the built-in args:
                -- { "--quiet", "-", "--stdin-filename", "$FILENAME" }
                -- We just tack on --line-length 120 in front of them.
                prepend_args = { "--line-length", "120", "--target-version", "py310" },
            },
        },
    },
}

return {
    "ya2s/nvim-cursorline",
    config = function ()
        require('nvim-cursorline').setup {
            cursorline = {
                enable = true,
                timeout = 10,
                number = false,
            },
            cursorword = {
                enable = true,
                min_length = 1,
                hl = { underline = true },
            }
        }
    end
}

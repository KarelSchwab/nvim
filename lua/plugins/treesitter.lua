return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    branch = "master",
    lazy = false,
    config = function ()
        require "nvim-treesitter.configs".setup {
            ensure_installed = "all",
            highlight = {
                enable = true
            },
            indent = {
                enable = false
            }
        }
    end
}

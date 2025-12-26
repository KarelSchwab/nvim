return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        options = {
            theme = "gruvbox-material",
        },
        sections = {
            lualine_c = {
                { "filename", path = 1 },
            },
        },
    }
}

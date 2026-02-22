return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        options = {
            -- theme = "gruvbox-material",
            theme = "everforest",
        },
        sections = {
            lualine_c = {
                { "filename", path = 1 },
            },
        },
    }
}

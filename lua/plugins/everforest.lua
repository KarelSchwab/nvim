return {
    "neanias/everforest-nvim",
    config = function ()
        local everforest = require("everforest")
        everforest.setup({
            background = "hard",
            italics = true,
            ui_contrast = "high",
        })
        everforest.load()
    end,
}

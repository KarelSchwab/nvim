return {
    "neanias/everforest-nvim",
    config = function ()
        local everforest = require("everforest")
        everforest.setup({
            background = "hard",
        })
        everforest.load()
    end,
}

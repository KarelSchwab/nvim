return {
    "neanias/everforest-nvim",
    config = function ()
        local everforest = require("everforest")
        everforest.setup({
            background = "hard",
            italics = true,
            ui_contrast = "high",
            diagnostic_text_highlight = true,
            diagnostic_line_highlight = true,
            inlay_hints_background = "dimmed",
        })
        everforest.load()
    end,
}

return {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
        require("copilot").setup({
            suggestion = {
                enabled = true,
                auto_trigger = true,
                keymap = {
                    accept = "<C-j>",
                    accept_word = false,
                    accept_line = false,
                    next = "<C-l>",
                    prev = "<M-h>",
                    dismiss = "<C-k>",
                },
            },
            panel = { enabled = false },
        })
    end,
}

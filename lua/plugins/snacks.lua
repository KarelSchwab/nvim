return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        indent = { enabled = true },
        words = { enabled = true },
        bigfile = { enabled = true },
        dashboard = { enabled = true },
        notifier = { enabled = true },
        quickfile = { enabled = true },
        statuscolumn = { enabled = true },
        scroll = { enabled = false },
        scope = { enabled = true },
        input = { enabled = true },
        picker = {
            enabled = true,
            sources = {
                explorer = {
                    layout = { layout = { position = "left" } },
                },
            },
        },
        zen = { enabled = false },
        terminal = { enabled = false },
    },
    keys = {
        -- Top Pickers & Explorer
        { "<leader>ff", function() Snacks.picker.smart({ filter = { cwd = true }, cwd = vim.fn.getcwd(), }) end,  desc = "Smart Find Files" },
        { "<leader>ft", function() Snacks.picker.tags() end,                                                      desc = "Search Tags" },
        { "<leader>/",  function() Snacks.picker.grep() end,                                                      desc = "Grep" },
        { "<leader>fe", function() Snacks.explorer() end,                                                         desc = "File Explorer" },

        -- Lsp
        { "gd",         function() Snacks.picker.lsp_definitions() end,                                           desc = "Goto Definition" },
        { "gr",         function() Snacks.picker.lsp_references() end,                                            nowait = true,                  desc = "References" },
        { "gy",         function() Snacks.picker.lsp_type_definitions() end,                                      desc = "Goto T[y]pe Definition" },
        { "<leader>ss", function() Snacks.picker.lsp_symbols() end,                                               desc = "LSP Symbols" },

        -- Git
        { "<leader>gb", function() Snacks.picker.git_branches() end,                                              desc = "Git Branches" },
        { "<leader>gL", function() Snacks.picker.git_log() end,                                                   desc = "Git Log" },
        { "<leader>gl", function() Snacks.picker.git_log_file() end,                                              desc = "Git Log File" },
        { "<leader>gB", function() Snacks.git.blame_line() end,                                                   desc = "Git Blame Line" },
        { "<leader>gq", function() Snacks.picker.qflist() end,                                                    desc = "Quickfix List" },

        -- Other Utilities
        { "<leader>.",  function() Snacks.scratch() end,                                                          desc = "Toggle Scratch Buffer" },
    }
}

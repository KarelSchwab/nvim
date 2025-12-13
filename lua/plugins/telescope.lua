return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local telescope = require("telescope")
        telescope.setup({
            extensions = {
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = "smart_case",
                }
            },
            sorting_strategy = "ascending",
        })

        local builtin = require("telescope.builtin")
        local opts = { noremap = true, silent = true }
        local map = vim.keymap.set

        -- Telescope Navigation Mappings
        map("n", "<leader>ff", builtin.find_files, opts)
        map("n", "<leader>lg", builtin.live_grep, opts)
        map("n", "<leader>q", builtin.quickfix, opts)

        -- Telescope LSP Mappings
        map("n", "gd", builtin.lsp_definitions, opts)
        map("n", "gr", builtin.lsp_references, opts)

        -- Telescope Git Mappings
        map("n", "<leader>gf", builtin.git_files, opts)
        map("n", "<leader>gc", builtin.git_commits, opts)
        map("n", "<leader>gb", builtin.git_branches, opts)
        map("n", "<leader>gs", builtin.git_status, opts)
        map("n", "<leader>gr", builtin.git_bcommits_range, opts)

        -- Telescope Tags Mappings
        map("n", "<leader>ft", builtin.tags, opts)

        require('telescope').load_extension('fzf')
    end,
}

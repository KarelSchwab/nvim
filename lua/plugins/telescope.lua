return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    extensions = {
        fzf = {
        fuzzy = true,                    -- false will only do exact matching
        override_generic_sorter = true,  -- override the generic sorter
        override_file_sorter = true,     -- override the file sorter
        case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
    }
  },
    config = function() 
        local builtin = require("telescope.builtin")
        local opts = { noremap = true, silent = true }
        local map = vim.keymap.set

        map("n", "<leader>gf", builtin.git_files, opts)
        map("n", "<leader>ff", builtin.find_files, opts)
        map("n", "<leader>lg", builtin.live_grep, opts)
        map("n", "<leader>q", builtin.quickfix, opts)

        -- Telescope LSP Mappings
        map("n", "gr", builtin.lsp_references, opts)
        map("n", "gs", builtin.lsp_document_symbols, opts)

        map("n", "<leader>ft", function()
          builtin.tags {
            prompt_title = "Tags (project)",
            show_line    = true,      -- preview the line of each tag
          }
        end, { desc = "[F]ind [T]ags" })

        require('telescope').load_extension('fzf')
    end,
    sorting_strategy = "ascending",
    windblend = 10,
}

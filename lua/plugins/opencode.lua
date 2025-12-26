return {
    "NickvanDyke/opencode.nvim",
    dependencies = {
        ---@module 'snacks'
        { "folke/snacks.nvim", opts = { input = {}, picker = {}, terminal = {} } },
    },
    config = function()
        ---@type opencode.Opts
        vim.g.opencode_opts = {
            -- Your configuration, if any — see `lua/opencode/config.lua`, or "goto definition".
        }


        vim.o.autoread = true

        vim.keymap.set({ "n", "x" }, "<C-a>", function() require("opencode").ask("@this: ", { submit = true }) end,
            { desc = "Ask opencode" })
        vim.keymap.set({ "n", "x" }, "<C-x>", function() require("opencode").select() end,
            { desc = "Execute opencode action…" })
        vim.keymap.set({ "n", "x" }, "ga", function() require("opencode").prompt("@this") end,
            { desc = "Add to opencode" })
    end,
}

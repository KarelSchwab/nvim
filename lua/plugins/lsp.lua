return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "saghen/blink.cmp",
            {
                "folke/lazydev.nvim",
                ft = "lua",
                opts = {
                    library = {
                        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                    },
                },
            },
        },

        config = function()
            require("mason").setup()

            local capabilities = require('blink.cmp').get_lsp_capabilities()

            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "pyright", "gopls" },
                handlers = {
                    function(server_name)
                        require("lspconfig")[server_name].setup({
                            capabilities = capabilities,
                        })
                    end,
                },
            })

            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(ev)
                    local opts = { buffer = ev.buf }

                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
                    vim.keymap.set("n", "<leader>]", function() vim.diagnostic.jump({ count = 1, float = true }) end,
                        opts)
                    vim.keymap.set("n", "<leader>[", function() vim.diagnostic.jump({ count = -1, float = true }) end,
                        opts)

                    local function smart_definition(cmd)
                        vim.lsp.buf.definition({
                            on_list = function(options)
                                if #options.items == 0 then
                                    vim.notify("No definition found", vim.log.levels.WARN)
                                    return
                                end
                                if #options.items > 1 then
                                    Snacks.picker.lsp_definitions()
                                    return
                                end

                                local item = options.items[1]
                                if cmd then vim.cmd(cmd .. " " .. item.filename) end

                                vim.api.nvim_win_set_cursor(0, { item.lnum, item.col - 1 })
                                vim.cmd("normal! zz")
                            end,
                        })
                    end

                    vim.keymap.set("n", "gt", function() smart_definition("tabnew") end,
                        { buffer = ev.buf, desc = "Go to definition in new tab" })
                    vim.keymap.set("n", "gv", function() smart_definition("vsplit") end,
                        { buffer = ev.buf, desc = "Go to definition in vertical split" })
                    vim.keymap.set("n", "gs", function() smart_definition("split") end,
                        { buffer = ev.buf, desc = "Go to definition in split" })
                end,
            })
        end,
    }
}

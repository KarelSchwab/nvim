return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",

        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",

        {
            "L3MON4D3/LuaSnip",
            dependencies = {
                "rafamadriz/friendly-snippets",
            },
            version = "2.*",
            build = "make install_jsregexp",
        },
        "saadparwaiz1/cmp_luasnip",

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
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "pyright",
                "gopls",
            },
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
                -- Helper function to define mappings easily
                local opts = { buffer = ev.buf }

                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
                vim.keymap.set("n", "<leader>]", function() vim.diagnostic.jump({ count = 1, float = true }) end, opts)
                vim.keymap.set("n", "<leader>[", function() vim.diagnostic.jump({ count = -1, float = true }) end, opts)

                vim.keymap.set("n", "gt", function()
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
                            vim.cmd("tabnew")
                            vim.cmd("edit " .. item.filename)

                            vim.api.nvim_win_set_cursor(0, { item.lnum, item.col - 1 })
                            vim.cmd("normal! zz")
                        end,
                    })
                end, { buffer = ev.buf, desc = "Go to definition in new tab" })

                vim.keymap.set("n", "gv", function()
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
                            vim.cmd("vsplit " .. item.filename)

                            vim.api.nvim_win_set_cursor(0, { item.lnum, item.col - 1 })
                            vim.cmd("normal! zz")
                        end,
                    })
                end, { buffer = ev.buf, desc = "Go to definition in vertical split" })

                vim.keymap.set("n", "gs", function()
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
                            vim.cmd("split " .. item.filename)

                            vim.api.nvim_win_set_cursor(0, { item.lnum, item.col - 1 })
                            vim.cmd("normal! zz")
                        end,
                    })
                end, { buffer = ev.buf, desc = "Go to definition in split" })
            end,
        })

        local cmp = require("cmp")
        local luasnip = require("luasnip")

        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "path" },
            }, {
                { name = "buffer" },
            }),
        })

        cmp.setup.cmdline("/", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = { { name = "buffer" } }
        })

        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "path" }
            }, {
                { name = "cmdline" }
            })
        })
    end,
}

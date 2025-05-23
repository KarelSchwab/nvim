return {
    "mhartington/formatter.nvim",
    config = function ()
        require("formatter").setup(
            {
                filetype = {
                    javascript = {
                        function()
                            return {
                                exe = "prettier",
                                args = {
                                    "--stdin-filepath",
                                    vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
                                    "--double-quote",
                                    "--use-tabs"
                                },
                                stdin = true
                            }
                        end
                    },
                    typescript = {
                        -- prettier
                        function()
                            return {
                                exe = "prettier",
                                args = {
                                    "--stdin-filepath",
                                    vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
                                    "--double-quote",
                                    "--use-tabs"
                                },
                                stdin = true
                            } end
                    },
                    json = {
                        function()
                            return {
                                exe = "prettier",
                                args = {
                                    "--stdin-filepath",
                                    vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
                                    "--double-quote",
                                    "--use-tabs"
                                },
                                stdin = true
                            }
                        end
                    },
                    python = {
                        function()
                            return {
                                exe = "black",
                                args = {
                                    "--line-length 120 --target-version=py310",
                                    vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))
                                },
                                stdin = false
                            }
                        end
                    },
                    lua = {
                        function()
                            return {
                                exe = "luafmt",
                                args = {"--indent-count", 4, "--stdin"},
                                stdin = true
                            }
                        end
                    },
                }
            }
        )
    end
}

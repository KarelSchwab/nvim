local cmp = require("cmp")

local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed(
    {
        "clangd",
        "rust_analyzer",
        "tsserver",
        "bashls",
        "cssls",
        "dockerls",
        "emmet_ls",
        "jsonls",
        "sqlls",
        "svelte",
        "tailwindcss",
        "jedi_language_server",
        "cssmodules_ls",
        "astro",
        "html",
        "jdtls",
        "volar"
    }
)

lsp.nvim_workspace()

lsp.setup_nvim_cmp(
    {
        preselect = "none",
        completion = {
            completeopt = "menu,menuone,noinsert,noselect"
        },
        sources = {
            {name = "nvim_lsp"},
            {name = "luasnip"},
            {name = "buffer"}
        },
        mapping = cmp.mapping.preset.insert(
            {
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({select = true})
            }
        ),
        formatting = {
            fields = {"abbr", "kind", "menu"}
        }
    }
)

lsp.setup()

-- `/` cmdline setup.
cmp.setup.cmdline(
    "/",
    {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            {name = "buffer"}
        }
    }
)

-- `:` cmdline setup.
cmp.setup.cmdline(
    ":",
    {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources(
            {
                {name = "path"},
                {name = "cmdline"}
            }
        )
    }
)

-- Setup lspconfig.
-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true
--
-- local on_att = function(_) --client
-- end
--
-- local lsp_list = {
--     "clangd",
--     "rust_analyzer",
--     "tsserver",
--     "bashls",
--     "cssls",
--     "dockerls",
--     "emmet_ls",
--     "jsonls",
--     "sqlls",
--     "svelte",
--     "tailwindcss",
--     "jedi_language_server",
--     "cssmodules_ls",
--     "gopls",
--     "astro",
--     "html",
--     "jdtls"
-- }
--
-- for _, lsp in pairs(lsp_list) do
--     require("lspconfig")[lsp].setup {
--         capabilities = capabilities,
--         on_attach = on_att
--     }
-- end

-- local function get_typescript_server_path(root_dir)
--     local util = require "lspconfig.util"
--     local project_root = util.find_node_modules_ancestor(root_dir)
--     local local_tsserverlib =
--         project_root ~= nil and util.path.join(project_root, "node_modules", "typescript", "lib", "tsserverlibrary.js")
--     local global_tsserverlib = "/home/karel/.npm-packages/lib/node_modules/typescript/lib/tsserver,js"
--
--     if local_tsserverlib and util.path.exists(local_tsserverlib) then
--         return local_tsserverlib
--     else
--         return global_tsserverlib
--     end
-- end

-- TODO: Fix if this does not work
-- require("lspconfig")["volar"].setup {
--     capabilities = capabilities,
--     config = {
--         on_new_config = function(new_config, new_root_dir)
--             new_config.init_options.typescript.serverPath = get_typescript_server_path(new_root_dir)
--         end
--     },
--     on_attach = on_att
-- }

-- require("lspconfig")["sumneko_lua"].setup {
--     capabilities = capabilities,
--     on_attach = on_att,
--     settings = {
--         Lua = {
--             runtime = {
--                 -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
--                 version = "LuaJIT"
--             },
--             diagnostics = {
--                 -- Get the language server to recognize the `vim` global
--                 globals = {"vim"}
--             },
--             workspace = {
--                 -- Make the server aware of Neovim runtime files
--                 library = vim.api.nvim_get_runtime_file("", true)
--             },
--             -- Do not send telemetry data containing a randomized but unique identifier
--             telemetry = {
--                 enable = false
--             }
--         }
--     }
-- }

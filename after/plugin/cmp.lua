local cmp = require("cmp")

local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed(
    {
        "clangd",
        "rust_analyzer",
        "tsserver",
        "bashls",
        "dockerls",
        "jsonls",
        "html",
    }
)

lsp.nvim_workspace()

lsp.setup_nvim_cmp(
    {
        preselect = "none",
        completion = {
            completeopt = "menu,menuone,noinsert,noselect"
        },
        settings = {
            offset_encoding = "utf-8"
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


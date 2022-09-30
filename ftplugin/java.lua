local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local home = os.getenv("HOME")

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

local config = {
    cmd = {
        "java",
        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.protocol=true",
        "-Dlog.level=ALL",
        "-Xms1g",
        "--add-modules=ALL-SYSTEM",
        "--add-opens",
        "java.base/java.util=ALL-UNNAMED",
        "--add-opens",
        "java.base/java.lang=ALL-UNNAMED",
        "-jar",
        home .. "/.local/bin/jdt-language-server/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar",
        "-configuration",
        home .. "/.local/bin/jdt-language-server/config_linux",
        "-data",
        vim.fn.expand("~/.cache/jdtls-workspace") .. project_name
    },
    capabilities = capabilities,
    root_dir = require("jdtls.setup").find_root({".git", "mvnw", "gradlew", "pom.xml"}),
    settings = {
        java = {}
    },
    init_options = {
        bundles = {}
    }
}

require("jdtls").start_or_attach(config)

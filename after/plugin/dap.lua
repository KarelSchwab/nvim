require("nvim-dap-virtual-text").setup({})
require("dapui").setup()
require("dap-python").setup("~/.python_envs/debugpy/bin/python3")

-- TODO: FIXME
-- local dap = require("dap")
-- dap.adapters.codelldb = {
--     type = "server",
--     port = "${port}",
--     executable = {
--         command = "/home/karel/.vscode/extensions/vadimcn.vscode-lldb-1.7.4/adapter/codelldb",
--         args = {"--port", "${port}"}
--     }
-- }
--
-- dap.configurations.rust = {
--     {
--         name = "Launch",
--         type = "codelldb",
--         request = "launch",
--         program = function()
--             --vim.fn.system("cargo build")
--             return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
--         end,
--         cwd = "${workspaceFolder}",
--         stopOnEntry = false
--     },
--     {
--         type = "codelldb",
--         request = "attach",
--         name = "Attach",
--         processId = require("dap.utils").pick_process,
--         cwd = "${workspaceFolder}"
--     }
-- }
-- dap.configurations.cpp = {
--     {
--         name = "Launch",
--         type = "codelldb",
--         request = "launch",
--         program = function()
--             return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
--         end,
--         cwd = "${workspaceFolder}",
--         stopOnEntry = false
--     }
-- }
-- dap.configurations.c = dap.configurations.cpp

require("dap-vscode-js").setup(
    ---@diagnostic disable-next-line: param-type-mismatch
    {
        adapters = {"pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost"}
    }
)

for _, language in ipairs({"typescript", "javascript"}) do
    require("dap").configurations[language] = {
        {
            type = "pwa-node",
            request = "launch",
            name = "Launch file",
            program = "${file}",
            cwd = "${workspaceFolder}",
            runtimeArgs = {"-r", "ts-node/register"}
        },
        {
            type = "pwa-node",
            request = "attach",
            name = "Attach",
            processId = require("dap.utils").pick_process,
            cwd = "${workspaceFolder}"
        }
        -- {
        --     type = "pwa-node",
        --     request = "launch",
        --     name = "Debug Jest Tests",
        --     -- trace = true, -- include debugger info
        --     runtimeExecutable = "node",
        --     runtimeArgs = {
        --         "./node_modules/jest/bin/jest.js",
        --         "--runInBand"
        --     },
        --     rootPath = "${workspaceFolder}",
        --     cwd = "${workspaceFolder}",
        --     console = "integratedTerminal",
        --     internalConsoleOptions = "neverOpen"
        -- }
    }
end

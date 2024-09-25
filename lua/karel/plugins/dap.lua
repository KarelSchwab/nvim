return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "mfussenegger/nvim-dap-python",
        "theHamsta/nvim-dap-virtual-text",
    },
    config = function()
        local opts = { noremap = true, silent = true }
        local map = vim.keymap.set

        require("nvim-dap-virtual-text").setup()
        require("dap-python").setup("python3")

        local dap, dapui = require("dap"), require("dapui")

        table.insert(dap.configurations.python, {
            type = 'python',
            request = 'launch',
            name = 'Debug Django',
            program = vim.loop.cwd() .. '/manage.py',
            args = {'runserver', '--noreload'},
            justMyCode = true,
            django = true,
            console = "integratedTerminal",
        })

        -- DapUI
        dapui.setup()
        dap.listeners.after.event_initialized["dapui_config"] = function()
          dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
          dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
          dapui.close()
        end

        -- Keymaps
        map("n", "<leader>b", dap.toggle_breakpoint, opts)
        map("n", "<F5>", dap.continue, opts)
        map("n", "<F8>", dap.step_into, opts)
        map("n", "<F9>", dap.step_over, opts)
        map("n", "<F10>", dap.step_out, opts)
    end
}

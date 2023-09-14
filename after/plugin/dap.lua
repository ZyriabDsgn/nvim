local dap = require("dap")
local dapui = require("dapui")
local dap_vscode_js = require("dap-vscode-js")


dapui.setup()

-- JS/TS
-- See: https://github.com/mxsdev/nvim-dap-vscode-js
dap_vscode_js.setup({
    -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
    debugger_path = vim.fn.stdpath "data" .. "/lazy/vscode-js-debug",
    -- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
    adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
    -- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
    -- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
    -- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
})

-- See: https://www.lazyvim.org/extras/lang/typescript#nvim-dap
if not dap.adapters["pwa-node"] then
    dap.adapters["pwa-node"] = {
        type = "server",
        host = "localhost",
        port = "${port}",
        executable = {
            command = "node",
            -- 💀 Make sure to update this path to point to your installation
            args = {
                vim.fn.stdpath "data" .. "/lazy/vscode-js-debug",
                "${port}",
            },
        }
    }
end

for _, language in ipairs({ "typescript", "javascript" }) do
    dap.configurations[language] = {
        -- NODE
        {
            type = "pwa-node",
            request = "launch",
            name = "Launch file",
            program = "${file}",
            cwd = "${workspaceFolder}",
        },
        {
            type = "pwa-node",
            request = "attach",
            name = "Attach",
            processId = require 'dap.utils'.pick_process,
            cwd = "${workspaceFolder}",
        },
        -- ENDOF NODE
        -- JEST
        {
            type = "pwa-node",
            request = "launch",
            name = "Debug Jest Tests",
            -- trace = true, -- include debugger info
            runtimeExecutable = "node",
            runtimeArgs = {
                "./node_modules/jest/bin/jest.js",
                "--runInBand",
            },
            rootPath = "${workspaceFolder}",
            cwd = "${workspaceFolder}",
            console = "integratedTerminal",
            internalConsoleOptions = "neverOpen",
        }
        -- ENDOF JEST
    }
end

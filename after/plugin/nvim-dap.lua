local Remap = require("restart.keymap")
local nnoremap = Remap.nnoremap

local status, dap = pcall(require, "dap")
if not status then
  vim.notify("not found nvim-dap")
  return
end

local vscodeStatus, dapVscode = pcall(require, "dap-vscode-js")
if not vscodeStatus then
  vim.notify("not found dap-vscode-js")
  return
end

local uiStatus, dapui = pcall(require, "dapui")
if not uiStatus then
  vim.notify("not found dapui")
  return
end
local widgets = require('dap.ui.widgets')

local opts = { silent = true }
nnoremap("<A-;>", function () dap.toggle_breakpoint() end, opts)
nnoremap("<A-,>", function () dap.continue() end, opts)
nnoremap("<A-[>", function () dap.step_into() end, opts)
nnoremap("<A-]>", function () dap.step_over() end, opts)
nnoremap('<F5>', function () widgets.hover() end, opts)
nnoremap('<F6>', function () widgets.centered_float(widgets.scopes) end, opts)
nnoremap('<F12>', function () dap.step_out() end, opts)

dapVscode.setup({
  -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
  debugger_path = os.getenv('HOME') .. "/dev/vscode-js-debug", -- Path to vscode-js-debug installation.
  -- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
  adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
  log_file_path = "/tmp/dap_vscode_js.log", -- Path for file logging
  log_file_level = 1, -- Logging level for output to file. Set to false to disable file logging.
  log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
})

for _, language in ipairs({ "typescript", "javascript" }) do
  dap.configurations[language] = {
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
      processId = require'dap.utils'.pick_process,
      cwd = "${workspaceFolder}",
    }
  }
end

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

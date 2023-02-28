local Remap = require("restart.keymap")
local nnoremap = Remap.nnoremap

local status, dap = pcall(require, "dap")
if not status then
  vim.notify("not found nvim-dap")
  return
end

local opts = { silent = true }
nnoremap("<A-;>", function () dap.toggle_breakToggle() end, opts)
nnoremap("<A-,>", function () dap.continue() end, opts)
nnoremap("<A-[>", function () dap.step_into() end, opts)
nnoremap("<A-]>", function () dap.step_over() end, opts)

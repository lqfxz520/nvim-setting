local status, smartSplit = pcall(require, "telescope")
if not status then
  vim.notify("not found smart-split")
  return
end
local Remap = require("restart.keymap")
local nnoremap = Remap.nnoremap

smartSplit.setup{}


nnoremap('<C-h>', require('smart-splits').move_cursor_left)
nnoremap('<C-j>', require('smart-splits').move_cursor_down)
nnoremap('<C-k>', require('smart-splits').move_cursor_up)
nnoremap('<C-l>', require('smart-splits').move_cursor_right)
nnoremap('<A-h>', require('smart-splits').resize_left)
nnoremap('<A-j>', require('smart-splits').resize_down)
nnoremap('<A-k>', require('smart-splits').resize_up)
nnoremap('<A-l>', require('smart-splits').resize_right)

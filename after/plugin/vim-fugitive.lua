local Remap = require("restart.keymap")
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap

nnoremap('<leader>gs', '<Cmd>G<CR>')
nnoremap('<leader>gh', ':diffget //3<CR>')
nnoremap('<leader>gu', ':diffget //2<CR>')

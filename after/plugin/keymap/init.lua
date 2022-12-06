local Remap = require("restart.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local xnoremap = Remap.xnoremap

local opt = { silent = true }
nnoremap('<leader>h', '<C-w>h', opt)
nnoremap('<leader>j', '<C-w>j', opt)
nnoremap('<leader>k', '<C-w>k', opt)
nnoremap('<leader>l', '<C-w>l', opt)
nnoremap('[c', '<Cmd>cprevious<CR>', opt)
nnoremap(']c', '<Cmd>cnext<CR>', opt)
nnoremap('<A-s>', ':w<CR>', opt)
nnoremap('[<space>', ':<C-U>put! =repeat(nr2char(10), v:count1)<CR>`[', opt)
nnoremap(']<space>', ':<C-U>put =repeat(nr2char(10), v:count1)<CR>', opt)
vnoremap('<leader>d', '"_d', opt)
nnoremap("<leader>y", "\"+y")
vnoremap("<leader>y", "\"+y")
xnoremap("<leader>p", "\"_dP")
nnoremap('x', '"_x', opt)
vnoremap('x', '"_x', opt)

vnoremap('J', ":m'>+1<CR>gv=gv", opt)
vnoremap('K', ":m '<-2<CR>gv=gv", opt)

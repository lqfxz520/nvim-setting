local Remap = require("restart.keymap")
local nnoremap = Remap.nnoremap
local bufferline = require('bufferline')

bufferline.setup{
  options = {
    mode = 'tabs',
    separator_style = 'slant',
    diagnostics = 'coc',
    -- sort_by = 'insert_at_end',
    offsets = {
      {
        filetype = "coc-explorer",
        text = function() return vim.fn.getcwd() end,
        text_align = "left",
        highlight = "Directory",
        separator = true
      }
    },
  }
}

nnoremap('<A-1>', '<Cmd>BufferLineGoToBuffer 1<CR>')
nnoremap('<A-2>', '<Cmd>BufferLineGoToBuffer 2<CR>')
nnoremap('<A-3>', '<Cmd>BufferLineGoToBuffer 3<CR>')
nnoremap('<A-4>', '<Cmd>BufferLineGoToBuffer 4<CR>')
nnoremap('<A-5>', '<Cmd>BufferLineGoToBuffer 5<CR>')
nnoremap('<A-6>', '<Cmd>BufferLineGoToBuffer 6<CR>')
nnoremap('<A-7>', '<Cmd>BufferLineGoToBuffer 7<CR>')
nnoremap('<A-8>', '<Cmd>BufferLineGoToBuffer 8<CR>')
nnoremap('<leader>;', '<Cmd>BufferLinePick<CR>')
nnoremap('Q', function() vim.cmd('bdelete %') end, { silent = true })

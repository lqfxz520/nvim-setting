vim.o.updatetime = 100
vim.o.noswapfile = true
vim.o.list = true
vim.o.listchars = 'nbsp:█,tab:> ,trail:·,eol:↴'
vim.o.clipboard = 'unnamedplus'
vim.o.wrap = false
vim.o.backup = false
vim.o.writebackup = false
vim.o.undofile = true
vim.o.termguicolors = true
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.updateTime = 300
vim.o.relativenumber = true
vim.o.mouse = 'nv'
vim.o.signcolumn = 'yes'
vim.o.autoindent = true
vim.o.smartindent = true
vim.g.mapleader = ' '
vim.o.pumheight = 20
vim.g.coc_global_extensions = {
  'coc-explorer',
  'coc-json',
  'coc-tsserver',
  'coc-eslint',
  'coc-prettier',
  'coc-yank',
  'coc-fzf-preview',
  '@yaegassy/coc-volar',
  'coc-pairs'
}

vim.keymap.set('n', '<leader>h', '<C-w>h', {})
vim.keymap.set('n', '<leader>j', '<C-w>j', {})
vim.keymap.set('n', '<leader>k', '<C-w>k', {})
vim.keymap.set('n', '<leader>l', '<C-w>l', {})
vim.keymap.set('n', '[c', '<Cmd>cprevious<CR>', {})
vim.keymap.set('n', ']c', '<Cmd>cnext<CR>', {})
vim.keymap.set('n', '<A-s>', ':w<CR>', { silent = true, noremap = true })
vim.keymap.set('n', '[<space>', ':<C-U>put! =repeat(nr2char(10), v:count1)<CR>`[', { silent = true, noremap = true })
vim.keymap.set('n', ']<space>', ':<C-U>put =repeat(nr2char(10), v:count1)<CR>', { silent = true, noremap = true })
vim.keymap.set('i', '<CR>', '<C-g>u<CR><c-r>=coc#on_enter()<CR>', { silent = true, noremap = true, expr = false })

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
vim.o.number = true
vim.o.mouse = 'nv'
vim.o.signcolumn = 'yes'
vim.o.autoindent = true
vim.o.smartindent = true
vim.g.mapleader = ' '
vim.o.cursorline = true
vim.o.scrolloff = '8'

vim.o.foldcolumn = '0' -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

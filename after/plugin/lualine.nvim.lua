require('lualine').setup {
  options = {
    disabled_filetypes = { 'coc-explorer' }
  },
  sections = { lualine_c = { { 'filename', path = 1 } } }
}

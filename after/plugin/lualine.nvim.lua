require('lualine').setup {
  options = {
    ignore_focus = { 'coc-explorer' }
  },
  sections = {
    lualine_a = { 'g:coc_status', 'mode' },
    lualine_c = { { 'filename', path = 1 } }
  }
}

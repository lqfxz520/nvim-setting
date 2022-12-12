require('nvim-treesitter.configs').setup({
  ensure_installed = { 'lua', 'typescript', 'vue', 'css', 'scss', 'html', 'javascript', 'tsx' },
  highlight = { enable = true },
  context_commentstring = { enable = true },
  indent = { enable = true },
  matchup = { enable = true },
})

vim.g.matchup_matchparen_offscreen = { method = 'popup', highlight = 'Normal', fullwidth = 1 }

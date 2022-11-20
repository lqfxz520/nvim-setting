-- place this in one of your configuration file(s)
local hop = require('hop')
local directions = require('hop.hint').HintDirection

hop.setup {
  case_insensitive = true,
  char2_fallback_key = '<CR>'
}

vim.keymap.set({ "n", "v", "o" }, "f", "", {
  silent = true,
  noremap = true,
  callback = function()
    hop.hint_char2()
  end,
  desc = "nvim-hop char2",
})

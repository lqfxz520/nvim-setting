vim.keymap.set(
  "c",
  "<S-Enter>",
  function() require("noice").redirect(vim.fn.getcmdline()) end,
  { desc = "Redirect Cmdline" }
)

require("noice").setup({
  -- add any options here
  -- cmdline = {
  --   format = {
  --     cmdline = { view = 'cmdline_popup', pattern = "^:", icon = "", lang = "vim" },
  --   }
  -- }
})

local status, indent_blankline = pcall(require, "indent_blankline")
if not status then
  vim.notify("not found indent_blankline")
  return
end
local api = vim.api
local exclude_ft = { "help", "coc-explorer" }

indent_blankline.setup({
  char = "│",
  filetype_exclude = exclude_ft
})

local gid = api.nvim_create_augroup("indent_blankline", { clear = true })
api.nvim_create_autocmd("InsertEnter", {
  pattern = "*",
  group = gid,
  command = "IndentBlanklineDisable",
})

api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  group = gid,
  callback = function()
    if not vim.tbl_contains(exclude_ft, vim.bo.filetype) then
      vim.cmd([[IndentBlanklineEnable]])
    end
  end,
})

local Remap = require("restart.keymap")
local nnoremap = Remap.nnoremap

local status, telescope = pcall(require, "telescope")
if not status then
  vim.notify("not found telescope")
  return
end

telescope.setup({
  pickers = {
    -- Built-in pickers configuration
    find_files = {
      -- Find files for skinning, supported parameters are: dropdown, cursor, ivy
      -- theme = "dropdown",
    },
  },
  extensions = {
    -- Extensions
  },
})

local project_files = function()
  local opts = {}
  vim.fn.system('git rev-parse --is-inside-work-tree')
  if vim.v.shell_error == 0 then
    require "telescope.builtin".git_files(opts)
  else
    require "telescope.builtin".find_files(opts)
  end
end

-- call via:
-- :lua require"telescope-config".project_files()

-- example keymap:
-- vim.api.nvim_set_keymap("n", "<Leader><Space>", "<CMD>lua require'telescope-config'.project_files()<CR>", {noremap = true, silent = true})




-- Multiplexing opt parameters
local opt = { silent = true }

-- find files
nnoremap("<C-p>", function() project_files() end, opt)
-- Global search
nnoremap("<leader>fgr", ":Telescope live_grep<CR>", opt)

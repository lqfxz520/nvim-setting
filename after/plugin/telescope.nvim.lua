local Remap = require("restart.keymap")
local nnoremap = Remap.nnoremap

local status, telescope = pcall(require, "telescope")
if not status then
  vim.notify("not found telescope")
  return
end

local previews = require('telescope.previewers')
local _bad = { '.*%.min' }
local bad_files = function(filepath)
  for _, v in ipairs(_bad) do
    if filepath:match(v) then
      return true
    end
  end

  return false
end
local new_maker = function(filepath, bufnr, opts)
  opts = opts or {}
  if bad_files(filepath) then
    return
  end
  filepath = vim.fn.expand(filepath)
  vim.loop.fs_stat(filepath, function(_, stat)
    if not stat then return end
    if stat.size > 100000 then
      return
    else
      previews.buffer_previewer_maker(filepath, bufnr, opts)
    end
  end)
end
telescope.setup({
  defaults = {
    buffer_previewer_maker = new_maker
  },
  pickers = {
    -- Built-in pickers configuration
    find_files = {
      -- Find files for skinning, supported parameters are: dropdown, cursor, ivy
      -- theme = "dropdown",
    },
  },
  extensions = {
    -- Extensions
    file_browser = {
      theme = "dropdown",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          -- your custom normal mode mappings
        },
      },
    }
  },
})

telescope.load_extension "file_browser"

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
nnoremap("<leader>pb", ":Telescope buffers<CR>", opt)
nnoremap("<leader>ff", function()
  telescope.extensions.file_browser.file_browser({
    path = "%:p:h",
    grouped = true,
    previewer = false,
    layout_config = { height = 40 },
    initial_mode = "normal"
  })
end)

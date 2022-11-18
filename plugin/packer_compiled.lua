-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/lqf/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/lqf/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/lqf/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/lqf/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/lqf/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ale = {
    commands = { "ALEEnable" },
    config = { "vim.cmd[[ALEEnable]]" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/lqf/.local/share/nvim/site/pack/packer/opt/ale",
    url = "https://github.com/w0rp/ale"
  },
  ["auto-session"] = {
    config = { "\27LJ\2\n½\1\0\0\4\0\n\0\r6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\4\0'\2\5\0B\0\2\0029\0\6\0005\2\b\0005\3\a\0=\3\t\2B\0\2\1K\0\1\0\31auto_session_suppress_dirs\1\0\0\1\2\0\0\6~\nsetup\17auto-session\frequire0curdir,folds,help,tabpages,terminal,winsize\19sessionoptions\bopt\bvim\0" },
    loaded = true,
    path = "/home/lqf/.local/share/nvim/site/pack/packer/start/auto-session",
    url = "https://github.com/rmagatti/auto-session"
  },
  ["bufferline.nvim"] = {
    config = { "\27LJ\2\n%\0\0\2\0\3\0\0046\0\0\0009\0\1\0009\0\2\0D\0\1\0\vgetcwd\afn\bvim-\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\14bdelete %\bcmd\bvim¤\6\1\0\b\0 \0P6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\b\0005\4\3\0004\5\3\0005\6\4\0003\a\5\0=\a\6\6>\6\1\5=\5\a\4=\4\t\3B\1\2\0015\1\n\0006\2\v\0009\2\f\0029\2\r\2'\4\14\0'\5\15\0'\6\16\0\18\a\1\0B\2\5\0016\2\v\0009\2\f\0029\2\r\2'\4\14\0'\5\17\0'\6\18\0\18\a\1\0B\2\5\0016\2\v\0009\2\f\0029\2\r\2'\4\14\0'\5\19\0'\6\20\0\18\a\1\0B\2\5\0016\2\v\0009\2\f\0029\2\r\2'\4\14\0'\5\21\0'\6\22\0\18\a\1\0B\2\5\0016\2\v\0009\2\f\0029\2\r\2'\4\14\0'\5\23\0'\6\24\0\18\a\1\0B\2\5\0016\2\v\0009\2\f\0029\2\r\2'\4\14\0'\5\25\0'\6\26\0\18\a\1\0B\2\5\0016\2\v\0009\2\f\0029\2\r\2'\4\14\0'\5\27\0'\6\28\0\18\a\1\0B\2\5\0016\2\v\0009\2\f\0029\2\r\2'\4\14\0'\5\29\0003\6\30\0005\a\31\0B\2\5\1K\0\1\0\1\0\2\fnoremap\2\vsilent\2\0\6Q\28<Cmd>BufferLinePick<CR>\14<leader>;$<Cmd>BufferLineGoToBuffer 6<CR>\n<A-6>$<Cmd>BufferLineGoToBuffer 5<CR>\n<A-5>$<Cmd>BufferLineGoToBuffer 4<CR>\n<A-4>$<Cmd>BufferLineGoToBuffer 3<CR>\n<A-3>$<Cmd>BufferLineGoToBuffer 2<CR>\n<A-2>$<Cmd>BufferLineGoToBuffer 1<CR>\n<A-1>\6n\bset\vkeymap\bvim\1\0\1\fnoremap\2\foptions\1\0\0\foffsets\ttext\0\1\0\4\15text_align\tleft\14separator\2\14highlight\14Directory\rfiletype\17coc-explorer\1\0\2\16diagnostics\bcoc\fsort_by\18insert_at_end\nsetup\15bufferline\frequire\0" },
    loaded = true,
    path = "/home/lqf/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["coc.nvim"] = {
    loaded = true,
    path = "/home/lqf/.local/share/nvim/site/pack/packer/start/coc.nvim",
    url = "https://github.com/neoclide/coc.nvim"
  },
  ["colorbuddy.vim"] = {
    loaded = true,
    path = "/home/lqf/.local/share/nvim/site/pack/packer/start/colorbuddy.vim",
    url = "https://github.com/tjdevries/colorbuddy.vim"
  },
  conjure = {
    loaded = true,
    path = "/home/lqf/.local/share/nvim/site/pack/packer/start/conjure",
    url = "https://github.com/olical/conjure"
  },
  firenvim = {
    loaded = true,
    path = "/home/lqf/.local/share/nvim/site/pack/packer/start/firenvim",
    url = "https://github.com/glacambre/firenvim"
  },
  fzf = {
    loaded = true,
    path = "/home/lqf/.local/share/nvim/site/pack/packer/start/fzf",
    url = "https://github.com/junegunn/fzf"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/lqf/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["gruvbox-material"] = {
    loaded = true,
    path = "/home/lqf/.local/share/nvim/site/pack/packer/start/gruvbox-material",
    url = "https://github.com/sainnhe/gruvbox-material"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n½\1\0\0\6\0\f\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\0025\3\t\0004\4\3\0005\5\b\0>\5\1\4=\4\n\3=\3\v\2B\0\2\1K\0\1\0\rsections\14lualine_c\1\0\0\1\2\1\0\rfilename\tpath\3\1\foptions\1\0\0\23disabled_filetypes\1\0\0\1\2\0\0\17coc-explorer\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/home/lqf/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["markdown-preview.nvim"] = {
    commands = { "MarkdownPreview" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/lqf/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n%\0\0\1\0\1\0\0025\0\0\0L\0\2\0\1\3\0\0\15treesitter\vindentÎ\2\1\0\4\0\18\0\0256\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\0025\3\f\0=\3\r\2B\0\2\0016\0\0\0'\2\14\0B\0\2\0029\0\2\0005\2\16\0003\3\15\0=\3\17\2B\0\2\1K\0\1\0\22provider_selector\1\0\0\0\bufo\fmatchup\1\0\1\venable\2\vindent\1\0\1\venable\2\26context_commentstring\1\0\1\venable\2\14highlight\1\0\1\venable\2\21ensure_installed\1\0\0\1\t\0\0\blua\15typescript\bvue\bcss\tscss\thtml\15javascript\btsx\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/lqf/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/home/lqf/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-ufo"] = {
    loaded = true,
    path = "/home/lqf/.local/share/nvim/site/pack/packer/start/nvim-ufo",
    url = "https://github.com/kevinhwang91/nvim-ufo"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/lqf/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/lqf/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/lqf/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["promise-async"] = {
    loaded = true,
    path = "/home/lqf/.local/share/nvim/site/pack/packer/start/promise-async",
    url = "https://github.com/kevinhwang91/promise-async"
  },
  ["rose-pine"] = {
    loaded = true,
    path = "/home/lqf/.local/share/nvim/site/pack/packer/start/rose-pine",
    url = "https://github.com/rose-pine/neovim"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/lqf/.local/share/nvim/site/pack/packer/start/vim-commentary",
    url = "https://github.com/tpope/vim-commentary"
  },
  ["vim-dispatch"] = {
    commands = { "Dispatch", "Make", "Focus", "Start" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/lqf/.local/share/nvim/site/pack/packer/opt/vim-dispatch",
    url = "https://github.com/tpope/vim-dispatch"
  },
  ["vim-fugitive"] = {
    config = { "\27LJ\2\nR\0\0\6\0\6\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0004\5\0\0B\0\5\1K\0\1\0\15<Cmd>G<CR>\15<leader>gs\6n\bset\vkeymap\bvim\0" },
    loaded = true,
    path = "/home/lqf/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-matchup"] = {
    after_files = { "/home/lqf/.local/share/nvim/site/pack/packer/opt/vim-matchup/after/plugin/matchit.vim" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/lqf/.local/share/nvim/site/pack/packer/opt/vim-matchup",
    url = "https://github.com/andymass/vim-matchup"
  },
  ["vim-racket"] = {
    loaded = true,
    path = "/home/lqf/.local/share/nvim/site/pack/packer/start/vim-racket",
    url = "https://github.com/wlangstroth/vim-racket"
  },
  ["vim-signature"] = {
    loaded = true,
    path = "/home/lqf/.local/share/nvim/site/pack/packer/start/vim-signature",
    url = "https://github.com/kshenoy/vim-signature"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: auto-session
time([[Config for auto-session]], true)
try_loadstring("\27LJ\2\n½\1\0\0\4\0\n\0\r6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\4\0'\2\5\0B\0\2\0029\0\6\0005\2\b\0005\3\a\0=\3\t\2B\0\2\1K\0\1\0\31auto_session_suppress_dirs\1\0\0\1\2\0\0\6~\nsetup\17auto-session\frequire0curdir,folds,help,tabpages,terminal,winsize\19sessionoptions\bopt\bvim\0", "config", "auto-session")
time([[Config for auto-session]], false)
-- Config for: bufferline.nvim
time([[Config for bufferline.nvim]], true)
try_loadstring("\27LJ\2\n%\0\0\2\0\3\0\0046\0\0\0009\0\1\0009\0\2\0D\0\1\0\vgetcwd\afn\bvim-\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\14bdelete %\bcmd\bvim¤\6\1\0\b\0 \0P6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\b\0005\4\3\0004\5\3\0005\6\4\0003\a\5\0=\a\6\6>\6\1\5=\5\a\4=\4\t\3B\1\2\0015\1\n\0006\2\v\0009\2\f\0029\2\r\2'\4\14\0'\5\15\0'\6\16\0\18\a\1\0B\2\5\0016\2\v\0009\2\f\0029\2\r\2'\4\14\0'\5\17\0'\6\18\0\18\a\1\0B\2\5\0016\2\v\0009\2\f\0029\2\r\2'\4\14\0'\5\19\0'\6\20\0\18\a\1\0B\2\5\0016\2\v\0009\2\f\0029\2\r\2'\4\14\0'\5\21\0'\6\22\0\18\a\1\0B\2\5\0016\2\v\0009\2\f\0029\2\r\2'\4\14\0'\5\23\0'\6\24\0\18\a\1\0B\2\5\0016\2\v\0009\2\f\0029\2\r\2'\4\14\0'\5\25\0'\6\26\0\18\a\1\0B\2\5\0016\2\v\0009\2\f\0029\2\r\2'\4\14\0'\5\27\0'\6\28\0\18\a\1\0B\2\5\0016\2\v\0009\2\f\0029\2\r\2'\4\14\0'\5\29\0003\6\30\0005\a\31\0B\2\5\1K\0\1\0\1\0\2\fnoremap\2\vsilent\2\0\6Q\28<Cmd>BufferLinePick<CR>\14<leader>;$<Cmd>BufferLineGoToBuffer 6<CR>\n<A-6>$<Cmd>BufferLineGoToBuffer 5<CR>\n<A-5>$<Cmd>BufferLineGoToBuffer 4<CR>\n<A-4>$<Cmd>BufferLineGoToBuffer 3<CR>\n<A-3>$<Cmd>BufferLineGoToBuffer 2<CR>\n<A-2>$<Cmd>BufferLineGoToBuffer 1<CR>\n<A-1>\6n\bset\vkeymap\bvim\1\0\1\fnoremap\2\foptions\1\0\0\foffsets\ttext\0\1\0\4\15text_align\tleft\14separator\2\14highlight\14Directory\rfiletype\17coc-explorer\1\0\2\16diagnostics\bcoc\fsort_by\18insert_at_end\nsetup\15bufferline\frequire\0", "config", "bufferline.nvim")
time([[Config for bufferline.nvim]], false)
-- Config for: vim-fugitive
time([[Config for vim-fugitive]], true)
try_loadstring("\27LJ\2\nR\0\0\6\0\6\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0004\5\0\0B\0\5\1K\0\1\0\15<Cmd>G<CR>\15<leader>gs\6n\bset\vkeymap\bvim\0", "config", "vim-fugitive")
time([[Config for vim-fugitive]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n%\0\0\1\0\1\0\0025\0\0\0L\0\2\0\1\3\0\0\15treesitter\vindentÎ\2\1\0\4\0\18\0\0256\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\0025\3\f\0=\3\r\2B\0\2\0016\0\0\0'\2\14\0B\0\2\0029\0\2\0005\2\16\0003\3\15\0=\3\17\2B\0\2\1K\0\1\0\22provider_selector\1\0\0\0\bufo\fmatchup\1\0\1\venable\2\vindent\1\0\1\venable\2\26context_commentstring\1\0\1\venable\2\14highlight\1\0\1\venable\2\21ensure_installed\1\0\0\1\t\0\0\blua\15typescript\bvue\bcss\tscss\thtml\15javascript\btsx\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n½\1\0\0\6\0\f\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\0025\3\t\0004\4\3\0005\5\b\0>\5\1\4=\4\n\3=\3\v\2B\0\2\1K\0\1\0\rsections\14lualine_c\1\0\0\1\2\1\0\rfilename\tpath\3\1\foptions\1\0\0\23disabled_filetypes\1\0\0\1\2\0\0\17coc-explorer\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Dispatch lua require("packer.load")({'vim-dispatch'}, { cmd = "Dispatch", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Make lua require("packer.load")({'vim-dispatch'}, { cmd = "Make", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file ALEEnable lua require("packer.load")({'ale'}, { cmd = "ALEEnable", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Start lua require("packer.load")({'vim-dispatch'}, { cmd = "Start", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file MarkdownPreview lua require("packer.load")({'markdown-preview.nvim'}, { cmd = "MarkdownPreview", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Focus lua require("packer.load")({'vim-dispatch'}, { cmd = "Focus", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType c ++once lua require("packer.load")({'ale'}, { ft = "c" }, _G.packer_plugins)]]
vim.cmd [[au FileType tex ++once lua require("packer.load")({'ale'}, { ft = "tex" }, _G.packer_plugins)]]
vim.cmd [[au FileType vim ++once lua require("packer.load")({'ale'}, { ft = "vim" }, _G.packer_plugins)]]
vim.cmd [[au FileType racket ++once lua require("packer.load")({'ale'}, { ft = "racket" }, _G.packer_plugins)]]
vim.cmd [[au FileType sh ++once lua require("packer.load")({'ale'}, { ft = "sh" }, _G.packer_plugins)]]
vim.cmd [[au FileType zsh ++once lua require("packer.load")({'ale'}, { ft = "zsh" }, _G.packer_plugins)]]
vim.cmd [[au FileType bash ++once lua require("packer.load")({'ale'}, { ft = "bash" }, _G.packer_plugins)]]
vim.cmd [[au FileType cpp ++once lua require("packer.load")({'ale'}, { ft = "cpp" }, _G.packer_plugins)]]
vim.cmd [[au FileType cmake ++once lua require("packer.load")({'ale'}, { ft = "cmake" }, _G.packer_plugins)]]
vim.cmd [[au FileType html ++once lua require("packer.load")({'ale'}, { ft = "html" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'ale'}, { ft = "markdown" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'vim-matchup'}, { event = "VimEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end

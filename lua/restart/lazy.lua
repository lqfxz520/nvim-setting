local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

  { 'neoclide/coc.nvim',   branch = 'release' },

  -- Lazy loading:
  -- Load on specific commands
  { 'tpope/vim-dispatch',  lazy = true,       cmd = { 'Dispatch', 'Make', 'Focus', 'Start' } },

  -- Load on an autocommand event
  { 'andymass/vim-matchup' },

  -- Plugins can have post-install/update hooks
  {
    'iamcco/markdown-preview.nvim',
    build = 'cd app && npm install',
    setup = function()
      vim.g.mkdp_filetypes = {
        "markdown" }
    end,
    ft = { "markdown" },
  },
  { "rcarriga/nvim-dap-ui",      dependencies = { "mfussenegger/nvim-dap" } },
  { "mxsdev/nvim-dap-vscode-js", dependencies = { "mfussenegger/nvim-dap" } },

  'tpope/vim-commentary',

  'JoosepAlviste/nvim-ts-context-commentstring',
  -- Post-install/update hook with neovim command
  {
    'nvim-treesitter/nvim-treesitter',
    event = 'BufReadPost',
    dependencies = {
      'kevinhwang91/nvim-ufo',
      'andymass/vim-matchup',
      'nvim-treesitter/nvim-treesitter-textobjects',
      'windwp/nvim-ts-autotag'
    },
    config = function()
      require("plugins.nvim-treesitter")
    end,
    build = ':TSUpdate',
  },

  -- Post-install/update hook with call of vimscript function with argument
  { 'glacambre/firenvim',      build = function() vim.fn['firenvim#install'](0) end },

  -- Use dependency and run lua function after load
  {
    'lewis6991/gitsigns.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    -- config = function() require('gitsigns').setup() end
  },

  { 'rose-pine/neovim',        name = 'rose-pine', },
  { 'sainnhe/gruvbox-material' },

  { 'junegunn/fzf',            build = './install --all' },

  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
  },

  'tpope/vim-fugitive',

  -- 'olical/conjure'
  -- 'wlangstroth/vim-racket'

  {
    'akinsho/bufferline.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons' }
  },

  {
    'kevinhwang91/nvim-ufo',
    dependencies = { 'kevinhwang91/promise-async' }
  },

  { 'kshenoy/vim-signature',                     lazy = true },

  'rcarriga/nvim-notify',

  {
    'phaazon/hop.nvim',
    branch = 'v2'
  },

  {
    'gelguy/wilder.nvim',
    config = function ()
      require('plugins/wilder-nvim')
    end
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to the notification view.
      --   If not available, we `mini` as the fallback
      "rcarriga/nvim-notify",
    },
  },

  'NvChad/nvim-colorizer.lua',

  {
    "kylechui/nvim-surround",
  },

  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },

  { "nvim-telescope/telescope-file-browser.nvim" },
  { 'TimUntersberger/neogit',                    dependencies = { 'nvim-lua/plenary.nvim' } },
  { 'mrjones2014/smart-splits.nvim' },

  'joshdick/onedark.vim',

  { 'sainnhe/edge',                       lazy = false },

  { 'lukas-reineke/indent-blankline.nvim' },

  { "lervag/vimtex",                      ft = { "tex" } },
  { 'Shatur/neovim-session-manager',      dependencies = { 'nvim-lua/plenary.nvim' } },

  -- { 'github/copilot.vim' },
  {
    'windwp/nvim-autopairs',
    config = function ()
      require('plugins.nvim-autopairs')
    end
  }
})

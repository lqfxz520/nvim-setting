-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use { 'neoclide/coc.nvim', branch = 'release' }

  -- Lazy loading:
  -- Load on specific commands
  use { 'tpope/vim-dispatch', opt = true, cmd = { 'Dispatch', 'Make', 'Focus', 'Start' } }

  -- Load on an autocommand event
  use { 'andymass/vim-matchup' }

  -- Load on a combination of conditions: specific filetypes or commands
  -- Also run code after load (see the "config" key)
  use {
    'w0rp/ale',
    ft = { 'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex' },
    cmd = 'ALEEnable',
    config = 'vim.cmd[[ALEEnable]]'
  }

  -- Plugins can have post-install/update hooks
  use { 'iamcco/markdown-preview.nvim', run = 'cd app && npm install',
    setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, }

  use 'tpope/vim-commentary'

  use 'JoosepAlviste/nvim-ts-context-commentstring'
  -- Post-install/update hook with neovim command
  use {
    'nvim-treesitter/nvim-treesitter',
    requries = {
      'andymass/vim-matchup',
      'kevinhwang91/nvim-ufo',
      'andymass/vim-matchup'
    },
    run = ':TSUpdate',
  }

  -- Post-install/update hook with call of vimscript function with argument
  use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }

  -- Use dependency and run lua function after load
  use {
    'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
    -- config = function() require('gitsigns').setup() end
  }

  use { 'rose-pine/neovim', as = 'rose-pine', tag = 'v1.*' }

  use { 'sainnhe/gruvbox-material' }

  use { 'junegunn/fzf', run = './install --all' }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
  }

  use 'tpope/vim-fugitive'

  -- use 'olical/conjure'
  -- use 'wlangstroth/vim-racket'

  use {
    'akinsho/bufferline.nvim',
    tag = "v3.*",
    requires = 'kyazdani42/nvim-web-devicons'
  }

  use {
    'kevinhwang91/nvim-ufo',
    requires = 'kevinhwang91/promise-async'
  }

  use 'kshenoy/vim-signature'

  use 'rcarriga/nvim-notify'

  use {
    'phaazon/hop.nvim',
    branch = 'v2'
  }

  use {
    'gelguy/wilder.nvim',
  }

  use({
    "folke/noice.nvim",
    requires = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    }
  })

  use 'NvChad/nvim-colorizer.lua'

  use {
    "kylechui/nvim-surround",
    tag = "*"
  }

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { 'nvim-lua/plenary.nvim' }
  }

  use { "nvim-telescope/telescope-file-browser.nvim" }

  use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }

  use('mrjones2014/smart-splits.nvim')

  use 'joshdick/onedark.vim'

  use 'sainnhe/edge'

  use 'lukas-reineke/indent-blankline.nvim'

  use { "lervag/vimtex", ft = { "tex" } }

  use { 'Shatur/neovim-session-manager', requires = { 'nvim-lua/plenary.nvim' } }
end)

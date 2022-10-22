-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use { 'rmagatti/auto-session', config = function() 
    require('auto-session').setup({ auto_session_suppress_dirs = { '~' }, pre_save_cmds = 'CocExplorerQuitPost'})
  end }

  use {'neoclide/coc.nvim', branch = 'release'}

  -- Lazy loading:
  -- Load on specific commands
  use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}

  -- Load on an autocommand event
  use {'andymass/vim-matchup', event = 'VimEnter'}

  -- Load on a combination of conditions: specific filetypes or commands
  -- Also run code after load (see the "config" key)
  use {
    'w0rp/ale',
    ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
    cmd = 'ALEEnable',
    config = 'vim.cmd[[ALEEnable]]'
  }

  -- You can specify rocks in isolation
  -- use_rocks 'penlight'
  -- use_rocks {'lua-resty-http', 'lpeg'}

  -- Plugins can have post-install/update hooks
  use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}

  use 'tpope/vim-commentary'

  use 'JoosepAlviste/nvim-ts-context-commentstring' 
  -- Post-install/update hook with neovim command
  use { 
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = { 'lua', 'typescript', 'vue', 'css', 'scss', 'html', 'javascript', 'tsx' },
        highlight = { enable = true },
        context_commentstring = { enable = true },
        indent = { enable = true },
      })
    end
  }

  -- Post-install/update hook with call of vimscript function with argument
  use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }

  -- Use dependency and run lua function after load
  use {
    'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('gitsigns').setup() end
  }

  -- You can specify multiple plugins in a single call
  use {'tjdevries/colorbuddy.vim', {'nvim-treesitter/nvim-treesitter', opt = true}}

  use { 'rose-pine/neovim', as = 'rose-pine', tag = 'v1.*' }

  use { 'sainnhe/gruvbox-material' }

  use { 'junegunn/fzf', run = './install --all' }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require('lualine').setup()
    end
  }

  use { 'tpope/vim-fugitive', config = function() vim.keymap.set('n', '<leader>gs', '<Cmd>G<CR>', {}) end }

  use 'olical/conjure'
  use 'wlangstroth/vim-racket'

  use {'akinsho/bufferline.nvim',
    config = function()
      require('bufferline').setup{}
    end,
    tag = "v3.*",
    requires = 'kyazdani42/nvim-web-devicons'
  }
end)

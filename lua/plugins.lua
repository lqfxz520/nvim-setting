-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use { 'rmagatti/auto-session', config = function() 
    vim.opt.sessionoptions = 'curdir,folds,help,tabpages,terminal,winsize'
    require('auto-session').setup{
      auto_session_suppress_dirs = { '~' },
    }
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
    requries = {
      'andymass/vim-matchup',
      'kevinhwang91/nvim-ufo',
      'andymass/vim-matchup'
    },
    run = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = { 'lua', 'typescript', 'vue', 'css', 'scss', 'html', 'javascript', 'tsx' },
        highlight = { enable = true },
        context_commentstring = { enable = true },
        indent = { enable = true },
        matchup = { enable = true },
      })

      require('ufo').setup({
        provider_selector = function()
          return {'treesitter', 'indent'}
        end
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
      require('lualine').setup{ 
        options = {
          disabled_filetypes = {'coc-explorer'}
        },
        sections = { lualine_c = { {'filename', path = 1} } }
      }
    end
  }

  use { 'tpope/vim-fugitive', config = function() vim.keymap.set('n', '<leader>gs', '<Cmd>G<CR>', {}) end }

  use 'olical/conjure'
  use 'wlangstroth/vim-racket'

  use {'akinsho/bufferline.nvim',
    config = function()
      local bufferline = require('bufferline')
      bufferline.setup{
        options = {
          -- mode = 'tabs',
          diagnostics = 'coc',
          sort_by = 'insert_at_end',
          offsets = {
            {
              filetype = "coc-explorer",
              text = function() return vim.fn.getcwd() end,
              text_align = "left",
              highlight = "Directory",
              separator = true
            }
          },
        }
      }

      local opt = { noremap = true }
      vim.keymap.set('n', '<A-1>', '<Cmd>BufferLineGoToBuffer 1<CR>', opt)
      vim.keymap.set('n', '<A-2>', '<Cmd>BufferLineGoToBuffer 2<CR>', opt)
      vim.keymap.set('n', '<A-3>', '<Cmd>BufferLineGoToBuffer 3<CR>', opt)
      vim.keymap.set('n', '<A-4>', '<Cmd>BufferLineGoToBuffer 4<CR>', opt)
      vim.keymap.set('n', '<A-5>', '<Cmd>BufferLineGoToBuffer 5<CR>', opt)
      vim.keymap.set('n', '<A-6>', '<Cmd>BufferLineGoToBuffer 6<CR>', opt)
      vim.keymap.set('n', '<leader>;', '<Cmd>BufferLinePick<CR>', opt)
      vim.keymap.set('n', 'Q', function()
        vim.cmd('bdelete %')
      end, { silent = true, noremap = true })
    end,
    tag = "v3.*",
    requires = 'kyazdani42/nvim-web-devicons'
  }

  use {
    'kevinhwang91/nvim-ufo',
    requires = 'kevinhwang91/promise-async'
  }
  
  use 'kshenoy/vim-signature'
end)

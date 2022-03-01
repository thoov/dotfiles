local fn = vim.fn

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'lewis6991/impatient.nvim'

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'EdenEast/nightfox.nvim'

  -- LSP Plugins
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'

  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  use { 'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} } }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }

  use 'lukas-reineke/indent-blankline.nvim'
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'
  use { 'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons', config = function() require'nvim-tree'.setup {} end }
  use 'editorconfig/editorconfig-vim'
  use 'liuchengxu/vim-which-key'
  use 'petertriho/nvim-scrollbar'

  use 'j-hui/fidget.nvim'
  use{ 'anuvyklack/pretty-fold.nvim',
    config = function()
      require('pretty-fold').setup {
        keep_indentation = false,
        fill_char = '•',
        sections = {
          left = {
            '+', function() return string.rep('-', vim.v.foldlevel) end,
            ' ', 'number_of_folded_lines', ':', 'content',
          }
        }
      }
    end
  }
end)

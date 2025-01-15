-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)

  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.8',
	  -- Or, branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use ({
	  'catppuccin/nvim',
	  as = "catppuccin",
	  config = function()
		  require('catppuccin').setup({
			  transparent_background = false,
		  })
		  vim.cmd('colorscheme catppuccin-mocha')
	  end,
  })

  use ( 'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'})

  use "nvim-lua/plenary.nvim" -- requirement for harpoon
  use {
	  "ThePrimeagen/harpoon",
	  branch = "harpoon2",
	  requires = { {"nvim-lua/plenary.nvim"} }
  }

  use ( 'mbbill/undotree' )
  use ( 'tpope/vim-fugitive' )

  use ( 'neovim/nvim-lspconfig' )
  use ( 'hrsh7th/nvim-cmp' )
  use ( 'hrsh7th/cmp-nvim-lsp' )
  use ( 'williamboman/mason.nvim' )
  use ( 'williamboman/mason-lspconfig.nvim' )

  use({
      "kylechui/nvim-surround",
      config = function()
          require("nvim-surround").setup({
              -- Configuration here, or leave empty to use defaults
          })
      end
  })

  use {
      'nvim-tree/nvim-tree.lua',
      requires = {
          'nvim-tree/nvim-web-devicons', -- optional
      },
  }

  use {
      "folke/which-key.nvim",
      config = function()
          require("which-key").setup {}

          -- Keymap for showing buffer-local keymaps
          vim.keymap.set("n", "<leader>?", function()
              require("which-key").show({ global = false })
          end, { desc = "Buffer Local Keymaps (which-key)" })
      end
  }

  use {
      "windwp/nvim-autopairs",
      event = "InsertEnter",
      config = function()
          require("nvim-autopairs").setup {}
      end
  }

  use ( 'lewis6991/gitsigns.nvim' )
  use ( 'catgoose/nvim-colorizer.lua' )
  use ( 'vim-airline/vim-airline' )
  use ( 'vim-airline/vim-airline-themes' )
  use ( 'ryanoasis/vim-devicons' )

  use {
      'rmagatti/auto-session',
      config = function()
        require("auto-session").setup {
          suppressed_dirs = { "~/", "~/Downloads", "/"},
        }
      end
  }

end)

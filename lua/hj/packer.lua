packer = require('packer')
-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

return packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'}}
  }
  use {
    "folke/trouble.nvim",
    config = function()
      require("trouble").setup {
        icon = false,
        auto_open = true,
        auto_close = true,
      }
    end
  }
  use { "nvim-treesitter/nvim-treesitter" }
  use { "windwp/nvim-autopairs" }
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},

      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},
    }
  }

  -- functional
  use {"jose-elias-alvarez/null-ls.nvim"}
  use {"moll/vim-bbye"} -- add macros
  use {"numToStr/Comment.nvim"} -- use 'gc' to comment
  use {"akinsho/toggleterm.nvim"} -- toggleterm

  -- alpha commands
  use { "goolord/alpha-nvim" }
  use { "ahmedkhalf/project.nvim"}

  -- aesthetics
  use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  use { "kyazdani42/nvim-tree.lua" }

  -- color scheme
  use ({ "folke/tokyonight.nvim"})
  -- use { "lunarvim/darkplus.nvim" }
  -- use { "rose-pine/neovim"}
 --  use { "sts10/vim-pink-moon" }
 -- use { "danilo-augusto/vim-afterglow"}
  use ({
    "xiyaowong/nvim-transparent",
    config = function()
      require("transparent").setup({
        enable = true,
      })
    end,
  })

  -- other plugins
  use { "lewis6991/impatient.nvim" } -- faster startup
  use({ "folke/which-key.nvim" })
  use("simrat39/rust-tools.nvim")

end)

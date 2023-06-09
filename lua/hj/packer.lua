return require('packer').startup(function(use)
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
		}
	end
	}
end)

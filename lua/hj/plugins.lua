local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		print("Installing packer!")
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "single" })
		end,
	},
})

return packer.startup(function(use)
	use("wbthomason/packer.nvim")
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use({
		"folke/trouble.nvim",
	})
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})
	use({ "windwp/nvim-autopairs" })
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v1.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
		},
	})

	-- functional
	use({ "jose-elias-alvarez/null-ls.nvim" })
	use({ "moll/vim-bbye" }) -- add macros
	use({ "numToStr/Comment.nvim" }) -- use 'gc' to comment
	use({ "akinsho/toggleterm.nvim" }) -- toggleterm

	-- alpha commands
	use({ "goolord/alpha-nvim" })
	use({ "ahmedkhalf/project.nvim" })

	-- aesthetics
	use({ "akinsho/bufferline.nvim", tag = "*", requires = "nvim-tree/nvim-web-devicons" })
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	})
	use({ "kyazdani42/nvim-tree.lua" })

	-- color scheme
	use({ "folke/tokyonight.nvim" })
	-- use { "lunarvim/darkplus.nvim" }
	-- use { "rose-pine/neovim"}
	--  use { "sts10/vim-pink-moon" }
	-- use { "danilo-augusto/vim-afterglow"}
	use({ "xiyaowong/nvim-transparent" })

	-- other plugins
	use({ "lewis6991/impatient.nvim" }) -- faster startup
	use({ "folke/which-key.nvim" })
	use("simrat39/rust-tools.nvim")

	-- Auto setup after cloning
	if packer_bootstrap then
		print("packer sync..")
		require("packer").sync()
	end
end)

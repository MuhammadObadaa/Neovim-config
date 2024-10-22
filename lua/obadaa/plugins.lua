local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

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

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here

	use({
		"wbthomason/packer.nvim", -- Have packer manage itself
		--opts = {ensure_installed = {"an LSP server"}}, --MasonInstallAll command to install them -- used in lsp-config file
		"nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
		"nvim-lua/plenary.nvim", -- Useful lua functions used by lots of plugins
		"nvim-tree/nvim-web-devicons",
		"nvim-tree/nvim-tree.lua", -- For nvim tree
	})

	-- git
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	})

	-- autoclose
	use({
		"m4xshen/autoclose.nvim",
		config = function()
			require("autoclose").setup()
		end,
	})

	use({ -- for javascript
		"mfussenegger/nvim-lint",
		config = function()
			require("obadaa.lsp.lint")
		end,
	})

	--markdown-preview
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	}) -- markdown file preview

	-- Colorschemes
	-- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
	-- use "lunarvim/darkplus.nvim"
	use("projekt0n/github-nvim-theme")

	-- cmp plugins
	use({
		"hrsh7th/nvim-cmp", -- The completion plugin
		"hrsh7th/cmp-buffer", -- buffer completions
		"hrsh7th/cmp-path", -- path completions
		"hrsh7th/cmp-cmdline", -- cmdline completions
		"saadparwaiz1/cmp_luasnip", -- snippet completions
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
	})

	-- snippets
	use({
		"L3MON4D3/LuaSnip", --snippet engine
		"rafamadriz/friendly-snippets", -- a bunch of snippets to use
	})

	-- LSP
	use({
		"neovim/nvim-lspconfig", -- enable LSP
		"williamboman/mason.nvim", -- simple to use language server installer
		"williamboman/mason-lspconfig.nvim", -- simple to use language server installer
		"nvimtools/none-ls.nvim", -- for formatters and linters
	})

	-- Telescope.nvim
	use({
		"nvim-telescope/telescope.nvim",
		--tag = '0.1.5', --or branch = '0.1.x'
		--require = {{'nvim-lua/plenary.nvim'}},
		"nvim-telescope/telescope-media-files.nvim",
	})

	-- Lualine
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons" },
	})

	-- AutoSave
	use({
		"Pocco81/auto-save.nvim",
		config = function()
			require("auto-save").setup({})
		end,
	})

	use({
		"olrtg/nvim-emmet",
		config = function()
			vim.keymap.set({ "n", "v" }, "<leader>xe", require("nvim-emmet").wrap_with_abbreviation)
		end,
	})

	use({
		"goolord/alpha-nvim",
		config = function()
			--require'alpha'.setup(require'alpha.themes.dashboard'.config)
			require("obadaa.alpha-nvim").config()
		end,
	})

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)

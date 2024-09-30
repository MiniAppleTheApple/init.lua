return {
	{
		"2nthony/vitesse.nvim",
		dependencies = {
			"tjdevries/colorbuddy.nvim"
		},
	},
	{
		"Yazeed1s/minimal.nvim",
		priority = 1000,
	},
	{
		"dgox16/oldworld.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"srcery-colors/srcery-vim",
		name = "srcery",
		config = function()
			vim.g.srcery_italic = 1
		end,
	},
	{
		"jnurmine/Zenburn",
		priority = 1000,
	},
	{
		"zenbones-theme/zenbones.nvim",
		priority = 1000,
		dependencies = "rktjmp/lush.nvim",	
	},
	{
		"AlessandroYorba/Alduin",
		priority = 1000,
	},
	{
		"AlessandroYorba/Sierra",
		priority = 1000,
	},
	{
		"TheNiteCoder/mountaineer.vim",
		priority = 1000,
	},
	{
		"nikolvs/vim-sunbather",
		priority = 1000,
	},
	{
		'fcancelinha/nordern.nvim',
		priority = 1000,
	},
	{
		'franbach/miramare',
		config = function()
			vim.g.miramare_enable_italic = 1
		end
	},
	{
		'sho-87/kanagawa-paper.nvim',
		priority = 1000,
	},
	{
		'gmr458/cold.nvim',
		priority = 1000,
	},
	{
		"folke/tokyonight.nvim",
		priority = 1000,
	},
	{
		'sainnhe/sonokai',
		priority = 1000,
		name = 'sonokai',
		config = function()
			vim.g.sonokai_style = 'andromeda'
			vim.g.sonokai_better_performance = 1
		end
	},
	{
		'sainnhe/everforest',
		priority = 1000,
		name = 'everforest',
		config = function()
			vim.g.everfoest_background = 'medium'
		end
	},
	{
		'rebelot/kanagawa.nvim',
		priority = 1000,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000
	},
	{
		"marko-cerovac/material.nvim",
		priority = 1000,
	},
	{
		"Everblush/nvim",
		as = 'everblush',
		priority = 1000,
	},
	{
		"savq/melange-nvim",
		priority = 1000,
	},
	{
		"rafamadriz/neon",
		priority = 1000,
	},
	{
		"rakr/vim-two-firewatch",
		priority = 1000,
	},
	{
		"vim-scripts/wombat256.vim",
		priority = 1000,
	},
	{
		'nyoom-engineering/oxocarbon.nvim',
		priority = 1000,
	},
	{
		'olimorris/onedarkpro.nvim',
		priority = 1000,
	},
	{
		'xero/miasma.nvim',
		priority = 1000,
	},
	{
		'vague2k/vague.nvim',
		priority = 1000,
	},
	{
		'cdmill/neomodern.nvim',
		priority = 1000,
		opts = {
			style = "darkforest",
		}
	},
	{
		'comfysage/evergarden',
		priority = 1000
	},
	
	{
		"eldritch-theme/eldritch.nvim",
		priority = 1000,
	},
	{
		"2giosangmitom/nightfall.nvim",
		priority = 1000,
	},
	{
		"oneslash/helix-nvim",
		priority = 1000,
	},
	{
		"lunarvim/horizon.nvim",
		priority = 1000,
	},
	{
		"lunarvim/synthwave84.nvim",
		priority = 1000,
	},
	{
		"haystackandroid/snow",
		priority = 1000,
	},
	{
		"ribru17/bamboo.nvim",
		priority = 1000,
	},
	{
		"oxfist/night-owl.nvim",
		priority = 1000,
	},
	{
		"sainnhe/edge",
		priority = 1000,
		config = function()
			vim.g.edge_style = 'aura'
			vim.g.edge_better_performance = 1
		end
	},
	{
		"AlexvZyl/nordic.nvim",
		priority = 1000,
	},
	{
		"junegunn/seoul256.vim",
		priority = 1000,
	},
	{
		'cocopon/iceberg.vim',
		priority = 1000,
	},
	{
		"Shatur/neovim-ayu",
		priority = 1000,
		name = "ayu",
		opts = {
			mirage = true
		}
	},
	{
		"wadackel/vim-dogrun",
		priority = 1000,
	},
	{
		"lifepillar/vim-solarized8",
		priority = 1000,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		priority = 1000,
	},
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		opts = {
			contrast = "medium",
			overrides = {
				RenderMarkdownH1 = { link = "GruvboxRed" },
				RenderMarkdownH1Bg = { link = "GruvboxRed" },
				RenderMarkdownH2 = { link = "GruvboxOrange" },
				RenderMarkdownH2Bg = { link = "GruvboxOrange" },
				RenderMarkdownH3 = { link = "GruvboxYellow" },
				RenderMarkdownH3Bg = { link = "GruvboxYellow" },
				RenderMarkdownH4 = { link = "GruvboxAqua" },
				RenderMarkdownH4Bg = { link = "GruvboxAqua" },
				RenderMarkdownH5 = { link = "GruvboxBlue" },
				RenderMarkdownH5Bg = { link = "GruvboxBlue" },
				RenderMarkdownH6 = { link = "GruvboxPurple" },
				RenderMarkdownH6Bg = { link = "GruvboxPurple" },
			},
		}
	},
}

vim.opt.termguicolors = true

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
	use 'wbthomason/packer.nvim'
  	use({
  		'folke/tokyonight.nvim',
    		as = "tokyonight",
  	})
  	use({
		'nvim-treesitter/nvim-treesitter',
    		run = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				highlight = {
    					enable = true,
				}
			})
		end
  	})
  	use {
    		'VonHeikemen/lsp-zero.nvim',
    		requires = {
      			-- LSP Support
      			"williamboman/mason.nvim",
      			"williamboman/mason-lspconfig.nvim",
      			"neovim/nvim-lspconfig",
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
    		},
		config = function()
			local lsp = require("lsp-zero")
				
			lsp.preset("recommend")

			require('mason').setup({})
			require('mason-lspconfig').setup({
    				-- Replace the language servers listed here 
				-- with the ones you want to install
				ensure_installed = {'tsserver', 'rust_analyzer', 'elixirls'},
    				handlers = {
      					lsp.default_setup,
    				},
			})

			local cmp = require("cmp")
			local cmp_select = {behaviour = cmp.SelectBehavior.Select}
			local cmp_mappings = lsp.defaults.cmp_mappings({
				['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
				['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
				['<C-y>'] = cmp.mapping.confirm({ select = true }),
  				["<C-Space>"] = cmp.mapping.complete(),
			})
		end
	}

	use({
		"folke/zen-mode.nvim",
		config = function()
			require("zen-mode").setup {
        			window = {
            				width = 90,
            				options = { },
        			},
    			}
		end,
	})
	use("mbbill/undotree")
	use({
	  "epwalsh/obsidian.nvim",
	  tag = "*",  -- recommended, use latest release instead of latest commit
	  requires = {
	    -- Required.
	    "nvim-lua/plenary.nvim",

	    -- see below for full list of optional dependencies 👇
	  },
	  config = function()
	    require("obsidian").setup({
	      workspaces = {
		{
		  name = "notes",
		  path = "~/project/notes",
		},
	      },

	      -- see below for full list of options 👇
	    })
	  end,
	})
	use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.6',
	-- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'}, "andrew-george/telescope-themes"},
	}

	use {
		'sainnhe/sonokai',
		as = 'sonokai',
	}

	use {
		'sainnhe/gruvbox-material', as = 'gruvbox-material'
	}

	use {
		'sainnhe/everforest', as = 'everforest'
	}
	use {
		'rebelot/kanagawa.nvim'
	}
	use {
		'kdheepak/lazygit.nvim',
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-lua/telescope.nvim",
		},
		config = function()
			require("telescope").load_extension("lazygit")
		end,
	}
	use {"MunifTanjim/nui.nvim"}
	use {"nvim-tree/nvim-web-devicons"}
	use {"3rd/image.nvim"}
	use {
		'nvim-neo-tree/neo-tree.nvim',
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			"3rd/image.nvim"
		},
		{
			's1n7ax/nvim-window-picker',
			version = '2.*',
			config = function()
				require 'window-picker'.setup({
					filter_rules = {
						include_current_win = false,
						autoselect_one = true,
						-- filter using buffer options
						bo = {
							-- if the file type is one of following, the window will be ignored
							filetype = { 'neo-tree', "neo-tree-popup", "notify" },
							-- if the buffer type is one of following, the window will be ignored
							buftype = { 'terminal', "quickfix" },
						},
					},
				})
        		end,
      		},
		config = function()
			vim.fn.sign_define("DiagnosticSignError",
				{text = " ", texthl = "DiagnosticSignError"})
			vim.fn.sign_define("DiagnosticSignWarn",
				{text = " ", texthl = "DiagnosticSignWarn"})
			vim.fn.sign_define("DiagnosticSignInfo",
				{text = " ", texthl = "DiagnosticSignInfo"})
			vim.fn.sign_define("DiagnosticSignHint",
				{text = "󰌵", texthl = "DiagnosticSignHint"})

			require("neo-tree").paste_default_config()
		end
	}
	use 'Shatur/neovim-ayu'
	use {
		'wadackel/vim-dogrun'
	}
	
	use {
		'lifepillar/vim-solarized8'
	}
	use {
		"rose-pine/neovim",
		as = "rose-pine",
	}
	use {
		"morhetz/gruvbox"
	}
	use 'navarasu/onedark.nvim'
	use 'shaunsingh/nord.nvim'
	use 'ribru17/bamboo.nvim'
	use "oxfist/night-owl.nvim" 
	use 'sainnhe/edge'
	use {
	  'nvim-lualine/lualine.nvim',
	  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  	}
	use 'AlexvZyl/nordic.nvim'
	use 'junegunn/seoul256.vim'
	use 'cocopon/iceberg.vim'
	use 'folke/trouble.nvim'
	use 'folke/todo-comments.nvim'
	use 'stevearc/aerial.nvim'
	use 'andweeb/presence.nvim'
	use 'akinsho/toggleterm.nvim'
	use 'nyoom-engineering/oxocarbon.nvim'
	use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}
end)


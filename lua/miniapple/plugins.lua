vim.opt.termguicolors = true

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
	use 'wbthomason/packer.nvim'
  	use({
  		'folke/tokyonight.nvim',
    		as = "tokyonight",
    		config = function()
			vim.cmd [[colorscheme tokyonight]]
    		end,
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
end)


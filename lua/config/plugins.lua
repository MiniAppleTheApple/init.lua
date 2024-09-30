function bufremove(buf)
	buf = buf or 0
	buf = buf == 0 and vim.api.nvim_get_current_buf() or buf

	if vim.bo.modified then
		local choice = vim.fn.confirm(("Save changes to %q?"):format(vim.fn.bufname()), "&Yes\n&No\n&Cancel")
		if choice == 0 or choice == 3 then -- 0 for <Esc>/<C-c> and 3 for Cancel
			return
		end
		if choice == 1 then -- Yes
			vim.cmd.write()
		end
	end

	for _, win in ipairs(vim.fn.win_findbuf(buf)) do
		vim.api.nvim_win_call(win, function()
			if not vim.api.nvim_win_is_valid(win) or vim.api.nvim_win_get_buf(win) ~= buf then
				return
			end
			-- Try using alternate buffer
			local alt = vim.fn.bufnr("#")
			if alt ~= buf and vim.fn.buflisted(alt) == 1 then
				vim.api.nvim_win_set_buf(win, alt)
				return
			end

			-- Try using previous buffer
			local has_previous = pcall(vim.cmd, "bprevious")
			if has_previous and buf ~= vim.api.nvim_win_get_buf(win) then
				return
			end

			-- Create new listed buffer
			local new_buf = vim.api.nvim_create_buf(true, false)
			vim.api.nvim_win_set_buf(win, new_buf)
		end)
	end
	if vim.api.nvim_buf_is_valid(buf) then
		pcall(vim.cmd, "bdelete! " .. buf)
	end
end


return {
	{
		"/ggandor/leap.nvim",
		opts = {},
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		name = "ibl",
		opts = {},
	},
	{
		'akinsho/bufferline.nvim',
		lazy = false,
		version = "*",
		requires = {
			{'nvim-tree/nvim-web-devicons'}
		},
		opts = {
			options = {
				offsets = {
					{
						filetype = "neo-tree",
						text = "File Explorer",
						text_align = "left",
						separator = true
					}
				}
			}
		},
		keys = {
			{"<S-h>", "<cmd>bprevious<cr>", desc = "Prev Buffer"},
			{"<S-l>", "<cmd>bnext<cr>", desc = "Next Buffer"},
			{"[b", "<cmd>bprevious<cr>", desc = "Prev Buffer"},
			{"]b", "<cmd>bnext<cr>", desc = "Next Buffer"},
			{"<leader>bd", bufremove, desc = "Delete Buffer"},
			{"<leader>bD", "<cmd>:bd<cr>", desc = "Delete Buffer and Window"},
		},
	},

	{
		'folke/noice.nvim',
		opts = {},
		dependencies = {
			{"MunifTanjim/nui.nvim"},
			{
				"rcarriga/nvim-notify",
				opts = {
					background_colour = "#000000",
				}
			},
		}
	},
	{"numToStr/Comment.nvim", opts = {}},
	{'echasnovski/mini.nvim'},
	{
		'MeanderingProgrammer/render-markdown.nvim',
		opts = {},
		after = { 'nvim-treesitter'},
		requires = { 
			{'echasnovski/mini.nvim',
			opt = true, -- if you use the mini.nvim suite}
		    -- requires = { 'echasnovski/mini.icons', opt = true }, -- if you use standalone mini plugins
		    -- requires = { 'nvim-tree/nvim-web-devicons', opt = true }, -- if you prefer nvim-web-devicons
			config = function()
				require('render-markdown').setup({})
			end}
		},
	},
	{
		'folke/which-key.nvim',
		lazy = false,
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = true })
				end,
				{}
			}
		},
	},
	{'profesorpaiche/toytiza.nvim'},
	{
		'natecraddock/workspaces.nvim',
		keys = {
			{"<S-w>", ":WorkspacesOpen "}
		}
	},
	{
		'folke/todo-comments.nvim',
		opts = {
			highlight = {
				pattern = [[.*<(KEYWORDS)\s*]],
			},
			search = {
				pattern = [[\b(KEYWORDS)\b]],
			}
		}
	},
	{
		'stevearc/aerial.nvim',
		opts = {
			-- optionally use on_attach to set keymaps when aerial has attached to a buffer
			on_attach = function(bufnr)
				-- Jump forwards/backwards with '{' and '}'
				vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
				vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
			end,
		},
		keys = {
			{"<leader>a", "<cmd>AerialToggle!<CR>", desc = "Open Aerial"},
		}
},
	{
		'andweeb/presence.nvim',
		opts = {}
	},
	{
		"nvim-lualine/lualine.nvim",
		opts = {},
		dependencies = { 'nvim-tree/nvim-web-devicons'},
	},
	{'lunacookies/vim-substrata'},
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("nvim-treesitter.configs").setup({
				highlight = {
					enable = true,
				}
			})
		end
	},
	{
		"VonHeikemen/lsp-zero.nvim",
		dependencies = {
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
			local lsp_zero = require('lsp-zero')
			local lsp_attach = function(client, bufnr)
				local opts = {buffer = bufnr}

				vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
				vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
				vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
				vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
				vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
				vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
				vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
				vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
				vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
				vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
			end

			lsp_zero.extend_lspconfig({
				sign_text = true,
				lsp_attach = lsp_attach,
				capabilities = require('cmp_nvim_lsp').default_capabilities()
			})

			require('mason').setup({})
			require('mason-lspconfig').setup({
				handlers = {
					function(server_name)
						require('lspconfig')[server_name].setup({})
					end,
				}
			})

			local cmp = require('cmp')

			cmp.setup({
				sources = {
					{name = 'nvim_lsp'},
				},
				snippet = {
					expand = function(args)
						-- You need Neovim v0.10 to use vim.snippet
						vim.snippet.expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({}),
			})

			local lspconfig = require("lspconfig")

			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
		end
	},
	{
		"folke/zen-mode.nvim",
		keys = {
			{"<leader>z", desc="Zen mode", function()
				require("zen-mode").toggle()
				if zen == false then
					vim.wo.rnu = true
					vim.wo.number = true
					vim.wo.wrap = false
					zen = true
				else
					vim.wo.rnu = true
					vim.wo.number = true
					vim.wo.wrap = true
					zen = false
				end
			end},
		},
		opts = {
			window = {
				width = 90,
				options = {},
			}
		},
	},
	{"mbbill/undotree"},
	{
		"epwalsh/obsidian.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {
			ui = {
				enable = false
			},
			workspaces = {
				{
					name = "notes",
					path = "~/project/notes",
					overrides = {
						notes_subdir = "021 Daily",
					},
				},
			},
			templates = {
				folder = "070 Templates",
				date_format = "%Y-%m-%d-%a",
				time_format = "%H:%M",
			},
			callout = {
				info = { raw = "[!INFO]", rendered = "  Info", highlight = 'RenderMarkdownHint'}
			},
			follow_url_func = function(url)
				vim.fn.jobstart({"xdg-open", url})
			end,
			note_frontmatter_func = function(note)
				local out = {tags = note.tags}
				local v = string.find(note.path.filename, "%d%d%d%d%-%d%d%-%d%d") 
				local add_zettel = v == nil
				for _, v in ipairs(out.tags) do
					if v == "zettel" then
						add_zettel = false
					end
				end
				
				if add_zettel then
					out.tags[#out.tags + 1] = "zettel"
				end

				if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
					for k, v in pairs(note.metadata) do
						out[k] = v
					end
				end

				return out	
			end,
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		version = "*",
		dependencies = {
			{"nvim-lua/plenary.nvim"},
			{"andrew-george/telescope-themes"},
		},
		config = function()

			local builtin = require('telescope.builtin')
			local telescope = require('telescope')

			telescope.setup({
				pickers = {
					colorscheme = {
						enable_preview=true
					}
				},
				file_ignore_patterns = { "node_modules" },
			})

			telescope.load_extension('themes')
			telescope.load_extension('workspaces')

			vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
			vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
			vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
			vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
			vim.keymap.set('n', '<leader>fc', builtin.current_buffer_fuzzy_find, {})
			vim.keymap.set('n', '<leader>fs', ":Telescope themes<CR>")

			-- external
			vim.keymap.set("n", "<leader>ft", ":TodoTelescope<CR>")
		end,
	},
	{
		'kdheepak/lazygit.nvim',
		dependencies = {
			{"nvim-lua/plenary.nvim"},
			{"nvim-lua/telescope.nvim"},
		},
		config = function()
			require("telescope").load_extension("lazygit")

			vim.api.nvim_create_autocmd('BufEnter',  { command = ":lua require('lazygit.utils').project_root_dir()"}) 
		end,
		keys = {
			{'<leader>gt', ':lua require("telescope").extensions.lazygit.lazygit()<CR>'},
			{'<leader>gg', ':LazyGit<CR>'},
			{'<leader>gf', ':LazyGitFilter<CR>'},
			{'<leader>gc', ':LazyGitFilterCurrentFile<CR>'},
		},
	},
	{
		'nvim-neo-tree/neo-tree.nvim',
		dependencies = {
			{"nvim-lua/plenary.nvim"},
			{"nvim-tree/nvim-web-devicons"}, -- not strictly required, but recommended
			{"MunifTanjim/nui.nvim"},
			{"3rd/image.nvim"},
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

			-- require("neo-tree").paste_default_config()
			vim.keymap.set("n", "<leader>t", ":Neotree source=filesystem reveal=true position=left toggle=true<CR>")
			vim.keymap.set("n", "<leader>pv", ":Neotree source=filesystem reveal=true position=current toggle=true<CR>")
		end,
	},

	--- Themes
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
		'folke/trouble.nvim',
		opts = {},
		keys = {
			{"<leader>xx", ":Trouble diagnostics toggle<CR>"},
			{"<leader>xt", ":Trouble todo<CR>"},
		},
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
		"kchmck/vim-coffee-script",
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
		'sainnhe/gruvbox-material',
		priority = 1000,
		name = 'gruvbox-material',
		config = function()
			vim.g.gruvbox_material_deisable_italic_comment = 1
			vim.g.gruvbox_material_foreground = 'material'
			vim.g.gruvbox_material_background = 'soft'
			vim.g.gruvbox_material_better_performance = 1
		end,
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
}

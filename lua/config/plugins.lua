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
	    "ThePrimeagen/harpoon",
	    branch = "harpoon2",
	    dependencies = { "nvim-lua/plenary.nvim" },
	    lazy = false,
	    config = function()

		local harpoon = require("harpoon")

		-- REQUIRED
		harpoon:setup()
		-- REQUIRED
		vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end)
		vim.keymap.set("n", "<leader>he", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

		vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
		vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
		vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
		vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)

		-- Toggle previous & next buffers stored within Harpoon list
		vim.keymap.set("n", "<leader>hp", function() harpoon:list():prev() end)
		vim.keymap.set("n", "<leader>hn", function() harpoon:list():next() end)

		-- basic telescope configuration
		local conf = require("telescope.config").values
		local function toggle_telescope(harpoon_files)
			local file_paths = {}
			for _, item in ipairs(harpoon_files.items) do
				table.insert(file_paths, item.value)
			end

			require("telescope.pickers").new({}, {
				prompt_title = "Harpoon",
				finder = require("telescope.finders").new_table({
					results = file_paths,
				}),
				previewer = conf.file_previewer({}),
				sorter = conf.generic_sorter({}),
			}):find()
		end

		vim.keymap.set("n", "<leader>fe", function() toggle_telescope(harpoon:list()) end,
		{ desc = "Open harpoon window" })
	end,
},
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({})
		end,
	},
	{
		"folke/trouble.nvim",
		opts = {},
		cmd = "Trouble",
		keys = {
			{
				"<leader>xt",
				"<cmd>Trouble todo<cr>",
				desc = "Todos",
			},
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
						{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},
	{
		"stevearc/oil.nvim",
		lazy = false,
		opts = {},
		keys = {
			{"-", "<CMD>Oil<CR>", desc = "Open parent directory"},
		},
	},
	{
		"ggandor/leap.nvim",
		lazy = false,
		opts = {},
		config = function()
			require('leap').create_default_mappings()
		end,
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
		lazy = false,
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
				ensure_installed = {
					"lua_ls",
					"rust_analyzer",
					"gopls",
					"templ",
					"html",
					"cssls",
					"emmet_language_server",
					"htmx",
					"tailwindcss",
					"ts_ls",
					"pylsp",
					"clangd",
					"yamlls",
					"jsonls",
					"eslint",
					"sqlls",
					"intelephense",
					"nim_langserver",
				},
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

			local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

			require 'lspconfig'.intelephense.setup {
				capabilities = capabilities,
				on_attach = lsp_attach,
				settings = {
					intelephense = {
						-- possible values: stubs.txt
						stubs = {
							'Core',
							'Reflection',
							'SPL',
							'SimpleXML',
							'ctype',
							'date',
							'exif',
							'filter',
							'hash',
							'imagick',
							'json',
							'pcre',
							'random',
							'standard',
						}
					}
				}
			}


			require'lspconfig'.phpactor.setup{
				capabilities = capabilities,
				on_attach = lsp_attach,
				init_options = {
					["language_server_phpstan.enabled"] = false,
					["language_server_psalm.enabled"] = false,
				}
			}
		end
	},
	{
		"folke/zen-mode.nvim",
		keys = {
			{"<leader>z", desc="Zen mode", function()
				require("zen-mode").toggle()
				if zen == false then
					vim.wo.wrap = false
					zen = true
				else
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
	{
		"mbbill/undotree",
		keys = {
			{"<leader>rd", ":UndotreeToggle<CR>", desc="Toggle undo tree"}
		},
	},
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
		keys = {
			{"<leader>ot", ":ObsidianTemplate<CR>", desc="Open Templates"},
			{"<leader>od", ":ObsidianToday<CR>", desc="Open Today's daily"},
			{"<leader>ob", ":ObsidianBacklinks<CR>", desc="Open backlinks"},
			{"<leader>oo", ":ObsidianOpen<CR>", desc="Open in obsidian"}
		}
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
		'nvim-neo-tree/neo-tree.nvim',
		dependencies = {
			{"nvim-lua/plenary.nvim"},
			{"nvim-tree/nvim-web-devicons"}, -- not strictly required, but recommended
			{"MunifTanjim/nui.nvim"},
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
	require("config.colorschemes"),
}

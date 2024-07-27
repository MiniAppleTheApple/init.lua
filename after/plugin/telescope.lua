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

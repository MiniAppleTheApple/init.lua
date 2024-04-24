local zen = false

vim.wo.rnu = true
vim.wo.number = true

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<leader>z", function()
	require("zen-mode").toggle()
	if zen == false then
		vim.wo.wrap = false
		zen = true
	else
		vim.wo.wrap = true
		zen = false
	end
end)

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>rd', vim.cmd.UndotreeToggle, {})


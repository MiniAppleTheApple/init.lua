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

vim.keymap.set('n', '<leader>rd', vim.cmd.UndotreeToggle, {})


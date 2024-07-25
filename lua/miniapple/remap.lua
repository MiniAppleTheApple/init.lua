local zen = false



vim.g.mapleader = " "
vim.keymap.set("n", "<leader>ex", vim.cmd.Ex)

vim.keymap.set("n", "<leader>z", function()
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
end)

vim.keymap.set('n', '<leader>rd', vim.cmd.UndotreeToggle, {})


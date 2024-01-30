local zen = false

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<leader>z", function()
	require("zen-mode").toggle()
	if zen == false then
		vim.wo.wrap = false
    		vim.wo.number = true
    		vim.wo.rnu = true
		zen = true
	else
		vim.wo.wrap = true
    		vim.wo.number = false
    		vim.wo.rnu = false 
		zen = false
	end
end)

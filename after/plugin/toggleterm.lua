require('toggleterm').setup({
	direction = "float"
})

vim.keymap.set("n", "<S-t>", ":ToggleTerm<CR>")

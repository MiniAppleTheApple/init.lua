require("trouble").setup()

vim.keymap.set("n", "<leader>xx", ":Trouble diagnostics toggle<CR>")
vim.keymap.set("n", "<leader>xt", ":Trouble todo<CR>")

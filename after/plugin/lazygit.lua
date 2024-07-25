vim.api.nvim_create_autocmd('BufEnter',  { command = ":lua require('lazygit.utils').project_root_dir()"}) 
vim.api.nvim_create_autocmd('VimEnter',  { command = ":Neotree"}) 

vim.keymap.set('n', '<leader>gt', ':lua require("telescope").extensions.lazygit.lazygit()<CR>')
vim.keymap.set('n', '<leader>gg', ':LazyGit<CR>')
vim.keymap.set('n', '<leader>gf', ':LazyGitFilter<CR>')
vim.keymap.set('n', '<leader>gc', ':LazyGitFilterCurrentFile<CR>')

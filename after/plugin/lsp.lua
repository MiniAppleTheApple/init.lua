local lspconfig = require("lspconfig")

vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})

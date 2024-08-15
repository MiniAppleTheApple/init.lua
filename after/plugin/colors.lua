vim.o.background = 'dark'

-- sonokai 
vim.g.sonokai_style = 'andromeda'
vim.g.sonokai_better_performance = 1

-- gruvbox-material
vim.g.gruvbox_material_deisable_italic_comment = 1
vim.g.gruvbox_material_foreground = 'material'
vim.g.gruvbox_material_background = 'soft'
vim.g.gruvbox_material_better_performance = 1
-- everforest
vim.g.everfoest_background = 'medium'
-- ayu
require("ayu").setup({
	mirage = true
})
-- gruvbox
vim.g.gruvbox_italic = 1
vim.g.gruvbox_contrast_dark = 'soft'

require('gruvbox').setup({
	contrast = "medium"
})
-- edge
vim.g.edge_style = 'aura'
vim.g.edge_better_performance = 1
-- seoul
vim.g.seoul256_background = 234

require("neomodern").setup({
	style = "darkforest",
})

require("nightfall").setup()

require("current-theme")

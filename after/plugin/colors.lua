function sonokai()
	vim.g.sonokai_style = 'andromeda'
	vim.g.sonokai_better_performance = 1
	vim.cmd [[colorscheme sonokai]]
end

function gruvbox_material()
	vim.g.gruvbox_material_deisable_italic_comment = 1
	vim.g.gruvbox_material_foreground = 'material'
	vim.g.gruvbox_material_background = 'soft'
	vim.g.gruvbox_material_better_performance = 1
	vim.cmd [[colorscheme gruvbox-material]]
end

function tomorrow()
	vim.cmd [[colorscheme base16-tomorrow-night-eighties]]
end

function everforest()
	vim.g.everfoest_background = 'medium'
	vim.cmd [[colorscheme everforest]]
end

function kanagawa()
	vim.cmd [[colorscheme kanagawa]]
end

kanagawa()

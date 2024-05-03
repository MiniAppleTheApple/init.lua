vim.o.background = 'dark'

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

function one_dark_pro()
	vim.cmd [[colorscheme one]]
end

function ayu()
	vim.api.nvim_exec("let ayucolor='mirage'", true)
	vim.cmd [[colorscheme ayu]]
end

function dogrun()
	vim.cmd [[colorscheme dogrun]]
end

function papercolor()
	vim.api.nvim_exec("set t_Co=256", true)
	vim.cmd [[colorscheme PaperColor]]
end

function lucid()
	vim.cmd [[colorscheme lucid]]
end

function space_vim()
	vim.cmd [[colorscheme space-vim-dark]]
end

function deep_space()
	vim.cmd [[colorscheme deep-space]]
end

function random_select(list)
	return list[math.floor(math.random() * #list) + 1]
end
-- local f = random_select({sonokai, gruvbox_material, tomorrow, everforest, kanagawa, one_dark_pro, ayu, dogrun, space_vim})
-- f()

deep_space()


vim.o.background = 'dark'

function tokyo_night()
	vim.cmd [[colorscheme tokyonight]]
end

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

function everforest()
	vim.g.everfoest_background = 'medium'
	vim.cmd [[colorscheme everforest]]
end

function kanagawa()
	vim.cmd [[colorscheme kanagawa]]
end

function ayu()
	vim.api.nvim_exec("let ayucolor='mirage'", true)
	vim.cmd [[colorscheme ayu]]
end

function dogrun()
	vim.cmd [[colorscheme dogrun]]
end

function solarized()
	vim.cmd [[colorscheme solarized8]]
end

function rose_pine()
	vim.cmd [[colorscheme rose-pine-moon]]
end

function gruvbox()
	vim.g.gruvbox_italic = 1
	vim.cmd [[colorscheme gruvbox]]
end

function one_dark_pro()
	vim.cmd [[colorscheme onedark]]
end

function edge()
	vim.g.edge_style = 'aura'
        vim.g.edge_better_performance = 1

	vim.cmd [[colorscheme edge]]
end

function nord()
	vim.cmd[[colorscheme nord]]
end

function bamboo()
	vim.cmd [[colorscheme bamboo]]
end

function night_owl()
	vim.cmd [[colorscheme night-owl]]
end

function nordic()
	vim.cmd [[colorscheme nordic]]
end

function random_select(list)
	return list[math.floor(math.random() * #list) + 1]
end

nordic()

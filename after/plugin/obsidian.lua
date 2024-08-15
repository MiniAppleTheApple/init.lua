require("obsidian").setup({
	ui = {
		enable = false
	},
	workspaces = {
		{
		  name = "notes",
		  path = "~/project/notes",
		},
	},
	templates = {
      		folder = "07 Templates",
      		date_format = "%Y-%m-%d-%a",
      		time_format = "%H:%M",
	},
	follow_url_func = function(url)
		vim.fn.jobstart({"xdg-open", url})
	end,
})

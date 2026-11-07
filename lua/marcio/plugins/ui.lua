return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	init = function()
		vim.opt.showmode = false -- lualine already shows the mode
	end,
	opts = {
		options = {
			theme = "catppuccin-nvim", -- follows the active catppuccin flavour
			icons_enabled = false, -- no Nerd Font required
			component_separators = { left = "│", right = "│" },
			section_separators = { left = "", right = "" },
			globalstatus = true, -- one statusline across splits
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diff", "diagnostics" },
			lualine_c = { { "filename", path = 1 } },
			lualine_x = { "filetype" },
			lualine_y = { "progress" },
			lualine_z = { "location" },
		},
	},
}

return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	init = function()
		vim.opt.showmode = false -- lualine already shows the mode
		vim.opt.cmdheight = 0 -- command line only appears while typing `:`
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
			lualine_x = {
			-- with cmdheight=0 Neovim no longer shows "recording @q" itself
			{
				function() return "recording @" .. vim.fn.reg_recording() end,
				cond = function() return vim.fn.reg_recording() ~= "" end,
				color = { fg = "#f38ba8", gui = "bold" },
			},
			"filetype",
		},
			lualine_y = { "progress" },
			lualine_z = { "location" },
		},
	},
}

return {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false,
	priority = 1000, -- load before everything else
	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
			transparent_background = true, -- let the terminal background/image show through
			term_colors = true,
			styles = {
				comments = { "italic" },
				keywords = { "italic" },
				conditionals = { "italic" },
				types = {},
			},
			-- squiggly underlines for LSP diagnostics
			lsp_styles = {
				underlines = {
					errors = { "undercurl" },
					hints = { "undercurl" },
					warnings = { "undercurl" },
					information = { "undercurl" },
				},
			},
			-- integrations (cmp, telescope, mason, ...) are auto-detected from lazy.nvim
			auto_integrations = true,
			custom_highlights = function(c)
				return {
					-- floats and popups transparent too, with a visible border
					NormalFloat = { bg = "none" },
					FloatBorder = { fg = c.blue, bg = "none" },
					TelescopeBorder = { fg = c.blue, bg = "none" },
					CursorLine = { bg = c.surface0 },
					CursorLineNr = { fg = c.peach, style = { "bold" } },
					LineNr = { fg = c.overlay0 },
				}
			end,
		})
		vim.cmd.colorscheme("catppuccin")
	end,
}

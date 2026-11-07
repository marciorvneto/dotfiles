return {
	{
		"tpope/vim-fugitive",
		cmd = { "Git", "G" },
		keys = { { "<leader>gs", vim.cmd.Git, desc = "Git status" } },
	},

	{
		"junegunn/vim-easy-align",
		keys = { { "ga", "<Plug>(EasyAlign)", mode = { "n", "x" }, desc = "Easy align" } },
		init = function()
			-- \  aligns trailing backslashes (macro line continuations)
			vim.g.easy_align_delimiters = {
				["\\"] = { pattern = [[\\$]], left_margin = 1, right_margin = 0 },
			}
		end,
	},

	{ "godlygeek/tabular", cmd = "Tabularize" },

	{
		"sbdchd/neoformat",
		lazy = false,
		config = function()
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = vim.api.nvim_create_augroup("marcio-neoformat", { clear = true }),
				callback = function()
					local ft = vim.bo.filetype
					if ft ~= "c" and ft ~= "cpp" then
						vim.cmd("Neoformat")
					end
				end,
			})
		end,
	},

	-- Maintained fork of norcalli/nvim-colorizer.lua (which is archived)
	{
		"catgoose/nvim-colorizer.lua",
		event = "BufReadPre",
		opts = { filetypes = { "*", "!vim" } },
	},

	-- Correct commentstring inside embedded languages (JSX, Vue, ...).
	-- Commenting itself is built in since Neovim 0.10: gc / gcc.
	{ "JoosepAlviste/nvim-ts-context-commentstring", opts = {} },
}

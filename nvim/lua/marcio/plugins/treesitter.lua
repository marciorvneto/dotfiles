return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master", -- the `main` branch is a rewrite with a different API
	lazy = false,
	build = ":TSUpdate",
	main = "nvim-treesitter.configs",
	opts = {
		ensure_installed = { "c", "lua", "javascript", "typescript", "python", "vim", "vimdoc" },
		sync_install = false,
		auto_install = true,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
	},
}

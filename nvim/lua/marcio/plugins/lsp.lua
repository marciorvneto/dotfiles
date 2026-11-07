-- Mason installs servers; mason-lspconfig calls vim.lsp.enable() for every
-- installed server; nvim-lspconfig only supplies the default server configs
-- (lsp/*.lua). The actual LSP setup lives in lua/marcio/lsp.lua.
return {
	{ "mason-org/mason.nvim", opts = {} },
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			require("marcio.lsp")
			require("mason-lspconfig").setup({
				ensure_installed = { "ts_ls", "eslint", "rust_analyzer" },
				-- automatic_enable = true (default): enables all installed servers
			})
		end,
	},
}

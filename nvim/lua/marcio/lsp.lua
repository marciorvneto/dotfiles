-- Native LSP setup (Neovim 0.11+)

-- Settings shared by every server: completion capabilities from nvim-cmp
vim.lsp.config("*", {
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
})

-- Per-server tweaks: vim.lsp.config("<name>", { ... }) merges over the
-- nvim-lspconfig defaults. Make lua_ls aware of the Neovim runtime.
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			diagnostics = { globals = { "vim" } },
			workspace = { library = { vim.env.VIMRUNTIME }, checkThirdParty = false },
		},
	},
})

vim.diagnostic.config({
	virtual_text = { virt_text_pos = "eol" }, -- off by default since 0.11
	severity_sort = true,
	float = { border = "rounded" },
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "✘",
			[vim.diagnostic.severity.WARN] = "▲",
			[vim.diagnostic.severity.HINT] = "⚑",
			[vim.diagnostic.severity.INFO] = "»",
		},
	},
})

-- Diagnostic keymaps (global)
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end)
vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

-- Buffer-local keymaps once a server attaches
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("marcio-lsp-attach", { clear = true }),
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)

		-- clang-format is handled elsewhere; don't let clangd format
		if client and client.name == "clangd" then
			client.server_capabilities.documentFormattingProvider = false
			client.server_capabilities.documentRangeFormattingProvider = false
		end

		local function map(lhs, rhs, desc)
			-- nowait: `gr` would otherwise wait for 0.11's default grn/gra/grr/gri maps
			vim.keymap.set("n", lhs, rhs, { buffer = ev.buf, nowait = true, desc = desc })
		end

		map("gD", vim.lsp.buf.declaration, "Declaration")
		map("gd", vim.lsp.buf.definition, "Definition")
		map("gi", vim.lsp.buf.implementation, "Implementation")
		map("gr", vim.lsp.buf.references, "References")
		map("K", function() vim.lsp.buf.hover({ border = "rounded" }) end, "Hover")
		map("<leader>vd", vim.diagnostic.open_float, "Line diagnostics")
		map("<space>D", vim.lsp.buf.type_definition, "Type definition")
		map("<space>rn", vim.lsp.buf.rename, "Rename")
		map("<space>ca", vim.lsp.buf.code_action, "Code action")
		map("<space>f", function() vim.lsp.buf.format({ async = true }) end, "Format")
		map("<space>wa", vim.lsp.buf.add_workspace_folder, "Add workspace folder")
		map("<space>wr", vim.lsp.buf.remove_workspace_folder, "Remove workspace folder")
		map("<space>wl", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, "List workspace folders")
	end,
})

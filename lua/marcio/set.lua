
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

vim.opt.incsearch = true

vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.updatetime = 50
vim.opt.wrap = false

vim.filetype.add({ extension = { flex = "lex" } })

vim.opt.cursorline = true
vim.opt.signcolumn = "yes" -- stop text jumping when LSP diagnostics appear
vim.opt.autoread = true    -- with tmux focus-events, picks up external file changes

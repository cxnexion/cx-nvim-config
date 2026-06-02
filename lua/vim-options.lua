vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.g.mapleader = " "
vim.wo.relativenumber = true
vim.wo.number = true

-- Clipboard settings
vim.g.clipboard = {
	copy = { ["+"] = "wl-copy" },
	paste = { ["+"] = "wl-paste --no-newline" },
	cache_enabled = true,
}

vim.diagnostic.config({
	virtual_text = true, -- shows error text inline at end of line
	signs = true,
	underline = true,
	update_in_insert = false,
	float = {
		border = "rounded",
		source = true, -- shows which LSP/linter is reporting
	},
})
vim.keymap.set("n", "<leader>n", vim.diagnostic.open_float, { desc = "Show line diagnostics" })

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

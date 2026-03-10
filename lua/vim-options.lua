vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
vim.wo.relativenumber = true
vim.wo.number = true

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

vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, {})

vim.api.nvim_create_autocmd("User", { -- lazy loading here so it's not requiring when wk isn't ready
	pattern = "VeryLazy",
	callback = function()
		local wk = require("which-key")
		wk.add({
			{ "<leader>d", desc = "Open Diagnostic" },
		})
	end,
})

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

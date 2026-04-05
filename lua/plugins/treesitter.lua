return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	lazy = false,
	config = function()
		local config = require("nvim-treesitter.config")

		config.setup({
			auto_install = true,
			ensure_installed = { "lua", "go", "rust", "javascript", "svelte" },
			highlight = { enable = true },
			indent = { enable = true },
		})

		vim.api.nvim_create_autocmd("FileType", {
			callback = function()
				pcall(vim.treesitter.start, buf)
			end,
		})
	end,
}

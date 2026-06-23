return {
	{
		"williamboman/mason.nvim",
		opts = {},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			handlers = {
				function(server_name)
					vim.lsp.enable(server_name)
				end,
				["oxlint"] = function()
					vim.lsp.config("oxlint", {})
					vim.lsp.enable("oxlint")
				end,
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("blink.cmp").get_lsp_capabilities()
			vim.lsp.config("*", { capabilities = capabilities })

			vim.lsp.enable("gleam")
			vim.lsp.enable("clangd")
			vim.lsp.config("zls", {
				cmd = { vim.fn.expand("$HOME") .. "/.local/share/zvm/bin/zls" },
			})
			vim.lsp.enable("zls")
			vim.lsp.config("gdscript", {
				cmd = vim.lsp.rpc.connect("127.0.0.1", 6005),
			})
			vim.lsp.enable("gdscript")

			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = "*.gd",
				callback = function()
					vim.lsp.buf.format({ async = false })
				end,
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
		end,
	},
}

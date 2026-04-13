return {
	{
		"williamboman/mason.nvim",
		opts = {},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"lua_ls",
				"rust_analyzer",
				"vtsls",
				"emmet_ls",
				"gopls",
				"cssls",
				"oxlint",
			},
			handlers = {
				function(server_name)
					vim.lsp.enable(server_name)
				end,
				["lua_ls"] = function()
					vim.lsp.config("lua_ls", {
						settings = { Lua = { diagnostics = { globals = { "vim" } } } },
					})
					vim.lsp.enable("lua_ls")
				end,
				["vtsls"] = function()
					vim.lsp.config("vtsls", {
						settings = { typescript = { tsserver = { maxTsServerMemory = 512 } } },
					})
					vim.lsp.enable("vtsls")
				end,
				["rust_analyzer"] = function()
					vim.lsp.config("rust_analyzer", {
						settings = { ["rust-analyzer"] = { check = { command = "clippy" } } },
					})
					vim.lsp.enable("rust_analyzer")
				end,
				["oxlint"] = function()
					vim.lsp.config("oxlint", {})
					vim.lsp.enable("oxlint")
				end,
				["emmet_ls"] = function()
					vim.lsp.config("emmet_ls", {
						filetypes = {
							"css",
							"html",
							"javascript",
							"javascriptreact",
							"sass",
							"scss",
							"less",
							"typescriptreact",
						},
					})
					vim.lsp.enable("emmet_ls")
				end,
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			vim.lsp.config("*", { capabilities = capabilities })

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

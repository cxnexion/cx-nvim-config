return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>gf",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
			mode = "",
			desc = "Format File",
		},
	},
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { "oxfmt" },
			typescript = { "oxfmt" },
			javascriptreact = { "oxfmt" },
			typescriptreact = { "oxfmt" },
			html = { "oxfmt" },
			css = { "oxfmt" },
			json = { "oxfmt" },
			markdown = { "oxfmt" },
			toml = { "taplo" },
			go = { "goimports", "gofmt" },
			rust = { "rustfmt" },
			gdscript = { "gdformat" },
		},
		format_on_save = {
			timeout_ms = 300,
			lsp_format = "fallback",
		},
		formatters = {
			oxfmt = {
				command = "oxfmt",
				args = { "--stdin-filepath", "$FILENAME" },
			},
		},
	},
}

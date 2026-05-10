return {
	{
		"nvim-telescope/telescope.nvim",
		version = "*",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		config = function()
			local themes = require("telescope.themes")

			local set_hl = vim.api.nvim_set_hl

			set_hl(0, "TelescopePromptTitle", { link = "IncSearch", default = false })
			set_hl(0, "TelescopeResultsTitle", { link = "DiffAdd", default = false })
			set_hl(0, "TelescopePreviewTitle", { link = "DiffChange", default = false })

			require("telescope").setup({
				defaults = {
					borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
					sorting_strategy = "ascending",
					layout_strategy = "horizontal",
					layout_config = {
						horizontal = {
							prompt_position = "bottom",
							preview_width = 0.5,
						},
						width = 0.9,
						height = 0.8,
					},
				},
				extensions = {
					["ui-select"] = {
						themes.get_dropdown({}),
					},
				},
			})

			require("telescope").load_extension("ui-select")
			require("telescope").load_extension("fzf")

			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<C-p>", builtin.find_files, {})
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope Grep" })
		end,
	},
}

return {
	"ziontee113/icon-picker.nvim",
	lazy = VeryLazy,
	dependencies = {
		"stevearc/dressing.nvim",
		"folke/which-key.nvim",
	},
	config = function()
		require("icon-picker").setup({ disable_legacy_commands = true })

		vim.keymap.set("n", "<leader>fi", "<cmd>IconPickerNormal<cr>", { desc = "Find Icon" })
	end,
}

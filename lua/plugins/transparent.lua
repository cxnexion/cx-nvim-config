return {
	"xiyaowong/transparent.nvim",
	vim.keymap.set("n", "<leader>tr", ":TransparentToggle<CR>", { desc = "Toggle Transparency" }),
	config = function()
		require("transparent").setup({
			extra_groups = {
				"NeoTreeNormal",
				"NeoTreeNormalNC",
				"NormalFloat",
			},
		})

		-- This is the "magic" line for Lualine
		require("transparent").clear_prefix("lualine")
		require("transparent").clear_prefix("NeoTree")
	end,
}

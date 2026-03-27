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
	end,
}

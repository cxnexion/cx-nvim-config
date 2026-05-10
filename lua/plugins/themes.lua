return {
	{
		"catppuccin/nvim",
		lazy = false,
		name = "catppuccin",
	},
	{
		"vague-theme/vague.nvim",
		lazy = false,
		config = function()
			require("vague").setup({
				transparent = false,
				italic = true,
			})
		end,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = false,
		config = function()
			require("rose-pine").setup({
				variant = "moon",
				styles = {
					transparency = false,
				},
			})
		end,
	},
}

return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup({
				open_mapping = [[<c-\>]],
				direction = "float",
			})
      local wk = require("which-key")
      wk.add({{[[<c-\>]], desc = "Toggle Terminal"}})
		end,
	},
}

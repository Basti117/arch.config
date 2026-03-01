local active = require("themes.loader").get_theme()

return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = not active:find("catppuccin"),
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
			})
		end,
	},
	{
		"neanias/everforest-nvim",
		name = "everforest",
		version = false,
		lazy = not active:find("everforest"),
		priority = 1000,
	},
}

return {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false,
	priority = 1000, -- Make sure to load this before all the other start plugins.
	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
			color_overrides = {
				mocha = {
					base = "#32302f",
					mantle = "#2b2928",
					crust = "#242221",

					surface0 = "#4A4847",
					surface1 = "#545251",
					surface2 = "#5e5c5b",

					text = "#fbf1c7",
					subtext1 = "#ebdbb2",
					subtext0 = "#d5c4a1",

					blue = "#84A298",
					teal = "#84A298",

					green = "#c0cab0",
					yellow = "#fbf1c7",
					peach = "#c0cab0",
					red = "#b06f6f",
					mauve = "#a05c78",
					lavender = "#8fb6f4",
					flamingo = "#b06f6f",
					rosewater = "#fbf1c7",
				},
			},
		})
		vim.cmd.colorscheme("catppuccin")
		vim.o.termguicolors = true
	end,
}

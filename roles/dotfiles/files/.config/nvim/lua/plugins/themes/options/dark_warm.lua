return {
	{
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

						text = "#faf0f4",
						subtext1 = "#faf0f4",
						subtext0 = "#faf0f4",

						blue = "#84A298",
						teal = "#84A298",

						green = "#c0cab0",
						yellow = "#fbf1c7",
						peach = "#d6b09b",
						red = "#b06f6f",
						mauve = "#a05c78",
						lavender = "#8fb6f4",
						flamingo = "#d692aa",
						rosewater = "#d692aa",
					},
				},
			})
			vim.cmd.colorscheme("catppuccin")
			vim.o.termguicolors = true
		end,
	},
}

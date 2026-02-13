return {
	"brenoprata10/nvim-highlight-colors",
	event = { "BufReadPost", "BufNewFile" },
	opts = {
		render = "background",
		enable_named_colors = true,
		enable_tailwind = false,
		filetypes = { "*" },
	},
	config = function(_, opts)
		require("nvim-highlight-colors").setup(opts)
	end,
}

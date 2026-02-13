-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

require("lazy").setup({
	{ import = "plugins.blink" },
	{ import = "plugins.catppuccin" },
	{ import = "plugins.conform" },
	{ import = "plugins.gitsigns" },
	{ import = "plugins.guess-indent" },
	{ import = "plugins.lazydev" },
	{ import = "plugins.mini" },
	{ import = "plugins.nvim-highlight-colors" },
	{ import = "plugins.nvim-lspconfig" },
	{ import = "plugins.nvim-treesitter" },
	{ import = "plugins.telescope" },
	{ import = "plugins.todo-comments" },
	{ import = "plugins.which-key" },
})

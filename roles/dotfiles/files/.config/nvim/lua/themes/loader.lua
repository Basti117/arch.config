local M = {}

function M.get_theme()
	return require("themes.active").name
end

function M.load()
	vim.cmd.colorscheme(M.get_theme())
end

return M

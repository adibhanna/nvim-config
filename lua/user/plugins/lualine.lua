local status, lualine = pcall(require, "lualine")
if not status then
	return
end

local gruvbox = require("lualine.themes.gruvbox")

lualine.setup({
	options = {
		theme = gruvbox,
		icons_enabled = true,
	},
	sections = {
		lualine_b = { "branch", "diff", "diagnostics" },
	},
})

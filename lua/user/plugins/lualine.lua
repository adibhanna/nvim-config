local status, lualine = pcall(require, "lualine")
if not status then
	return
end

local ayu = require("lualine.themes.ayu")

lualine.setup({
	options = {
		theme = ayu,
		icons_enabled = true,
	},
	sections = {
		lualine_b = { "branch", "diff", "diagnostics" },
	},
})

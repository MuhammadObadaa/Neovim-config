--local colorscheme = "material-deep-ocean"
local colorscheme = "material-darker"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme) -- .. it's the concatination operation

if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end

require("material").setup({
	disable = {
		-- ... other settings
		background = true,
	},
	lualine_style = "stealth", -- the stealth style
})

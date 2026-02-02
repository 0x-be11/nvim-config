function ColorIt(color)
	color = color or "tundra"
	vim.cmd.colorscheme(color)
	vim.api.nvim_set_hl(0, "Normal", {guibg=NONE, ctermbg=NONE})
	vim.api.nvim_set_hl(0, "NormalNC", {guibg=NONE, ctermbg=NONE})
	vim.api.nvim_set_hl(0, "NormalSB", {guibg=NONE, ctermbg=NONE})
end

ColorIt()


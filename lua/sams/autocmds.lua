local generalSettingsGroup = vim.api.nvim_create_augroup('General settings', {clear = true})

vim.api.nvim_create_autocmd("BufEnter", {
	group = generalSettingsGroup,
	pattern = {'*.{hs,asm,c,h,sh}'},
	callback = function()
		vim.opt.tabstop = 2
		vim.opt.shiftwidth = 2
		vim.opt.expandtab = true
		--print('2 space mode...')
	end,
})

vim.api.nvim_create_autocmd("BufLeave", {
	group = generalSettingsGroup,
	pattern = {'*.{hs,asm,c,h,sh}'},
	callback = function()
		vim.opt.tabstop = 4
		vim.opt.shiftwidth = 4
		vim.opt.expandtab = false
		--print('Normal mode...')
	end,
})

vim.api.nvim_create_autocmd("BufEnter", {
	group = generalSettingsGroup,
	pattern = {'*.md'},
	callback = function()
		require('render-markdown').enable()
		--print('Rendering markdown')
	end,
})

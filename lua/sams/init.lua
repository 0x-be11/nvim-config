require('sams/remaps')
require('sams/packer')
require('sams/colors')
require('sams/autocmds')

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.incsearch = true
vim.opt.termguicolors = false

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.lsp.enable("jdtls")

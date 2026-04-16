local lsp = require('lspconfig').util.default_config

--vim.lsp.config('hls', {
--	cmd = { "haskell-language-server-wrapper", "--lsp" },
--	filetypes = { 'haskell', 'lhaskell' },
--	root_markers = { 'hie.yaml', 'stack.yaml', 'cabal.project', '*.cabal', 'package.yaml', '*.hs' },
--	settings = {
--		haskell = {
--			formattingProvider = "ormolu",
--		},
--	},
--	capabilities = capabilities,
--})
--vim.lsp.enable('hls')
--vim.lsp.completion.enable(true)
--require('lspconfig').hls.setup = function() end
vim.lsp.config('hls', {
	cmd = {"haskell-language-server-wrapper", "--lsp" },
	filetypes = { 'haskell', 'lhaskell', 'cabal' },
	root_markers = { '*.cabal', 'stack.yaml', 'cabal.project', 'package.yaml', 'hie.yaml' },
})
vim.lsp.enable('hls')

require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = {'clangd', 'rust_analyzer', 'lua_ls'},
	handlers = {
		function(server_name)
			require('lspconfig')[server_name].setup({}) -- add . before []?
		end,
		["hls"] = function() end,
	--	["coq_lsp"] = function()
	--		require('lspconfig').coq_lsp.setup({
	--			filetypes = {},
	--			autostart = false,
	--			cmd = {
	--				"coq-lsp",
	--				"--max-memory", "2G",
	--				"-j", "2"
	--			},
	--			settings = {
	--				coq = {
	--					background_checking = false,
	--				}
	--			}
	--		})
	--	end,
	},
})

local cmp = require('cmp')
local cmp_select = {behaviour = cmp.SelectBehavior.Select}
local cmp_mappings = cmp.mapping.preset.insert({
	['<C-b>'] = cmp.mapping.select_prev_item(cmp_select), -- "back" - next to "n" on qwerty
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select), -- "next"
	['<C-m>'] = cmp.mapping.confirm({ select = true }), -- adj. to n
	["<C-Space>"] = cmp.mapping.complete(),
})

vim.api.nvim_create_autocmd('LspAttach', {
	desc = 'LSP Actions',
	callback = function(event)
		local opts = {buffer = event.buf}

		vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
		vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
		vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
		vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
		vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts)
		vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts)
		vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
		vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
		vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
		vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
	end,
})

require("luasnip.loaders.from_vscode").lazy_load()
cmp.setup({
	sources = {
		{name = 'nvim_lsp'},
		{name = 'path'},
		{name = 'luasnip'},
	},
	snippet = {
		expand = function(args)
			--vim.snippet.expand(args.body)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = cmp_mappings,
})

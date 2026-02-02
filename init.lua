require('sams')

--require('gai')
-- Chat commands
vim.keymap.set("n", "<leader>gc", ":GaiChatOpen<CR>", { desc = "Open Gemini Chat buffer" })
vim.keymap.set("n", "<leader>gs", ":GaiChatSend<CR>", { desc = "Send buffer to Gemini" })

-- Code generation
vim.keymap.set("n", "<leader>gC", ":GaiCode<CR>", { desc = "Generate code from prompt" })

-- Visual rewrite
vim.keymap.set("v", "<leader>gr", ":'<,'>GaiRewrite<CR>", { desc = "Rewrite visual selection" })

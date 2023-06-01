-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set({ "n", "x", "o" }, "<leader>h", "^", { desc = "First character" })
vim.keymap.set({ "n", "x", "o" }, "<leader>l", "g_", { desc = "Last character" })

vim.keymap.set("n", "gl", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })

-- add undo break point
vim.keymap.set("i", "{", "{<c-g>u")
vim.keymap.set("i", "(", "(<c-g>u")
vim.keymap.set("i", " ", " <c-g>u")
vim.keymap.set("i", "$", "$<c-g>u")

-- Replace words
vim.keymap.set("n", "<leader>se", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Rename word" })

-- Paste with deleting selected text
vim.keymap.set("x", "<leader>p", [["_dP]])

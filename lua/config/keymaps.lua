-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<c-s>', ':w<CR>', {})
vim.keymap.set('i', '<c-s>', '<Esc>:w<CR>a', {})
vim.keymap.set('n', '<c-j>', '<c-w>j', opts)
vim.keymap.set('n', '<c-h>', '<c-w>h', opts)
vim.keymap.set('n', '<c-k>', '<c-w>k', opts)
vim.keymap.set('n', '<c-l>', '<c-w>l', opts)
vim.keymap.set({ 'n', 'x', 'o' }, '<leader>h', '^')
vim.keymap.set({ 'n', 'x', 'o' }, '<leader>l', 'g_')
-- Resize with arrows
vim.keymap.set('n', '<C-Up>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<C-Down>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-- Visual --
-- Stay in indent mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Move text up and down
vim.keymap.set('n', '<A-j>', ':m .+1<CR>==', opts)
vim.keymap.set('n', '<A-k>', ':m .-2<CR>==', opts)

vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv-gv", opts)
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv-gv", opts)
vim.keymap.set('v', 'p', '"_dP', opts)

-- Buuferline
-- Tab switch buffer
vim.keymap.set('n', '<S-l>', ':BufferLineCycleNext<CR>', opts)
vim.keymap.set('n', '<S-h>', ':BufferLineCyclePrev<CR>', opts)

-- -- Close buffer
-- function DeleteCurrentBuffer()
--   local cbn = vim.api.nvim_get_current_buf()
--   local buffers = vim.fn.getbufinfo({ buflisted = true })
--   local size = 0
--   local idx = 0
--   for n, e in ipairs(buffers) do
--     size = size + 1
--     if e.bufnr == cbn then
--       idx = n
--     end
--   end
--   if idx == 0 then
--     -- return
--     vim.cmd('NvimTreeFocus')
--   end
--   if idx == size then
--     vim.cmd('bprevious')
--   else
--     vim.cmd('bnext')
--   end
--   vim.cmd('bdelete ' .. cbn)
-- end

-- vim.keymap.set('n', '<leader>d', '<cmd>lua DeleteCurrentBuffer()<cr>', opts)

-- -- Close Tab
-- vim.keymap.set('n', '<S-q>', '<cmd>bdelete<CR>', opts)

-- Delete prev word
vim.keymap.set('i', '<C-H>', '<C-W>', opts)

-- Paste with deleting selected text
vim.keymap.set('x', '<leader>p', [["_dP]], opts)
-- Replace words
vim.keymap.set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Telescope
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = 'Find files' })
vim.keymap.set('n', '<leader>fF', require('telescope.builtin').git_files, { desc = 'Git files' })
vim.keymap.set('n', '<leader>fw', require('telescope.builtin').live_grep, { desc = 'Live grep' })
vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, { desc = 'Find buffers' })
vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = 'Help tags' })

-- LSP
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', 'gl', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

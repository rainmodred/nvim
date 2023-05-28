vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.wrap = false

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 600

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true
vim.o.relativenumber = true
-- vim.o.expandtab = true

-- vim.o.shiftwidth = 3
-- vim.o.softtabstop = 3
-- vim.o.fileencoding = "utf-8"
-- vim.o.completeopt = { "menuone", "noselect" }
-- vim.o.scrolloff = 8
-- vim.o.sidescrolloff = 8
-- vim.o.cursorline = true
-- vim.o.fileformat = "unix"
-- --fix right nvim-tree
-- vim.o.splitright = true
-- vim.o.showmode = false

-- vim.o.foldmethod = "expr"
-- vim.o.foldexpr = "nvim_treesitter#foldexpr()"
-- vim.o.foldlevelstart = 99
-- vim.o.wrap = false

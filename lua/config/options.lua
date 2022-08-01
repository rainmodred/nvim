local opt = vim.opt

opt.number = true
opt.signcolumn = "yes"
opt.relativenumber = true
opt.mouse = "a"
opt.expandtab = true
opt.shiftwidth = 2
opt.softtabstop = 2
opt.ignorecase = true
opt.smartcase = true
opt.fileencoding = "utf-8"
opt.termguicolors = true
opt.completeopt = { "menuone", "noselect" }
opt.clipboard = "unnamedplus"
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.cursorline = true
opt.fileformat = "unix"
opt.timeoutlen = 1000
--fix right nvim-tree
opt.splitright = true

-- opt.foldmethod = "expr"
-- opt.foldexpr = "nvim_treesitter#foldexpr()"

--vim.g.ayucolor = "light"
--vim.cmd([[colorscheme ayu]])

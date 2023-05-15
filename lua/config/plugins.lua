local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {

  "lewis6991/impatient.nvim",
  "nvim-lua/plenary.nvim",
  -- Themes
  "lunarvim/darkplus.nvim",
  { "projekt0n/github-nvim-theme" },
  "folke/tokyonight.nvim",
  -- cmp plugins
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "hrsh7th/nvim-cmp",
  -- snippets
  "L3MON4D3/LuaSnip",
  "saadparwaiz1/cmp_luasnip",
  -- lsp
  {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
  "jose-elias-alvarez/null-ls.nvim",
  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    version = "0.1.1",
  },
  -- Comment
  { "JoosepAlviste/nvim-ts-context-commentstring" },
  {
    "numToStr/Comment.nvim",
  },
  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
  },

  -- Smooth scroll
  "karb94/neoscroll.nvim",

  -- Nvim tree
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    version = "*",
  },

  -- Bufferline
  { "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },
  -- Autopairs
  {
    "windwp/nvim-autopairs",
    "windwp/nvim-ts-autotag",
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
  },
  -- Which-key
  {
    "folke/which-key.nvim",
  },

  { "gpanders/editorconfig.nvim" },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
  },

  -- Gitsigns
  {
    "lewis6991/gitsigns.nvim",
  },
  { "sindrets/diffview.nvim", dependencies = "nvim-lua/plenary.nvim" },
}

local opts = {}
require("lazy").setup(plugins, opts)

--Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

vim.cmd([[packadd packer.nvim]])
packer.startup(function()
  use("wbthomason/packer.nvim")
  use("lewis6991/impatient.nvim")
  use("nvim-lua/plenary.nvim")

  -- Themes
  use("lunarvim/darkplus.nvim")
  use("Shatur/neovim-ayu")
  use({ "projekt0n/github-nvim-theme" })

  -- cmp plugins
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-buffer") -- buffer completions
  use("hrsh7th/cmp-path") -- path completions
  use("hrsh7th/cmp-cmdline") -- cmdline completions
  use("hrsh7th/nvim-cmp") -- The completion plugin
  -- snippet completions

  -- snippets
  use("L3MON4D3/LuaSnip") --snippet engine
  use("saadparwaiz1/cmp_luasnip")
  use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

  -- lsp
  use({
    "williamboman/nvim-lsp-installer",
    "neovim/nvim-lspconfig",
  })
  use("jose-elias-alvarez/null-ls.nvim")

  -- Telescope
  use({
    "nvim-telescope/telescope.nvim",
    tag = "0.1.0",
  })

  -- Comment
  use({
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  })

  -- Treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
  })

  -- Smooth scroll
  use("karb94/neoscroll.nvim")

  -- Nvim tree
  use({
    "kyazdani42/nvim-tree.lua",
    requires = {
      "kyazdani42/nvim-web-devicons", -- optional, for file icons
    },
    tag = "nightly", -- optional, updated every week. (see issue #1193)
  })

  -- Bufferline
  use({ "akinsho/bufferline.nvim", tag = "v2.*", requires = "kyazdani42/nvim-web-devicons" })

  -- Autopairs
  use({
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  })
  use({
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
  })

  -- Project
  use({
    "ahmedkhalf/project.nvim",
  })
  -- Which-key
  use({
    "folke/which-key.nvim",
  })
  use({ "gpanders/editorconfig.nvim" })
end)

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
  use({ "projekt0n/github-nvim-theme" })
  use("folke/tokyonight.nvim")

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
  use("JoosepAlviste/nvim-ts-context-commentstring")
  use({
    "numToStr/Comment.nvim",
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
    "nvim-tree/nvim-tree.lua",
    requires = {
      "nvim-tree/nvim-web-devicons", -- optional, for file icons
    },
    tag = "nightly", -- optional, updated every week. (see issue #1193)
  })

  -- Bufferline
  use({ "akinsho/bufferline.nvim", tag = "v2.*", requires = "kyazdani42/nvim-web-devicons" })

  -- Autopairs
  use({
    "windwp/nvim-autopairs",
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
  use({
    "akinsho/toggleterm.nvim",
    tag = "v2.*",
  })

  -- Gitsigns
  use({
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        signs = {
          add = { text = "+" },
          change = { text = "~" },
          delete = { text = "_" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
          untracked = { text = "┆" },
        },
        signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
        numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
        linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
        word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
        watch_gitdir = {
          interval = 1000,
          follow_files = true,
        },
        attach_to_untracked = true,
        current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
          delay = 1000,
          ignore_whitespace = false,
        },
        current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil, -- Use default
        max_file_length = 40000, -- Disable if file is longer than this (in lines)
        preview_config = {
          -- Options passed to nvim_open_win
          border = "single",
          style = "minimal",
          relative = "cursor",
          row = 0,
          col = 1,
        },
        yadm = {
          enable = false,
        },
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map("n", "]c", function()
            if vim.wo.diff then
              return "]c"
            end
            vim.schedule(function()
              gs.next_hunk()
            end)
            return "<Ignore>"
          end, { expr = true })

          map("n", "[c", function()
            if vim.wo.diff then
              return "[c"
            end
            vim.schedule(function()
              gs.prev_hunk()
            end)
            return "<Ignore>"
          end, { expr = true })

          -- Actions
          map({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>")
          map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>")
          map("n", "<leader>hS", gs.stage_buffer)
          map("n", "<leader>hu", gs.undo_stage_hunk)
          map("n", "<leader>hR", gs.reset_buffer)
          map("n", "<leader>hp", gs.preview_hunk)
          map("n", "<leader>hb", function()
            gs.blame_line({ full = true })
          end)
          map("n", "<leader>tb", gs.toggle_current_line_blame)
          map("n", "<leader>hd", gs.diffthis)
          map("n", "<leader>hD", function()
            gs.diffthis("~")
          end)
          map("n", "<leader>td", gs.toggle_deleted)

          -- Text object
          map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
        end,
      })
    end,
  })
  use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })
end)
